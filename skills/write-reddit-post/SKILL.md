---
name: write-reddit-post
description: "Always use this skill for writing Reddit posts, never write one without it."
---

# write-reddit-post

Write a short Reddit post that links to something the user built. It is a pitch for the link. It is not a press release, and it is not documentation.

## The whole game

The entire goal is to describe the problem the user had in a way that other people recognize instantly. If a reader thinks "yes, I hate that too," they click the link. That is the whole post. Everything else is filler.

The repo already has a README. Do not reproduce it. The post says three things and stops: the problem, the link, and the general idea of the fix.

## Length

Short. A handful of sentences, one or two short paragraphs. The link goes near the top, not three paragraphs in. Aim for about 80 words of body. The linter fails past 120.

## Shape

- Title: a short hook, or the project name.
- Open with the problem, phrased so a reader recognizes it at once. First person, concrete, one or two sentences.
- The link.
- At most one sentence on the general technique: what you do conceptually, not how it is built. "I recolor the whole status line by mode, so a glance tells you where you are." Then stop.

That is the whole post. No feature list. No requirements, license, or palettes. No "how it works." No "why existing tools fell short." No "what's next." No closing question unless it rises on its own.

## Hard rules

These are not preferences.

1. **No em dashes.** Use a comma, period, or parentheses. The linter fails on any em dash.
2. **Full first person, always.** Every sentence about the author's own actions starts with "I". Never drop it.
3. **Plain text, no markdown.** No bold, no headers, no italics, no backticks, no asterisks. Paragraphs separated by blank lines. Paste bare URLs.
4. **No semicolons.**
5. **No hashtags.**
6. **No documentation.** No features, options, config, requirements, license, palettes, or implementation details. That is the README's job. Name only the general technique, in one line.
7. **No formulaic transitions or signposting.** Cut "moreover," "furthermore," "however," "hence," "in conclusion," "in summary," "it's worth noting."
8. **No hedging filler.** Cut "just," "really," "very," "actually," "basically," "literally," "probably," "maybe." Say the thing.
9. **Cut "that" when it is filler.** "I thought that it was slow" becomes "I thought it was slow."
10. **Run the linter before you finish.** `bash scripts/lint.sh <file>`. Fix every hit. Re-run until it exits 0.

## Audience

A post lands or flops based on fitting the subreddit. Know the audience before you write.

- If the user named the subreddit, write to that community's norms and technical level.
- If they did not, ask which subreddits they plan to post in. Suggest two or three that fit, based on what the project is and who would care. For a developer tool, candidates include r/programming, r/webdev, r/selfhosted, r/commandline, r/sysadmin, r/linux, or the language or framework's own sub (r/python, r/rust, r/golang, r/javascript, r/reactjs). Pick the ones that actually match. Do not list all of them.
- Match depth to the room. Even a short post can be too technical, or not technical enough.
- Read the room. Each sub has rules and a culture. Flag anything that could get the post removed or buried: self-promotion limits, no blog links, a required title format, a flair.

## The problem

The problem is the post. Open on it. If the user gave you one, use it. If not, ask: what is the specific thing that kept biting you? Get one concrete moment, the kind that makes a stranger say "oh, that." Do not invent.

## Flow (avoid choppiness)

Short does not mean staccato. Human prose flows and varies in length. Apply these until the post reads natural aloud.

- Join a sentence that just continues or contrasts the previous one with a comma, not a period. "The expensive part is not the keybindings. It's the half-second where you check your state." becomes "The expensive part is not the keybindings, it's the half-second where you check your state." If the second sentence starts with "It's," "It is," or "That's" and refers back, you almost always want a comma.
- Do not start a sentence with "So," "And," "But," or "Then" when it continues the previous thought. Merge it, or rewrite with subordination. The linter flags these.
- Subordinate related ideas. Cause becomes "because" or "since." Purpose becomes "so that." Time becomes "when" or "while."
- Do not repeat the subject pronoun across coordinated verbs. "It tails files and it shows the lines" becomes "It tails files and shows the lines."
- Vary sentence length on purpose. Mix a short punchy line with a longer flowing one. The linter flags runs of three or more short sentences.

## Voice

Humble and plain. Say what it does and stop. Do not oversell. Include a caveat only when it changes whether someone should bother clicking, for example "works with most statuslines, but not full powerline themes." No mandated closing question.

## Banned words (reference)

Never use these. The linter flags them.

delve, embark, enlightening, esteemed, craft, crafting, imagine, realm, game-changer, unlock, discover, skyrocket, abyss, revolutionize, disruptive, utilize, utilizing, dive deep, tapestry, illuminate, unveil, pivotal, intricate, elucidate, shed light, harness, exciting, groundbreaking, cutting-edge, remarkable, navigate, navigating, landscape, stark, testament, moreover, furthermore, however, hence, boost, skyrocketing, ever-evolving, powerful, "not just X but also Y", "in a world where", "in conclusion", "in summary".

Note: function words like "it," "that" (as a pronoun), "can," and "may" are fine. Banning them backfires and makes prose read stiffer, which is more AI, not less.

## Lint gate

`bash scripts/lint.sh <file>` fails on: em dashes, markdown formatting, semicolons, hashtags, banned words, sentences that drop the leading "I", runs of short choppy sentences, and body over 120 words. Run it on the draft. Fix every hit. Re-run until it passes.
