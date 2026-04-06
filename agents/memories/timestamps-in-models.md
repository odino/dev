## Timestamps in Tables and Models

Always include `created_at` and `updated_at` timestamp fields when creating new DB tables or ORM models.

**Rules:**
- `created_at`: set once automatically on insert, never updated
- `updated_at`: auto-updates on every row change (`ON UPDATE CURRENT_TIMESTAMP`)
- Both fields must be indexed

**SQL example:**
```sql
created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
INDEX idx_created_at (created_at),
INDEX idx_updated_at (updated_at)
```

**Why:** Consistent audit trail across all entities; indexes support time-based queries and sorting.

**How to apply:** Any time a new table or model is created, add these two fields — no exceptions.
