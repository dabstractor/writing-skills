---
name: reddit-launch
description: "Write a Reddit post announcing a new project, framework, or tool. Personal 'why I built this' first-person narrative that reads as human, not AI. Use when asked to write a reddit post to launch, announce, or show off something the user built."
---

# reddit-launch

Write a Reddit post (think r/programming, r/selfhosted, r/webdev) announcing something the user built. The post must read like one person talking to other people, not like marketing or AI output. Reddit readers spot AI writing fast, so the bar is high.

The whole thing rests on a personal story: why the user built this. Without that, the post is an ad and dies.

## What a launch post is

A person describing a problem they personally hit, what they built to fix it, and what they want feedback on. The goal is to connect and identify with the reader, not to sell.

## Hard rules

These are not preferences.

1. **No em dashes.** Use a comma, period, or parentheses. The linter fails on any em dash.
2. **Full first person, always.** Every sentence about the author's own actions starts with "I". Never drop it.
   - Bad: Built this last weekend. Made a tool for X. Decided to open source it.
   - Good: I built this last weekend. I made a tool for X. I decided to open source it.
   - Use "we" only if a real team built it. Default to "I".
3. **Plain text, no markdown.** No bold, no headers, no italics, no backticks, no asterisks. Paragraphs separated by blank lines. Use "-" or a bullet for a list only when a list is genuinely clearer than prose. Paste bare URLs. Reddit renders this fine and it reads like a person typed it.
4. **No semicolons.** Use a period or a comma.
5. **No hashtags.**
6. **No formulaic transitions or signposting.** Cut "moreover," "furthermore," "however," "hence," "in conclusion," "in summary," "it's worth noting," "remains to be seen."
7. **No hedging filler.** Cut "just," "really," "very," "actually," "basically," "literally," "probably," "maybe," "certainly." Say the thing.
8. **Cut "that" when it is filler.** "I thought that it was slow" becomes "I thought it was slow." Keep "that" as a pronoun ("I knew that") when it reads better.
9. **Run the linter before you finish.** `bash scripts/lint.sh <file>`. Fix every hit. Re-run until it exits 0.

## The story (required)

Open with one concrete, real moment. A bug at 3am. A task you kept repeating. A tool that almost worked but did not do the one thing you needed. It does not need drama. "I kept hitting X, so I built Y" is enough.

If the user gives you no story, ask for one: what were they doing when the frustration hit, what did they try first, what was the moment they decided to build it themselves. Do not invent details. A bland true story beats a polished fake one.

## Flow (avoid choppiness)

Short, uniform sentences read robotic. Human prose flows and varies in length. Apply these until the post reads natural aloud.

- Do not start a sentence with "So", "And", "But", "Then" when it just continues the previous thought. Merge them, or rewrite with subordination. The linter flags these.
  - Choppy: "I wanted something for a second monitor. So I wrote Loglet."
  - Flows: "I wrote Loglet because I wanted something for a second monitor."
- Subordinate related ideas. Cause becomes "because" or "since". Purpose becomes "so that". Time becomes "when" or "while".
- Do not repeat the subject pronoun across coordinated verbs. "It tails files and it shows the last lines" becomes "It tails files and shows the last lines."
- Use a colon and an infinitive to define or emphasize one job. "It has exactly one job: to tail files and show the last N lines per source."
- Vary sentence length on purpose. Mix a short punchy line with longer flowing ones. A post where every sentence is six to nine words reads as AI. The linter flags runs of three or more short sentences.
- Spartanness is about filler, not length. Cut "just", "really", "that" as filler. Do not force every sentence short. A clean twenty-word sentence beats two choppy eight-word ones.

## Voice

Humble and honest. Say what the project does and what it does not do yet. Do not oversell. Do not bash existing tools; say what was missing for your case. End with one specific, real question for readers. Do not end with "Let me know your thoughts!" or "Feedback welcome!" Those sign-offs are tells.

## Shape of the post

- Title: casual. "I built X" or "X: a tool for Y." No superlatives, no clickbait.
- First paragraph: the problem you personally hit.
- Second: what you built, in one or two plain sentences, with a link.
- Third: why existing options fell short for you, stated plainly.
- Fourth (optional): one technical detail worth sharing.
- Last: what is missing, what is next, one real question.

Keep it tight, but let sentences flow and vary in length. A few paragraphs. Resist the urge to document every feature. That is what the README is for.

## Banned words (reference)

Never use these. The linter flags them.

delve, embark, enlightening, esteemed, craft, crafting, imagine, realm, game-changer, unlock, discover, skyrocket, abyss, revolutionize, disruptive, utilize, utilizing, dive deep, tapestry, illuminate, unveil, pivotal, intricate, elucidate, shed light, harness, exciting, groundbreaking, cutting-edge, remarkable, navigate, navigating, landscape, stark, testament, moreover, furthermore, however, hence, boost, skyrocketing, ever-evolving, powerful, "not just X but also Y", "in a world where", "in conclusion", "in summary".

Note: function words like "it," "that" (as a pronoun), "can," and "may" are fine. Banning them backfires and makes prose read stiffer, which is more AI, not less. Do not ban them.

## Lint gate

`bash scripts/lint.sh <file>` fails on: em dashes, markdown formatting, semicolons, hashtags, banned words, and sentences that drop the leading "I". Run it on the draft. Fix every hit. Re-run until it passes. Mandatory.
