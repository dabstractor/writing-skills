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

Write out "I had" rather than contracting it to "I'd." "I'd" for "I would" is fine; "I'd" for "I had" reads stiff.

## Apprehension

Write like someone who doesn't fully know what they're doing but did it anyway. Show it. Admit the mistakes and confusion that led to building the thing ("I kept accidentally…", "I'd forget…", "I didn't realize…") and admit uncertainty about the result ("my attempt," "I'm not sure this works," "I think," "ok"). A confident narrator dropping the reader into a polished scene is the tell. A fumbling confession is the goal. This matters more than any other rule here: the people who read these posts can spot confident, polished AI prose instantly, and they will tear it apart.

**Open by owning the struggle.** The first sentence names the difficulty directly and upsells it, not minimizes it. "I struggled with…", "I had a hard time with…", "I never understood…", "I spent months fighting…". Do not open by dropping into a polished action scene ("I'd zoom a pane…"), and do not minimize it ("I kept accidentally…", "it was just a small thing"). Make the frustration feel real and significant before any specifics.

- Bad (punchy scene-set, drops you in): "I'd hit the deploy key and watch the wrong thing go out, my muscle memory a step ahead of my attention."
- Good (owns the struggle first): "I struggled with this for a long time. I'd ship from the wrong branch because I kept forgetting which one I had checked out, and I had a hard time keeping track of what was actually deployed."

Both are specific. The good one admits forgetting, accident, and not-knowing. The bad one performs competence.

## The problem (required, ask if missing)

The post opens by mirroring the reader's experience, through the apprehension above: the embarrassing, recurring moments, not a polished setup. Make it vivid and specific. Give two or three concrete moments the reader has lived: when X happens, you catch yourself doing Y, and you feel Z. Those beats are what make a stranger nod and keep reading.

Then, in a sentence or two: what you already used, what it cost you, where it fell short, and why you built this. End that beat with the general approach in one plain line.

This must come from the user, in this conversation. Do not lift it from an existing draft, the README, or the source code, and do not infer the author's motivation. Reading the source to understand what the project does is fine; using it as the story is not.

If the user has not given you the problem and the lived experience, stop and ask before writing a single line. Ask a few short questions: what were you doing when you decided to build this? What did you already use, and what did you like about it? What were the specific moments that bugged you? When did you first think "there has to be a way"? Then wait. Do not write the post until you have real answers. A flat true story beats polished fiction.

## Length

Focused, not tiny. Two or three short paragraphs. Aim for about 200 words. Up to 300 if the post is genuinely complex and needs a thorough explanation. The linter fails past 350. The vivid problem and the apprehension are what earn the length; cut anything else.

## Shape

- Title: the project name, then what it does and the payoff for the reader. "[Project]: [what it does] so you can [the thing they want]."
- First paragraph: the problem, vivid and fumbling. Two or three specific, recognizable scenarios, first person.
- Second paragraph: what you already used, what it cost, where it fell short, your motivation, and the general approach in one plain line.
- The link.
- A caveat only when it changes whether someone should bother clicking.
- A sign-off (see below).

No feature list. No requirements, license, or palettes. No "how it works." No "what's next."

## Sign-off

End with a sign-off that has three parts: one specific, answerable question, a real hedge, and an outstretched arm to the community. Not a generic "what do you think?" or "I hope you find it useful." In an async broadcast, use "let me know" or "leave a comment." Not "tell me," which is in-person speech.

- Bad: "Let me know what you think! I hope you find it useful. Feedback welcome!"
- Good: "If you've got your own setup for this, let me know whether it actually holds up day to day or turns into noise. I built this for my own workflow, and I'm honestly not sure it generalizes. If you already solved this, I'd rather hear how than ship another one."

"Whether it actually holds up" is concrete and answerable; "I'm honestly not sure it generalizes" is a real hedge; "I'd rather hear how than ship another one" is the outstretched arm.

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
8. **Use hedges and softeners.** Sound human, not overconfident: "just," "only," "almost," "mostly," "relatively," "pretty much," "I think." Use "ok" freely; it is informal and natural, and models rarely use it well.
9. **Cut "that" when it is filler.** "I thought that it was slow" becomes "I thought it was slow."
10. **Run the linter before you finish.** `bash scripts/lint.sh <file>`. Fix every hit. Re-run until it exits 0.

