---
name: write-reddit-post
description: "Always use this skill for writing Reddit posts, never write one without it."
---

# write-reddit-post

Write a focused Reddit post that links to something the user built. It is a pitch for the link. It is not a press release, and it is not documentation.

## The whole game

You are a peer talking to peers, not a professor lecturing. The reader does not yet know they have a problem. Your job is to mirror an experience they already have, so they recognize themselves and think "wait, I do that too." That recognition is what gets them to click. Everything else is filler.

The repo has a README. Do not reproduce it.

## First-person voice

Write as the author, in first person, throughout. "I" should run through the whole post. The opening may set the scene first ("In [context], I kept...") before the first "I" lands, as long as a real person is talking, not a product page.

## The problem (required, ask if missing)

The post opens by mirroring the reader's experience. Make the problem vivid and specific, not abstract. Give two or three concrete moments the reader has lived: when X happens, you catch yourself doing Y, and you feel Z. Those beats are what make a stranger nod and keep reading.

Then, in a sentence or two: what you already used, what it cost you, where it fell short, and why you built this. End that beat with the general approach in one plain line.

This must come from the user, in this conversation. Do not lift it from an existing draft, the README, or the source code, and do not infer the author's motivation. Reading the source to understand what the project does is fine; using it as the story is not.

If the user has not given you the problem and the lived experience, stop and ask before writing a single line. Ask a few short questions: what were you doing when you decided to build this? What did you already use, and what did you like about it? What were the specific moments that bugged you? When did you first think "there has to be a way"? Then wait. Do not write the post until you have real answers. A flat true story beats polished fiction.

## Length

Focused, not tiny. Two or three short paragraphs. Aim for about 150 words. The linter fails past 175. The vivid problem is what earns the length; cut anything that is not the reader recognizing their own experience.

## Shape

- Title: the project name, then what it does and the payoff for the reader. "[Project]: [what it does] so you can [the thing they want]."
- First paragraph: the problem, vivid. Two or three specific, recognizable scenarios, first person.
- Second paragraph: what you already used, what it cost, where it fell short, your motivation, and the general approach in one plain line.
- The link.
- A caveat only when it changes whether someone should bother clicking.

No feature list. No requirements, license, or palettes. No "how it works." No "what's next." No closing question unless it rises on its own.

## Title hook

The title is the hook. Make a stranger want to click.

- Payoff hook (default): name what the tool does and the payoff for the reader. "[Project]: [mechanism] so you can [stop doing the annoying thing]." The "so you can..." is the hook.
- Or tension: the relatable friction and a turn. "I [used the common thing], but [one specific annoyance], so I [did something about it]."
- Specific beats generic. One concrete detail sticks; a vague claim does not.
- If the title reads like a flat summary, rewrite it.

## Hard rules

These are not preferences.

1. **No em dashes.** Use a comma, period, or parentheses.
2. **Full first person, always.** Write as the author, in first person, throughout. Never drop the "I" from a sentence about your own actions.
3. **Plain text, no markdown.** No bold, headers, italics, backticks, or asterisks. Paragraphs separated by blank lines. Paste bare URLs.
4. **No semicolons.**
5. **No hashtags.**
6. **No documentation.** No features, options, config, requirements, license, palettes, or implementation details. That is the README's job. Name only the general technique, in one line.
7. **No formulaic transitions or signposting.** Cut "moreover," "furthermore," "however," "hence," "in conclusion," "in summary," "it's worth noting."
8. **No hedging filler.** Cut "just," "really," "very," "actually," "basically," "literally," "probably," "maybe."
9. **Cut "that" when it is filler.** "I thought that it was slow" becomes "I thought it was slow."
10. **Run the linter before you finish.** `bash scripts/lint.sh <file>`. Fix every hit. Re-run until it exits 0.

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

Humble and plain. Say what it does and stop. Do not oversell. A caveat is fine when it changes whether someone should click. No mandated closing question.

## Banned words (reference)

Never use these. The linter flags them.

delve, embark, enlightening, esteemed, craft, crafting, imagine, realm, game-changer, unlock, discover, skyrocket, abyss, revolutionize, disruptive, utilize, utilizing, dive deep, tapestry, illuminate, unveil, pivotal, intricate, elucidate, shed light, harness, exciting, groundbreaking, cutting-edge, remarkable, navigate, navigating, landscape, stark, testament, moreover, furthermore, however, hence, boost, skyrocketing, ever-evolving, powerful, "not just X but also Y", "in a world where", "in conclusion", "in summary".

Note: function words like "it," "that" (as a pronoun), "can," and "may" are fine. Banning them backfires and makes prose read stiffer, which is more AI, not less.

## Lint gate

`bash scripts/lint.sh <file>` fails on: em dashes, markdown formatting, semicolons, hashtags, banned words, sentences that drop the leading "I", runs of short choppy sentences, and body over 175 words. Run it on the draft. Fix every hit. Re-run until it passes.
