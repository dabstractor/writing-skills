# writing-skills

Agent Skills that help AI agents write like a person, not like AI. Each skill targets one genre of writing and ships a linter the agent must pass. Every skill is a self-contained `SKILL.md` you can load into any harness that supports the [Agent Skills standard](https://agentskills.io/).

## Skills

- **[`write-tech-docs`](skills/write-tech-docs/SKILL.md)**: writes or revises technical docs (READMEs, guides, API docs, code comments) so they are clear, short, and do not read like AI output. Hard rules: no em dashes, no marketing tell-words, no hedging or formulaic transitions, no narrating the codebase. Ships [`scripts/lint.sh`](skills/write-tech-docs/scripts/lint.sh), a gate the agent must pass before finishing (`bash scripts/lint.sh your-file.md`).
- **[`write-reddit-post`](skills/write-reddit-post/SKILL.md)**: writes a Reddit post announcing something the user built. Personal first-person "why I built this" narrative that reads as human, not AI. Hard rules: full first person always (never drop the leading "I"), no em dashes, no markdown, no banned tell-words. Ships [`scripts/lint.sh`](skills/write-reddit-post/scripts/lint.sh) that also catches the dropped-"I" tell.

## Install

Clone the repo:

```bash
git clone https://github.com/dabstractor/writing-skills.git
```

**pi**: load one skill for a single session.

```bash
pi --skill ./writing-skills/skills/write-tech-docs
```

Or load every skill permanently by adding the directory to `~/.pi/agent/settings.json`:

```json
{ "skills": ["~/projects/writing-skills/skills"] }
```

**Claude Code, Codex, and others**: symlink or copy a skill into your harness's skill folder, such as `~/.claude/skills` or `~/.codex/skills`.

## Keep a skill off until you call it

Skills activate when their description matches your task. To install one but hide it until you invoke it, add this to its frontmatter:

```yaml
disable-model-invocation: true
```

Then load it with `/skill:write-tech-docs`. pi registers `/skill:<name>` commands by default.

## License

MIT. See [LICENSE](LICENSE).
