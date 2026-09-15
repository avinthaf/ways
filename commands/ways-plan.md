---
description: Build a plan the same way /plan does, but present it one section at a time instead of dumping the whole document at once — reads the user's active ways mode for pacing/formatting.
---

The user wants a plan for: "$ARGUMENTS"

Note: this intentionally does NOT use plan mode (EnterPlanMode/ExitPlanMode).
Plan mode always presents the full plan in one message with no way to
chunk it, which is exactly what this command exists to avoid. As a
tradeoff, this means there's no file-edit lock while planning — don't
make any edits during this process regardless, since the user hasn't
approved anything yet.

Steps:

1. Do all your normal research/investigation to work out the full plan,
   same as you would for /plan. Don't show this work to the user yet.

2. Read the user's active mode from `${CLAUDE_PLUGIN_DATA}/config.json`
   (field `mode`). If missing, default to `adhd`. Load that mode's rules
   from `${CLAUDE_PLUGIN_ROOT}/skills/ways-rephrase/modes/{mode}.md` and
   apply them to how you write every section below.

3. Break the plan into logical sections (e.g. setup, data model,
   frontend, deployment — whatever fits this specific plan). Roughly
   3-6 sections is usually right; don't over-split trivial plans.

4. Present ONLY the first section. End it with a short, explicit line
   asking whether to continue, e.g. "Ready for the next section, or
   want changes to this one first?"

5. Wait for the user's reply — there is no special keyword or command
   to advance. Read their reply naturally:
     - If it reads like a go-ahead (e.g. "next", "continue", "ok",
       "sounds good", or anything short and affirmative that isn't a
       change request), show the next section.
     - If it reads like feedback or a change request, revise the
       CURRENT section only, then ask again before moving on. Do not
       advance to the next section on a feedback reply.
   Never require the user to learn or type an exact keyword — infer
   intent from a normal conversational reply.

6. Repeat until all sections are shown, then ask for final go-ahead
   before starting implementation — same approval gate /plan would
   normally give, just reached in pieces instead of all at once.
