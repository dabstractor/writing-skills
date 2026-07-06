---
name: write-tech-docs
description: "Write or revise technical documentation (READMEs, guides, API docs, proposals, code comments) so it is clear, credible, and short, and does not read like AI output. Enforces hard rules: no em dashes, no marketing tell-words, no hedging or formulaic transitions, no narrating the codebase. Ships a linter (scripts/lint.sh) the agent must pass before finishing. Use whenever writing, rewriting, or improving any technical doc, or when prose sounds robotic, marketing-y, or 'too AI'."
---

# write-tech-docs

Goal: after reading the least text possible, the reader can do the thing. Two standards. **Clarity:** they can act. **Credibility:** every claim is earned. The enemies are vagueness, unearned enthusiasm, hedging, and narration of things the reader can already see.

Grounded in established technical-writing guidance (Google, Microsoft, and GitHub style guides; Write the Docs) and the documented patterns of LLM output.

## What this skill is NOT

This is not an AI-detector evader. Do not add "human" imperfections, sentence fragments, run-on sentences, digressions, emotional undertones, or personal opinions. Those optimize for fooling a detector, and they ruin technical clarity. The goal is invisible competence, not fake personality.

## Hard rules (non-negotiable)

These are not preferences. Violating any of them fails the doc.

1. **No em dashes. Not once.** Use a colon, parentheses, comma, or period. Before you finish, scan the output for em dashes. If any exist, rewrite those sentences. `scripts/lint.sh` enforces this.
2. **No marketing tell-words.** The full list is in the reference section. The short version: powerful, robust, elegant, seamless, comprehensive, cutting-edge, revolutionary, leverage, utilize, unlock, empower, supercharge, transform, revolutionize, streamline, elevate, delve. Cut them, or replace with evidence.
3. **No hedging or formulaic transitions.** Drop "moreover," "furthermore," "in conclusion," "to sum up," "it's worth noting," "some may argue," "it could be said," and excess "perhaps," "maybe," "likely," "tends to." If you know something, state it. If you don't, say so plainly.
4. **Do not narrate the codebase.** The reader has the code. Do not walk through files, restate implementation, or describe what "the system" does in the abstract. Document what the code cannot show on its own: what the thing is, why it exists, how to use it, and the gotchas. Then stop.
5. **Run the linter before you finish.** `bash scripts/lint.sh <your file>`. Fix every hit. Re-run until it exits 0. Mandatory.

## Concision (the novella fix)

- State the fact. Stop. No restating, no "as you can see," no "it's important to note."
- Intros: one or two sentences.
- Features: one line each. A verb and an object, not a benefit pitch.
- Prefer lists, tables, and code over prose paragraphs.
- No prose paragraph over about four sentences or 100 words. `lint.sh` flags anything over 100.
- Right-size the doc to the change. A one-line behavior change gets a one-line note, not a new section.

## Structure (readers scan, they don't read)

- Front-load the answer. The first sentence says what the thing is and whether the reader should care.
- Heading every few paragraphs. Headings are concrete tasks or statements (*Install*, *Configure logging*), not cute labels.
- Match content to container. Numbered list for steps, bullets for parallel items, table for comparisons, code block for anything literal.
- One job per section. When a section does two things, split it.
- Progressive disclosure. Summarize first, link to the detail.

## Prose

- Active voice. Name the actor. Passive is fine when the actor is irrelevant or obvious.
- Imperative mood for steps. "Run `npm install`," not "you can run npm install."
- Second person ("you") for guides. Third person for reference.
- Short words, short sentences, one idea per sentence.
- Consistent terminology. One name per concept, everywhere.
- Specific over general. `0.9.2`, not "latest." "Linux/macOS, Node 20+," not "cross-platform."
- Go easy on -ly adverbs. They pad prose and read as AI. Cut "really," "very," "highly," "incredibly."
- Replace soft modals with fact when you are certain. "This improves results," not "this might improve results."

## Show, don't assert

- Code and commands beat adjectives. "Handles 12k req/s on a t3.small (see `bench/`)," not "blazing-fast and highly scalable."
- Real, runnable examples. Not `<placeholder>` theater. Test every command you publish.

