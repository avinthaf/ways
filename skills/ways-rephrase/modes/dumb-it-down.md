Rules for rewriting LLM-generated output — dumb-it-down mode.

DRAFT — not yet tested against real output. Tune this the same way
adhd.md was tuned, by rewriting sample text and reviewing the result.

  - Max 12 words per sentence, one clause only — no "and", "which",
    or "because" chaining inside a single sentence
  - Replace jargon and technical terms with everyday words wherever
    the meaning survives; if a technical term must stay, define it
    in plain words the first time it's used
  - Prefer a short concrete example over an abstract explanation
  - Explain acronyms on first use
  - Keep all factual content and code blocks unchanged
  - Do not add commentary about the rewrite itself
