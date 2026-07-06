#!/usr/bin/env bash
# lint.sh: enforce the reddit-launch rules on a post.
#
# Fails (exit 1) on:
#   - em dashes (U+2014) or " -- " pseudo-dashes
#   - markdown formatting: #, *, **, backticks
#   - hashtags
#   - semicolons
#   - banned tell-words and phrases
#   - sentences that drop the leading "I" (e.g. "Built this" not "I built this")
#
# Usage:  bash scripts/lint.sh path/to/post.md
set -uo pipefail

file="${1:-}"
if [[ -z "$file" ]]; then
  echo "lint: missing file argument" >&2
  echo "usage: lint.sh <file>" >&2
  exit 2
fi
[[ -f "$file" ]] || { echo "lint: not a file: $file" >&2; exit 2; }

# Strip fenced code blocks and inline code.
tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT
awk '/^```/{c=!c; next} c{next} {gsub(/`[^`]*`/,""); print}' "$file" > "$tmp"

hits=0
echo "lint: $file"

# 1. Em dashes and " -- " pseudo-dashes.
n=$(grep -cP '\x{2014}| -- ' "$tmp" || true)
grep -nP '\x{2014}| -- ' "$tmp" | sed 's/^/  [em-dash] /' || true
hits=$((hits + n))

# 2. Markdown: headers, bold, italics/bullets, inline code.
n=$(grep -cP '`' "$tmp" || true); grep -nP '`' "$tmp" | sed 's/^/  [backtick] /' || true; hits=$((hits+n))
n=$(grep -cP '\*' "$tmp" || true); grep -nP '\*' "$tmp" | sed 's/^/  [asterisk] /' || true; hits=$((hits+n))
n=$(grep -cE '^[[:space:]]*#' "$tmp" || true); grep -nE '^[[:space:]]*#' "$tmp" | sed 's/^/  [header] /' || true; hits=$((hits+n))

# 3. Hashtags: space-or-start then #word. Ignores C# and F# (letter before #).
n=$(grep -cP '(^|\s)#[A-Za-z]' "$tmp" || true); grep -nP '(^|\s)#[A-Za-z]' "$tmp" | sed 's/^/  [hashtag] /' || true; hits=$((hits+n))

# 4. Semicolons.
n=$(grep -c ';' "$tmp" || true); grep -n ';' "$tmp" | sed 's/^/  [semicolon] /' || true; hits=$((hits+n))

# 5. Banned words and phrases.
words="delve embark enlightening esteemed craft crafting imagine realm unlock \
discover skyrocket abyss revolutionize disruptive utilize utilizing tapestry \
illuminate unveil pivotal intricate elucidate harness exciting groundbreaking \
cutting-edge remarkable navigate navigating landscape stark testament moreover \
furthermore however hence boost skyrocketing ever-evolving powerful"
regex="$(printf '%s' "$words" | tr -s ' ' '\n' | paste -sd'|' -)"
n=$(grep -ciEw "$regex" "$tmp" || true); grep -niEw "$regex" "$tmp" | sed 's/^/  [tell-word] /' || true; hits=$((hits+n))

phrases='not just.{0,20}but also|in a world where|in conclusion|in summary|remains to be seen|dive deep|shed light|game.?changer'
n=$(grep -ciE "$phrases" "$tmp" || true); grep -niE "$phrases" "$tmp" | sed 's/^/  [tell-phrase] /' || true; hits=$((hits+n))

# 6. Dropped leading "I": a sentence that starts with a bare past-tense verb.
verbs='Built|Made|Wrote|Created|Started|Decided|Wanted|Needed|Spent|Found|Realized|Thought|Figured|Tried|Learned|Released|Published|Launched|Ended|Noticed|Shipped|Rewrote|Finished|Kept|Hated|Wound'
dropped="$(sed 's/[.!?]\+/&\n/g' "$tmp" | grep -nE "^[[:space:]]*([-•][[:space:]]*)?($verbs)([[:space:]]|$)" || true)"
if [[ -n "$dropped" ]]; then
  printf '%s\n' "$dropped" | sed 's/^/  [dropped-I] /'
  hits=$((hits + $(printf '%s\n' "$dropped" | grep -c .)))
fi

echo "lint: $hits hit(s)"
[[ "$hits" -gt 0 ]] && exit 1
exit 0
