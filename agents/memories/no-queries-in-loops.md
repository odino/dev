## No Queries in Loops

Never run DB queries inside a for loop (one query per item).

**Prefer:**
- `WHERE col IN :items` for filtering by a set of values
- Templated loops in the query (e.g. jsql `{% for i in indices %}`) for batch inserts
- `GROUP BY` to aggregate per-item results in a single query

**Avoid:**
```python
for item in items:
    sql(conn, "SELECT ... WHERE col = :item", item=item)
```

**Why:** N+1 queries are wasteful and don't scale. Always batch into a single round-trip.
