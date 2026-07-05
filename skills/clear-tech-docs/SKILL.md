---
name: clear-tech-docs
description: "Write or revise technical documentation (READMEs, guides, API docs, proposals, code comments) so it's clear, credible, and useful instead of reading like AI marketing. Covers structure and scannability, plain precise prose, imperative and task-oriented instructions, consistent terminology, and removing AI 'tell' words. Use whenever writing, rewriting, or improving any technical doc, or when prose sounds robotic, marketing-y, or 'too AI'."
---

# clear-tech-docs

Two goals: **clarity** (the reader can do the thing) and **credibility** (every claim is earned). The enemies are vagueness, unearned enthusiasm, and walls of unstructured prose.

Grounded in established technical-writing guidance (Google/Microsoft/GitHub style guides, Write the Docs) and the well-documented problem of LLM "tell" words. See *Sources*.

## 1. Structure first: readers scan, they don't read

The layout matters more than the sentences. A reader of a novel reads top to bottom; a reader of a doc jumps. Optimize for the jump.

- **Front-load the answer.** The first sentence of a README or section says what the thing is and whether the reader should care. Background, history, and caveats come after.
- **Heading every few paragraphs.** A reader should navigate by headings alone. Headings are concrete statements or tasks (*Install*, *Configure logging*, *Common errors*), not cute labels.
- **Match content to container.** Numbered lists for sequential steps, bullets for parallel items, tables for comparisons, code blocks for anything literal (commands, code, config, paths, output). If it's typed or pasted, it goes in a code block.
- **One job per section.** When a section does two things, split it.
- **Progressive disclosure.** Summarize first, link to the detail. Don't unfold the whole reference inside the quickstart.
- **Predictable order across a doc set.** Once readers learn the layout of one guide, the next should match.

## 2. Write for the task, not the feature

- **Organize around what the reader is trying to *do*,** not a catalog of what the software has. A "How do I…?" beats a "Features" list.
- **Common case first;** edge cases and options after.
- **Right-size the doc to the change.** A one-line behavior tweak earns a one-line note, not a new section. Writing a nine-section guide for a three-line change is a failure mode. It buries the real change in ceremony.
- **Calibrate to the audience.** Assume the reader is competent but unfamiliar with *this* code. Skip concepts they already know; always explain your project's own names, conventions, and magic.

## 3. Precise, plain prose

- **Active voice; name the actor.** "The client sends the request," not "a request is sent." Passive is fine when the actor is irrelevant or obvious ("the result is cached"), but active is the default.
- **Imperative mood for steps.** "Run `npm install`", not "you can run npm install" or "npm install should be run."
- **Second person ("you") for guides; third person for reference.** Stay consistent within a doc.
- **Short words, short sentences, one idea per sentence.** If a 10-year-old developer couldn't parse it, simplify.
- **Consistent terminology.** Call the same thing the same name everywhere. Don't rotate "service," "module," and "component" for one concept; readers will assume three things.
- **Specific over general.** Real versions (`0.9.2`, not "latest"), real numbers, real names, real limits ("Linux/macOS, Node 20+" not "cross-platform").
- **Defensible claims.** Every adjective should be verifiable from the code. If you can't prove it, soften it ("aims to", "in our tests") or cut it.

## 4. Show, don't assert

- **Code and commands beat adjectives.** "Handles 12k req/s on a t3.small (see `bench/`)" beats "blazing-fast and highly scalable."
- **Real, runnable examples**, not `<your-api-key>` theater. Test every command you publish.
- **A working example is worth a paragraph of description.** When you can show it, stop describing it.

## 5. Cut the AI tells (the "enthusiasm" problem)

These words add no information and instantly read as AI-generated. Search the draft for them; replace with something concrete, or delete.

**Over-promising adjectives:** powerful, robust, elegant, seamless, comprehensive, cutting-edge, state-of-the-art, revolutionary, game-changing, next-generation, blazing-fast, lightning-fast, lightweight *(unless measured)*, scalable *(unless demonstrated)*, intuitive, effortless, frictionless, modern, ultimate, perfect, stunning, beautiful, awesome, incredible.

**Empty verbs:** leverage, utilize, unlock, empower, supercharge, transform, revolutionize, streamline, elevate, enable *(vague)*, delve, navigate, embrace, embark, harness, fuel, forge.

**Empty nouns/phrases:** tapestry, realm, landscape, journey *(for software)*, "in today's fast-paced world", "at the end of the day", "it's not just X, it's Y", "the power of", "a wide range of", "a variety of", "when it comes to".

**Filler intensifiers:** truly, really, very, highly, incredibly, simply, totally, completely, fully *(often redundant)*.

> Not forbidden forever. A "seamless" integration is a real thing. But each one must *earn* its place with evidence. Default to cutting.

## Tone

Match the surrounding prose. Don't inject personality, humor, or exclamation marks unless the project's existing voice already has them. The goal is *invisible competence*: the reader notices the information, not the writing.

## Before → after

**Bad (AI marketing):**
> Tubular is a powerful, lightweight, and highly customizable tmux plugin that revolutionizes session management. Leveraging a seamless architecture, it empowers you to effortlessly navigate your workflow with blazing-fast performance.

**Good:**
> Tubular renames and renumbers your tmux sessions and windows so they stay in a consistent order. It's a single ~600-line shell script with no dependencies beyond tmux itself.

The second says *what it does* and *what it costs to adopt*. The first could describe anything.

**Bad:**
> Our comprehensive error handling ensures robust stability.

**Good:**
> If a rename fails, the script exits non-zero and prints the window ID, so you can retry or file a bug.

## README checklist

- [ ] **First 1–2 sentences:** what it is + who it's for, in plain words. No "Welcome to…", no mission statement, no emoji fanfare.
- [ ] **Why before how.** The reader knows if they want it *before* the install steps.
- [ ] **Install:** copy-pasteable, exact, and tested. Pin versions where it matters. State prerequisites.
- [ ] **Usage:** the common case first, runnable, with real values. Keep reference and edge cases after.
- [ ] **Features:** specific and honest. "Renumbers windows on close," not "Smart window management."
- [ ] **Badges** only if they convey live information (CI, version, license). Decoration gets cut.
- [ ] **No section that exists only because a template has it.** A one-line *Contributing* is fine, or link out.
- [ ] **License** stated plainly.

## Revision workflow (when improving an existing doc)

1. Read the whole thing once without editing.
2. **Structure pass:** list what the reader needs to *do*. Reorder sections to that shape; split or merge until one job per section; promote anything literal into a code block or list.
3. **Cut pass:** remove every sentence that doesn't serve a reader task.
4. **Tell-word pass:** search for the §5 words; replace or delete each hit.
5. **Evidence pass:** for every remaining adjective claim, ask *"Can I prove this from the code or a measurement?"* Prove it or cut it.
6. **Terminology pass:** pick one name per concept and apply it everywhere.
7. **Example pass:** replace generic or placeholder examples with real ones from the codebase; test every command.
8. Read aloud. Fix anything that sounds like a press release.
9. Diff against the original and confirm you lost *no information*, only noise.

## Sources

- Technical-writing style guides: Google Developer Documentation Style Guide, Microsoft Writing Style Guide, GitHub Docs style guide ("use clear, simple language that's approachable… authentic, empathetic, confident").
- Write the Docs / general technical-writing consensus: active voice, second person, imperative for steps, one idea per sentence, progressive disclosure, consistent terminology.
- Documented LLM over-use vocabulary (Pangram Labs "Most common AI phrases"; Embryo "Words AI overuses"; multiple crowdsourced lists): the basis of the §5 word list.
