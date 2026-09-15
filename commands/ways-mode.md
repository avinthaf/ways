---
description: Set your ways rewrite mode (adhd, dyslexia, dumb-it-down), saved globally for all future sessions across every project
---

The user wants to set their "ways" plugin rewrite mode to: "$ARGUMENTS"

Valid modes are: `adhd`, `dyslexia`, `dumb-it-down`

If "$ARGUMENTS" is empty or not one of these, list the valid modes and ask
the user to pick one. Do not write anything in that case.

Otherwise:
1. Create the directory `${CLAUDE_PLUGIN_DATA}` if it doesn't already exist.
2. Write this exact JSON to `${CLAUDE_PLUGIN_DATA}/config.json`:
   `{"mode": "$ARGUMENTS"}`
3. Confirm to the user which mode is now active, and mention it will apply
   automatically in this session and all future sessions, across every
   project, until changed with `/ways-mode` again.