## Prose tells

These slip past the banned-word list but read as AI. The linter catches the ones it can; the rest are judgment.

- **Coined analogy.** Bad: "the right file appears like a bartender who knows your usual." Good: "the file I needed was already at the top."
- **"on a ___ level."** Bad: "cuts wasted motion on a fundamental level." Good: "deletes the step where I rename the export by hand."
- **Root-cause wrap-up.** Bad: "every broken deploy traced to the same root: an env var." Good: "most of my broken deploys were just an env var I forgot to set."
- **Colon-thesis (enumerate, then diagnose).** Bad: "I'd merge, conflict, stash, lose an hour. The pattern was the same: stale branches." Good: "I kept losing an hour to stale branches I couldn't see."
- **Metaphor or cliché.** Bad: "my workflow had a blind spot around drafts." Good: "my workflow didn't show which notes were drafts."
- **Vague placeholder.** Bad: "I'd finish a thing and close the window." Good: "I'd finish a query and close the window."
- **Performed authenticity.** Bad: "my day-one gruvbox config had the same problem." Good: "my old config had the same problem."
- **Melodrama.** Bad: "I'd scramble to rebuild the query." Good: "I'd close a query and rewrite it five minutes later."
- **Polished aphorism.** Bad: "where other tools manage your work, this one manages your focus." Good: "instead of listing your work like other tools, this one picks the next thing to look at."

One long pair, showing all of these fixed, plus apprehension and a real sign-off:

**Bad:** I built Lately because my terminal had a real blind spot for the commands I'd just run. I'd hit Up twenty times hunting for that one docker exec, finish a thing, and scramble to retype it from memory. My day-one starship prompt didn't help either. Every lost minute traced back to the same root: my shell only remembered the recent past, not the relevant past. I wanted Lately to surface the right command on an instinctual level, the way a good autocomplete reads your mind before you finish typing, so I built it to watch what you run and float the likely next command to the top. Where other tools log your history, this one understands your intent.

**Good:** I struggled with losing commands I actually needed. I'd forget the one I wanted was three entries up, or I'd accidentally close the terminal and it was just gone. I tried a couple of history tools and they were ok, but they pretty much just logged everything in order, which didn't really help. What I wanted was the command I was about to need, already at the top. Lately is my attempt at that. It's relatively simple, and I'm honestly not sure it works outside of how I use my shell. If you try it, let me know whether it actually surfaces the right thing for you, or just adds noise. If you already have something that works, I'd rather hear about it.

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

Humble, plain, and a little unsure of itself. Say what it does and stop. Do not oversell. A caveat is fine when it changes whether someone should click. End with the sign-off.

## Banned words (reference)

Never use these. The linter flags them.

delve, embark, enlightening, esteemed, craft, crafting, imagine, realm, game-changer, unlock, discover, skyrocket, abyss, revolutionize, disruptive, utilize, utilizing, dive deep, tapestry, illuminate, unveil, pivotal, intricate, elucidate, shed light, harness, exciting, groundbreaking, cutting-edge, remarkable, navigate, navigating, landscape, stark, testament, moreover, furthermore, however, hence, boost, skyrocketing, ever-evolving, powerful, "not just X but also Y", "in a world where", "in conclusion", "in summary".

Note: function words like "it," "that" (as a pronoun), "can," and "may" are fine. Banning them backfires and makes prose read stiffer, which is more AI, not less.

## Lint gate

`bash scripts/lint.sh <file>` fails on: em dashes, markdown formatting, semicolons, hashtags, banned words, the prose-tell phrases ("on a ___ level", "blind spot", "the same root"), sentences that drop the leading "I", runs of short choppy sentences, and body over 350 words. Run it on the draft. Fix every hit. Re-run until it passes.
