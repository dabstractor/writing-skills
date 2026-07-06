#!/usr/bin/env bash
# lint.sh: enforce the write-pull-request rules on a PR draft (title line + body).
#
# Fails (exit 1) on:
#   - em dashes (U+2014) or " -- " pseudo-dashes
#   - banned tell-words (case-insensitive, whole word)
#   - a title that ends with a period or runs past 80 characters
#
# Code blocks and inline code are stripped first, so code is never flagged.
#
# Usage:  bash scripts/lint.sh path/to/pr-draft.md
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

# 2. Banned tell-words (case-insensitive, whole word).
words="powerful robust elegant seamless seamlessly comprehensive cutting-edge \
state-of-the-art revolutionary game-changing next-generation blazing-fast \
lightning-fast intuitive effortless frictionless ultimate stunning beautiful \
incredible leverage utilize unlock empower supercharge revolutionize \
streamline elevate delve tapestry realm moreover furthermore truly incredibly"
regex="$(printf '%s' "$words" | tr -s ' ' '\n' | paste -sd'|' -)"
n=$(grep -ciEw "$regex" "$tmp" || true)
grep -niEw "$regex" "$tmp" | sed 's/^/  [tell-word] /' || true
hits=$((hits + n))

# 3. Title = first non-blank line. No trailing period, and <= 80 characters.
title="$(awk 'NF{print; exit}' "$file" | sed 's/[[:space:]]*$//')"
tlen="${#title}"
case "$title" in
  *".") printf '  [title-period] title should not end with a period: %s\n' "$title"; hits=$((hits + 1)) ;;
esac
if [[ "$tlen" -gt 80 ]]; then
  printf '  [title-long] title is %s chars (max 80): %s\n' "$tlen" "$title"
  hits=$((hits + 1))
fi

echo "lint: $hits hit(s)"
if [[ "$hits" -gt 0 ]]; then
  exit 1
fi
