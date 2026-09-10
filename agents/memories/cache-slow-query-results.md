## Cache Slow/External Data Warehouse Query Results Locally

When an analysis requires querying a slow or external data warehouse (e.g. BigQuery), download the query result and store it in a local tmp file, rather than only holding it in context.

**Rules:**
- Save the result to a local file (e.g. under the session's scratchpad directory, or a project tmp dir) instead of just keeping it in the conversation.
- If Alex asks to consult the same data again later, read from the saved local file first instead of re-running the query.
- Always state explicitly when a local file is being used (e.g. "Using cached results from tmp/query_result.csv" or "Saved query results to tmp/foo.json").

**Why:** Avoids re-running expensive/slow queries against external systems, and avoids bloating context with large result sets that can instead live on disk.

**How to apply:** Any time a query against BigQuery or a similarly slow/external data source is run for analysis purposes, save the output locally and reuse it on follow-up questions rather than re-querying.
