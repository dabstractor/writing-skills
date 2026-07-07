---
name: write-pull-request
description: "Write a pull request to an open source repository. Lead with the user-facing problem in a personal voice, then a scannable technical fix. Use when opening or drafting a PR or contribution."
---

# write-pull-request

Write a pull request, most often to an open source project, sometimes to an internal one. The audience is the maintainer: busy, protective of the codebase, and allergic to filler.

A good PR is a little bit reddit (a person explaining what they hit), a little bit readme (clear, scannable, technical), and a little bit git commit message (terse, imperative, signal-dense). Lean technical, written in a personal voice. For open source that voice is also warm and personal; for an enterprise project it reads like technical docs, terse and factual with no regard for feelings. Most PRs are open source.

Before writing anything else, do two things: read the diff so you know exactly what changed, and check for a linked issue.

## Diff first

Read the actual change before you write a word of the description. Do not describe a fix you have not seen in the diff.

Figure out the right comparison if nobody specified it, so you understand the exact scope:
- On a feature branch, diff against the base branch, usually `main` or `master`. Use the merge base to see only this branch's changes: find it with `git merge-base HEAD <base>`, then diff from that commit to HEAD.
- For unpushed commits, review `git log <upstream>..HEAD` and `git diff <upstream>...HEAD`.
- For uncommitted work, use `git diff` and `git diff --staged`.

Find the default branch if you do not know it (`git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null`, or inspect `origin`). Read the whole diff. The "what this changes" section must match the real diff, change for change. If something is not in the diff, do not claim it.

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
- **Opener (open source only)**: one genuine line. A specific compliment about the project and thanks to the maintainers. Skip entirely for enterprise PRs.
- **Problem**: the user-POV story above, or a one-line pointer to the issue.
- **What this changes**: the fix, in a short scannable list. Technical, precise, one bullet per logical change, imperative.
- **Why this way**: only if the choice is non-obvious. A sentence or two on the approach and the alternatives you rejected.
- **Testing**: what you ran, and how a reviewer can verify. Real commands and real test names.
- **Issue**: `Fixes #N`.
- **Notes**: breaking changes, migration steps, perf, anything the reviewer must know. Omit the section entirely if there is nothing to say.

Match the scope to the change. A one-line fix earns a title, a one-line problem, and the diff reference, not a full template. Do not pad with empty sections. For open source, lead with the warm prose and use these sections only as much as the change needs. For enterprise, this structured template is the default.

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
11. **Diff before you write.** Read the full diff first and base the description on it. Never claim a change that is not in the diff.
12. **Open source: be a person, not a pitch.** Warm, casual, first-time-contributor voice. Read the room (issues, `wontfix`, out-of-scope notes) and acknowledge their stance. For unsolicited work, frame it as "I built it for myself, sharing in case it helps." No sales pitch, no groveling. See Tone and Examples.

## Tone: open source vs enterprise

Figure out which kind of project this is. Open source signals: a public remote (github.com, gitlab.com, and the like), a LICENSE file, a CONTRIBUTING.md, public issues. Enterprise signals: an internal git host, a private repo, no LICENSE. If you cannot tell, ask, or assume open source, since most PRs are.

**Open source: be a person, not a pitch.** You are a first-time contributor who loves the tool, talking to the people who built it. Write warm, casual, and genuine, the way you would email a stranger whose work you admire. Maintainers are often volunteers and always busy; a stiff corporate tone or a sales pitch gets you ignored or rejected.

Three things make it land:
- **Lead with real warmth.** One genuine, specific line about why you like the project and how you use it. Not a generic "great project!" This is not enthusiasm theater. Theater is the marketing words (seamless, empowers, game-changing); warmth is "I use this every day and it saved me a bunch of time."
- **Read the room, and say what you found.** Before writing, look at issues, `wontfix` labels, out-of-scope notes, and discussions for the maintainers' stance on this change. If they have signaled reluctance or non-interest, acknowledge it plainly and respectfully, and frame the PR as something you wanted for yourself that you are sharing. Never argue the maintainer's own thesis back at them to justify the change.
- **Default to "I built it for myself."** For anything unsolicited, the honest frame is: I wanted this, I made it for my own use, I am sharing it in case it helps, no pressure to take it. That frame kills the sales pitch.

