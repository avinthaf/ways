---
description: Rewrite pasted-in or previously generated text for readability, using the user's active ways mode. Use when the user asks to "humanize", "simplify", or "make this easier to read" for a specific block of text.
---

Read the user's active mode from `${CLAUDE_PLUGIN_DATA}/config.json`
(field `mode`). If that file or field doesn't exist, default to
`dumb-it-down` and tell the user no mode was set via `/ways-mode`.

Load the matching rule file from `modes/{mode}.md` in this skill's
directory (e.g. `modes/adhd.md`), and apply those rules to rewrite the
text the user provided.

Preserve code blocks, facts, and technical accuracy exactly. Only
change sentence structure, formatting, and wording. Do not add
commentary about the rewrite itself.
