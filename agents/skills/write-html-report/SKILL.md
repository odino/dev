---
name: write-html-report
description: Summarize your findings into an HTML report
---

## Writing

Write an HTML report that summarizes your finding, but be thorough -- no need to skimp. Don't overdo it or use over-complicated jargon -- the easier the read the better it is.

As much as possible, try to:

* provide examples
* dive deep based on the data / findings you've been fed
* limit verbosity

## HTML

Provide an easy-on-the-eyes light-theme report without too many fancy features, though it would be helpful to:

* include interactive charts / filters / tabs if they may aid consumption
* query-string driven state, so one can share an exact link to the report with a bunch of query params and the receiver sees the same exact filters etc as the sender used
* headings should also be deeplinkable

## Output dir

Use a `.tmp` folder in cwd.
