#!/usr/bin/env bash
# lint.sh: enforce the write-tech-docs rules on a markdown doc.
#
# Fails (exit 1) if the file contains AI tells:
#   - em dashes (U+2014) or " -- " pseudo-dashes
#   - banned tell-words (case-insensitive, whole word)
#   - a prose paragraph over 100 words (the "novella" check)
#
# Code blocks and inline code are stripped first, so commands and identifiers
# are never flagged.
#
# Usage:  bash scripts/lint.sh path/to/file.md
#         Run it on every doc you write or edit. Fix every hit, then re-run
#         until it passes. This is mandatory, not optional.
set -uo pipefail

file="${1:-}"
if [[ -z "$file" ]]; then
  echo "lint: missing file argument" >&2
  echo "usage: lint.sh <file>" >&2
  exit 2
fi
if [[ ! -f "$file" ]]; then
  echo "lint: not a file: $file" >&2
  exit 2
fi

# Strip fenced code blocks and inline code so code is never flagged.
tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT
awk '/^```/{c=!c; next} c{next} {gsub(/`[^`]*`/,""); print}' "$file" > "$tmp"

hits=0
echo "lint: $file"

# 1. Em dashes (U+2014) and " -- " pseudo-dashes. Banned outright.
n=$(grep -cP '\x{2014}| -- ' "$tmp" || true)
grep -nP '\x{2014}| -- ' "$tmp" | sed 's/^/  [em-dash] /' || true
hits=$((hits + n))

# 2. Banned tell-words (case-insensitive, whole word). Conservative list:
#    unambiguous AI tells only, to keep false positives low.
words="powerful robust elegant seamless seamlessly comprehensive cutting-edge \
state-of-the-art revolutionary game-changing next-generation blazing-fast \
lightning-fast intuitive effortless frictionless ultimate stunning beautiful \
incredible leverage utilize unlock empower supercharge revolutionize \
streamline elevate delve tapestry realm landscape moreover furthermore \
truly incredibly"
regex="$(printf '%s' "$words" | tr -s ' ' '\n' | paste -sd'|' -)"
n=$(grep -ciEw "$regex" "$tmp" || true)
grep -niEw "$regex" "$tmp" | sed 's/^/  [tell-word] /' || true
hits=$((hits + n))

# 3. Prose paragraphs over 100 words. Skips headings, lists, tables, quotes.
long="$(awk -v max=100 '
  /^[[:space:]]*$/            { flush(); next }
  /^[[:space:]]*#/            { flush(); next }
  /^[[:space:]]*[-*+][[:space:]]/ { flush(); next }
  /^[[:space:]]*\|/           { flush(); next }
  /^[[:space:]]*>/            { flush(); next }
  { w += NF; if (!s) s = NR }
  function flush() {
    if (w > max) printf "  [too-long] %d-word paragraph at line %s\n", w, s
    w = 0; s = 0
  }
' "$tmp")"
printf '%s\n' "$long" | grep -c . >/dev/null && { printf '%s\n' "$long"; hits=$((hits + $(printf '%s\n' "$long" | grep -c .))); }

echo "lint: $hits hit(s)"
if [[ "$hits" -gt 0 ]]; then
  exit 1
fi