## Tone

Match the surrounding prose. Do not inject personality, humor, or exclamation marks unless the project's voice already has them. The reader should notice the information, not the writing.

## Reference: the tell-word list

Search the draft for these. Replace with something concrete, or delete.

**Over-promising adjectives:** powerful, robust, elegant, seamless, comprehensive, cutting-edge, state-of-the-art, revolutionary, game-changing, next-generation, blazing-fast, lightning-fast, lightweight (unless measured), scalable (unless demonstrated), intuitive, effortless, frictionless, modern, ultimate, perfect, stunning, beautiful, awesome, incredible.

**Empty verbs:** leverage, utilize, unlock, empower, supercharge, transform, revolutionize, streamline, elevate, enable (vague), delve, navigate, embrace, embark, harness, fuel, forge.

**Empty nouns and phrases:** tapestry, realm, landscape, journey (for software), "in today's fast-paced world," "at the end of the day," "it's not just X, it's Y," "the power of," "a wide range of," "a variety of," "when it comes to."

**Filler intensifiers (-ly adverbs):** truly, really, very, highly, incredibly, simply, totally, completely, fully (often redundant).

**Hedging and signposting:** moreover, furthermore, thus (overused), "in conclusion," "to sum up," "it's worth noting," "some may argue," "it could be said," perhaps, maybe, likely, tends to.

## Before and after

**Bad (AI marketing):**
> ripgrep is a powerful, blazing-fast search tool that leverages Rust to revolutionize how developers navigate large codebases.

**Good:**
> ripgrep searches file contents recursively, respects your `.gitignore` by default, and prints matches with line numbers and color. Binaries for Linux, macOS, and Windows are on the releases page.

The second says what it does and what it costs to adopt. The first could describe anything.

**Bad:**
> Our comprehensive error handling ensures robust stability.

**Good:**
> If a request fails, the client retries 3 times, then prints the failed URL and the error so you can rerun or report it.

## README checklist

- [ ] First one or two sentences: what it is and who it is for, in plain words. No "Welcome to," no mission statement, no emoji fanfare.
- [ ] Why before how. The reader knows if they want it before the install steps.
- [ ] Install: copy-pasteable, exact, and tested. Pin versions where it matters. State prerequisites.
- [ ] Usage: the common case first, runnable, with real values. Reference and edge cases after.
- [ ] Features: specific and honest. "Renumbers windows on close," not "Smart window management."
- [ ] Badges only if they convey live information (CI, version, license). Decoration gets cut.
- [ ] No section that exists only because a template has it. A one-line *Contributing* is fine, or link out.
- [ ] License stated plainly.

## Revision workflow

1. Read the whole thing once without editing.
2. Structure pass. List what the reader needs to do. Reorder sections to that shape. Split or merge until one job per section. Promote anything literal into a code block or list.
3. Cut pass. Remove every sentence that does not serve a reader task.
4. Tell pass. Search for em dashes and the reference word list. Replace or delete each hit.
5. Hedge pass. Remove formulaic transitions and excess hedging. State what you know.
6. Evidence pass. For every remaining adjective claim, ask "can I prove this from the code or a measurement?" Prove it or cut it.
7. Terminology pass. Pick one name per concept and apply it everywhere.
8. Example pass. Replace generic or placeholder examples with real ones from the codebase. Test every command.
9. Lint pass. Run `bash scripts/lint.sh <file>`. Fix every hit. Re-run until it exits 0.
10. Read aloud. Fix anything that sounds like a press release.

## Sources

- Technical-writing style guides: Google Developer Documentation Style Guide, Microsoft Writing Style Guide, GitHub Docs style guide.
- Write the Docs consensus: active voice, second person, imperative for steps, one idea per sentence, progressive disclosure, consistent terminology.
- Convergent "humanizer" guidance, independently corroborated across multiple sources, on the core LLM tells: em dashes (forbidden), hedging words, formulaic transitions, and -ly adverb density. These form the hard rules and the linter.
