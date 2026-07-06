---
name: write-pull-request
description: "Write a pull request to an open source repository. Lead with the user-facing problem in a personal voice, then a scannable technical fix. Use when opening or drafting a PR or contribution."
---

# write-pull-request

Write a pull request to someone else's open source project. The audience is the maintainer: busy, protective of the codebase, and allergic to filler.

A good PR is a little bit reddit (a person explaining what they hit), a little bit readme (clear, scannable, technical), and a little bit git commit message (terse, imperative, signal-dense). Lean technical, written in a personal voice. You are a contributor talking to a maintainer, not a marketer or a lecturer.

## Issue first

If the repository has an issue for this change, read it before writing anything.

- Match the issue's phrasing in the PR title and the problem statement.
- Do not re-litigate the problem. One line pointing at the issue is enough.
- Reference it with `Fixes #123` (or `Closes` / `Resolves`, matching the project's convention).

If there is no issue, you must describe the problem yourself, from the user's point of view, before any technical solution. See the next section.

## The problem (user's point of view, required when there is no issue)

Before the fix, make the maintainer feel the problem. Describe it from the user's end: what I was trying to do, what happened instead, why that is wrong or painful. First person, concrete, a sentence or two of real experience. The maintainer should think "ah, I see why that bites."

This is not a code analysis. "The function returns null when X" is a symptom, not the problem. The problem is "when I do X, I expect Y, and I get Z." Lead with the human experience; the code comes after.

If the user has not told you what they were doing when they hit this, ask. Do not invent a user story.

## Structure

- **Title**: one imperative line, like a commit subject. `Add X`, `Fix Y when Z`, `Refactor Q`. Lowercase after the first word unless it is a proper noun. No period at the end. Scope or type prefix only if the project uses conventional commits. If an issue exists, echo its framing. Keep it under about 80 characters.
- **Problem**: the user-POV story above, or a one-line pointer to the issue.
- **What this changes**: the fix, in a short scannable list. Technical, precise, one bullet per logical change, imperative.
- **Why this way**: only if the choice is non-obvious. A sentence or two on the approach and the alternatives you rejected.
- **Testing**: what you ran, and how a reviewer can verify. Real commands and real test names.
- **Issue**: `Fixes #N`.
- **Notes**: breaking changes, migration steps, perf, anything the reviewer must know. Omit the section entirely if there is nothing to say.

Match the scope to the change. A one-line fix earns a title, a one-line problem, and the diff reference, not a full template. Do not pad with empty sections.

## Hard rules

1. **Problem before solution.** Never describe the fix before the reader understands the problem, unless an issue already does that job.
2. **No em dashes.** Use a comma, colon, period, or parentheses. The linter fails on any em dash.
3. **Title is imperative.** `Add`, `Fix`, `Update`, `Refactor`, `Support`. No period. No "This PR adds...".
4. **First person for the problem, imperative for the change.** "I ran into X" for the story. "Add a retry on timeout" for the diff.
5. **Markdown is fine here.** Headings, bullets, and code blocks are welcome. No emoji, no badges, no marketing.
6. **Do not explain the obvious.** Do not lecture the maintainer about their own codebase. Explain your change and your reasoning, not how the project works.
7. **No marketing tell-words.** Cut robust, elegant, seamless, powerful, leverage, utilize, and the rest. The change is either correct or not.
8. **No hedging or filler.** Cut "just," "really," "simply," "I thought it would be nice to." State the change.
9. **Specific and verifiable.** Real versions, real commands, real test names. Not "tested thoroughly."
10. **Run the linter before you finish.** `bash scripts/lint.sh <file>`. Fix every hit. Re-run until it exits 0.

## Voice

Plain, direct, respectful of the maintainer's time. Confident about the change, humble about anything you are unsure of (flag it explicitly). No corporate tone, no enthusiasm theater.

## Banned words (reference)

Never use these. The linter flags them.

powerful, robust, elegant, seamless, comprehensive, cutting-edge, state-of-the-art, revolutionary, game-changing, next-generation, blazing-fast, lightning-fast, intuitive, effortless, frictionless, ultimate, stunning, beautiful, incredible, leverage, utilize, unlock, empower, supercharge, revolutionize, streamline, elevate, delve, tapestry, realm, moreover, furthermore, truly, incredibly.

## Lint gate

`bash scripts/lint.sh <file>` fails on: em dashes, banned tell-words, and a title that ends with a period or runs past 80 characters. Run it on the draft. Fix every hit. Re-run until it passes.
