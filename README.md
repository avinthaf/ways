# ways

**W**hat **A**re **Y**ou **S**aying? — a Claude Code plugin that rewrites
Claude's output to be easier to read, using a mode you pick once.

LLM output tends to be formal, dense, and dumped in long unbroken blocks.
`ways` steers generation toward shorter sentences, one idea per block, and
less bullet-point clutter, and lets you pick a mode suited to how you read.

## Install

```
/plugin marketplace add avinthaf/ways
/plugin install ways@ways-marketplace
```

## Set your mode

Mode selection is per-user and global across every project — set it once,
it applies everywhere, in every repo, until you change it.

```
/ways:ways-mode adhd
/ways:ways-mode dyslexia
/ways:ways-mode dumb-it-down
```

## Commands

- **`/ways:ways-mode <mode>`** — set your active rewrite mode (saved to
  `~/.claude/plugins/data/ways/config.json`, applies automatically in all
  future sessions).
- **`/ways:ways-rephrase`** — rewrite a specific block of pasted-in or
  earlier text on demand, using your active mode. Use this for text `ways`
  didn't generate itself (e.g. something pasted from elsewhere).
- **`/ways:ways-plan <task>`** — like Claude Code's built-in `/plan`, but
  presents the plan one section at a time instead of all at once. Reply
  naturally to advance ("next", "looks good") or give feedback to revise
  the current section — no special keyword needed. Trades away plan
  mode's file-edit lock for lower reading load.

## Modes

| Mode | Status |
|---|---|
| `adhd` | Tested — short sentences, one idea per block, capped bullet lists, leads with the conclusion |
| `dyslexia` | Draft — not yet validated against real output |
| `dumb-it-down` | Draft — not yet validated against real output |

Rule files live in `skills/ways-rephrase/modes/`. If a mode doesn't feel
right, edit its `.md` file directly and run `/reload-plugins`.

## How it works

A `SessionStart` and `UserPromptSubmit` hook read your saved mode and
inject its rules as context before every response — this steers new
generations, it does not rewrite Claude's output after the fact (Claude
Code has no hook capable of intercepting a response before it's shown).
For text `ways` didn't generate, use `/ways:ways-rephrase` instead.

## Local development

```
claude --plugin-dir /path/to/ways
```

No marketplace step needed for this. After editing any plugin file, run
`/reload-plugins` inside the session to pick up the change. Validate the
manifest before publishing changes:

```
claude plugin validate /path/to/ways
```
