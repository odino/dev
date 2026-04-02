## Code Style: Clean Conditionals

Prefer explicit, multi-line conditionals over compact one-liners.

**Avoid:**
```python
return actual if actual is not None else (self._o.get('amount_delivery_fee') or 0)
```

**Prefer:**
```python
if actual:
    return actual

return self._o.get('amount_delivery_fee', 0)
```

Alex is comfortable breaking logic into 2+ separate `if` blocks with a final return, rather than collapsing into ternaries or chained expressions. Clarity > brevity.