Be humble but not pathetic. A confident peer, not a supplicant groveling and not a consultant telling them their code is wrong. Offer to rework or drop it. Read CONTRIBUTING.md and match the style of their existing PRs.

**Enterprise: write it like technical docs.** Terse, factual, no politeness, no regard for feelings. Coworkers want the facts and the diff. Skip the opener entirely. The structured template (Problem, What this changes, Testing, Notes) is the default here.

For open source, do not default to the structured template. Lead with the human paragraphs, then give the technical explanation plainly, in only as much structure as the change needs.

Confident about the change, humble about anything you are unsure of (flag it explicitly).

## Examples

Good open source PRs. Notice the voice in each: warm, specific, read-the-room, then plain tech. Replace the bracketed parts with the real details; do not copy the brackets.

GOOD: unsolicited feature they were not planning:

```text
Add [what the feature does]

[Project] has [genuine, specific thing you like about it], I [how you actually use it day to day].

I [saw in #issue / read in the docs] that [the maintainers aren't planning to do this / it's out of scope], and that makes sense to me. But I kept wanting it anyway, so I built it for myself over [the weekend / a couple evenings]. No pressure at all to take it, I'm sharing it in case it's useful or sparks an idea.

What it does, roughly:
- [change 1]
- [change 2]

[how you tested it]. Happy to rework any of it, or drop it entirely if this isn't a direction you want to go.
```

GOOD: bugfix:

```text
Fix [what was broken]

Hi! [One genuine line about liking the project.]

[What happened to you, plainly] when [the exact trigger]. I had a little time so I dug in and patched it, hope it helps:
- [the fix]
- [the test you added]

[how to verify].
```

GOOD: open issue they want fixed:

```text
[Fix / implement what the issue asks for]

[Project] is [genuine specific like], [how you use it].

I saw #[N] open and it looked like something I could take a crack at, so I gave it a go. Happy to reshape it to fit how the codebase likes things.

Roughly:
- [change 1]
- [change 2]

[how to verify]. Let me know if you'd rather it land a different way.
```

GOOD: docs fix:

```text
Docs: [what was wrong]

[One genuine line about liking the project.]

I was following the [setup / usage] guide and got stuck at [the step]: [what it told you to do] no longer works because [reason]. Figured I'd fix it for the next person.

- [the doc change]

[verification, e.g., walked through the updated steps fresh].
```

GOOD: performance:

```text
Speed up [the slow thing]

[Genuine like.]

On my end [the operation] was taking [~real time] on [the case that triggered it], which felt off, so I profiled it. [The bottleneck] stood out, so I [the approach].

Roughly:
- [change 1]
- [change 2]

Down to [~new time] on my data, no behavior change. [how you benchmarked].
```

Failure modes. Do not write any of these.

BAD: the sales pitch:

```text
Add [feature]

Thank you for maintaining such an excellent project!

This pull request introduces [feature], delivering a more seamless and intuitive [experience / workflow]. By leveraging [approach], this change empowers users to [benefit]. This enhancement aligns strongly with the project's vision.
```

BAD: the enterprise spec (no human voice):

```text
Add [feature]

## Problem
[Project]'s stated scope is [X]. [Feature] constitutes a critical component of [Y], and its absence introduces a significant gap in [Z]...
```

BAD: the presumptuous refactor:

```text
Refactor [module] for cleanliness

The [module] code is quite messy and hard to maintain. This PR cleans it up by [approach], making it more robust and elegant. You really should adopt this pattern across the codebase.
```

BAD: the over-grovel:

```text
Add [feature]

First of all I'm so sorry if this is terrible, I'm just a beginner and I'm sure my code is awful. Please don't be mad. I know you probably won't want this but I tried my best...
```

## Banned words (reference)

Never use these. The linter flags them.

powerful, robust, elegant, seamless, comprehensive, cutting-edge, state-of-the-art, revolutionary, game-changing, next-generation, blazing-fast, lightning-fast, intuitive, effortless, frictionless, ultimate, stunning, beautiful, incredible, leverage, utilize, unlock, empower, supercharge, revolutionize, streamline, elevate, delve, tapestry, realm, moreover, furthermore, truly, incredibly.

## Lint gate

`bash scripts/lint.sh <file>` fails on: em dashes, banned tell-words, and a title that ends with a period or runs past 80 characters. Run it on the draft. Fix every hit. Re-run until it passes.
