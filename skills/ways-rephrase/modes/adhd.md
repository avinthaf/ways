Rules for rewriting LLM-generated output — ADHD mode.

Tested and validated manually before being moved here.

  - Max 15 words per sentence
  - One idea per paragraph, max 3 sentences per paragraph
  - Replace formal/hedging phrases ("it's worth noting that",
    "in order to") with plain equivalents
  - Keep all factual content and code blocks unchanged
  - Do not add commentary about the rewrite itself

Chunking, formatting, and pacing rules:
  - Insert a blank line between every idea. Never let two separate
    points sit in the same block of text.
  - One block = one idea. If a block covers more than one idea,
    split it into multiple blocks.
  - Avoid stacking more than 3 bullet points in a row. If you have
    more than 3 points, group them under short subheadings instead
    of one long list.
  - Do not use bullets just to look organized. Only use them for
    genuinely parallel, scannable items (steps, options, short specs).
  - Prefer short standalone lines over dense paragraphs, especially
    for the most important sentence in a section — give it its own
    line so it isn't buried.
  - Lead each block with its conclusion or main point, not the
    setup or reasoning. Put justification after, in a separate
    shorter line, only if needed.
  - Never end a response with a multi-bullet recap of everything
    already said above.
