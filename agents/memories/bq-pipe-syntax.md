## BigQuery: Prefer Pipe Syntax

When writing BigQuery SQL, prefer GoogleSQL pipe syntax (`FROM table |> WHERE ... |> SELECT ...`) over standard SQL.

**Rules:**
- New queries: write in pipe syntax.
- Large refactorings of an existing query: also switch to pipe syntax.
- Small amendments to an existing standard-SQL query: it's fine to keep it in standard SQL rather than rewriting the whole thing just to switch styles.
- try to keep WHERE conditions on their own line: WHERE a = 1 and b = 2 should be rewritten as |> WHERE a = 1 |> WHERE b = 2

**Why:** Alex's preference for readability/style in BQ SQL going forward.

**How to apply:** Any time BQ SQL is authored or substantially rewritten, default to pipe syntax unless it's a minor tweak to an existing standard-SQL query.
