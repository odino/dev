---
name: find-bad-query
description: Find queries that Cloud SQL insights flags as problematic.
---

Sometimes, Cloud SQL Insights flags a query as problematic. However, their interface reports it with alias column names, and sometimes strips part of the query -- so it's hard to find it in our codebases. Here I will paste the content of the query as per SQL insights and you should try to find the corresponding query in the current repo.

Should you find it, try to diagnose how it could be either directly rewritten (with minimal changes) so as to fix performance or, if necessary, rewritten together with refactoring of the code that uses it to make sure we implement the same functionality but query mysql "differently".
