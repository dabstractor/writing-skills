---
name: write-reddit-post
description: "Always use this skill for writing Reddit posts, never write one without it."
---

# write-reddit-post

Write a short Reddit post that links to something the user built. It is a pitch for the link. It is not a press release, and it is not documentation.

## The whole game

You are a peer talking to peers, not a professor lecturing. The reader does not yet know they have a problem. Your job is to mirror an experience they already have, so they recognize themselves and think "wait, I do that too." That recognition is what gets them to click. Everything else is filler.

The repo has a README. Do not reproduce it. The post says three things and stops: a personal anecdote that mirrors the reader's experience, the link, and one line on the general idea of the fix.

## Start with "I"

The first sentence the reader sees starts with "I". Not the project name, not a general claim about the world. "I" puts you on the reader's level and grounds the post in a real experience. The linter fails if the opening does not start with "I".

## The anecdote (required, ask if missing)

The anecdote is the post. It must come from the user, in this conversation. Do not lift one from an existing draft, the README, or the source code. Do not infer or guess what the author's motivation might have been. Reading the source to understand what the project does is fine; using it as the story is not.

The shape that works: I [used the common thing, or had the usual routine], but I [kept hitting one specific friction], and I wondered if there was a better way. Then the turn ("it turns out, there was," or "so I built it"), then the link. The friction has to be nearly universal for people like the reader. If only the author would notice it, it is the wrong hook.

If the user has not told you the story, stop and ask before writing a single line. Ask a few short questions: what were you doing when you decided to build this? What did you already use, and what did you like about it? What was the one thing that kept bugging you? When did you first think "there has to be a way"? Then wait. Do not write the post until you have real answers. A flat true story beats polished fiction.

## Length

Short. The anecdote is often the whole title. One short paragraph of body at most. Aim for about 80 words. The linter fails past 100.

## Shape

- Title: the anecdote itself, or its hook. The "I ... but ... I wondered ..." line often works as a title on its own.
- First line of body: the anecdote, starting with "I", mirroring a nearly-universal experience.
- The link.
- Optionally, one sentence on the general technique: the concept of the fix in plain words, not the implementation.

No feature list. No requirements, license, or palettes. No "how it works." No "why existing tools fell short." No "what's next." No closing question unless it rises on its own.

## Hard rules

These are not preferences.

1. **Open with "I".** The first sentence starts with "I". Peer voice, not professor voice. The linter enforces this.
2. **No em dashes.** Use a comma, period, or parentheses.
3. **Full first person, always.** Every sentence about the author's own actions starts with "I". Never drop it.
4. **Plain text, no markdown.** No bold, headers, italics, backticks, or asterisks. Paragraphs separated by blank lines. Paste bare URLs.
5. **No semicolons.**
6. **No hashtags.**
7. **No documentation.** No features, options, config, requirements, license, palettes, or implementation details. That is the README's job. Name only the general technique, in one line.
8. **No formulaic transitions or signposting.** Cut "moreover," "furthermore," "however," "hence," "in conclusion," "in summary," "it's worth noting."
9. **No hedging filler.** Cut "just," "really," "very," "actually," "basically," "literally," "probably," "maybe."
10. **Cut "that" when it is filler.** "I thought that it was slow" becomes "I thought it was slow."
11. **Run the linter before you finish.** `bash scripts/lint.sh <file>`. Fix every hit. Re-run until it exits 0.

## Audience

Pick one primary subreddit and write the post for it. The post is a single piece of content: you cross-post the exact same post anywhere else. Never write different versions per subreddit.

- If the user named one subreddit, that is the primary.
- If they named several, treat the best fit as the primary and cross-post the identical post to the rest. Do not tailor per sub.
- If they named none, ask for the primary target. Suggest a couple that fit based on what the project is and who would care (for a developer tool: r/programming, r/webdev, r/selfhosted, r/commandline, r/sysadmin, r/linux, or the language or framework's own sub). Pick the best single fit.
- Write to the primary sub's technical level, and check its rules for anything that could get the post removed or buried: self-promotion limits, no blog links, a required title format, a flair.

## Flow (avoid choppiness)

Short does not mean staccato. Human prose flows and varies in length.

- Join a sentence that continues or contrasts the previous one with a comma, not a period. "The slow part is not the build. It's the context switch." becomes "The slow part is not the build, it's the context switch." If the second sentence starts with "It's," "It is," or "That's" and refers back, you almost always want a comma.
- Do not start a sentence with "So," "And," "But," or "Then" when it continues the previous thought. Merge it, or rewrite with subordination. The linter flags these.
- Subordinate related ideas. Cause becomes "because" or "since." Purpose becomes "so that." Time becomes "when" or "while."
- Do not repeat the subject pronoun across coordinated verbs. "It does X and it does Y" becomes "It does X and does Y."
- Vary sentence length on purpose. The linter flags runs of three or more short sentences.

## Voice

Humble and plain. Say what it does and stop. Do not oversell. Include a caveat only when it changes whether someone should bother clicking. No mandated closing question.

## Banned words (reference)

Never use these. The linter flags them.

delve, embark, enlightening, esteemed, craft, crafting, imagine, realm, game-changer, unlock, discover, skyrocket, abyss, revolutionize, disruptive, utilize, utilizing, dive deep, tapestry, illuminate, unveil, pivotal, intricate, elucidate, shed light, harness, exciting, groundbreaking, cutting-edge, remarkable, navigate, navigating, landscape, stark, testament, moreover, furthermore, however, hence, boost, skyrocketing, ever-evolving, powerful, "not just X but also Y", "in a world where", "in conclusion", "in summary".

Note: function words like "it," "that" (as a pronoun), "can," and "may" are fine. Banning them backfires and makes prose read stiffer, which is more AI, not less.

## Lint gate

`bash scripts/lint.sh <file>` fails on: an opening that does not start with "I", em dashes, markdown formatting, semicolons, hashtags, banned words, sentences that drop the leading "I", runs of short choppy sentences, and body over 100 words. Run it on the draft. Fix every hit. Re-run until it passes.
