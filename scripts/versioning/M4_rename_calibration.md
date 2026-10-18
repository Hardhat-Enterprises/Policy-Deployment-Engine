# M4 — Rename Detection Calibration Note

Purpose: decide the rename-detection thresholds using real data, not defaults, and
show the decision is justified.

## What the real 7.0.0 -> 7.37.0 diff shows

Across the whole GCP provider from 7.0.0 to 7.37.0:

- 0 resources removed, and only 1 argument removed in total.
- 0 renames at the default threshold.
- The change is almost entirely additive (7159 new arguments, 8 type changes).

A rename is a removal paired with an addition. With essentially no removals, there are
almost no rename candidates in the 7.x line. This confirms that staying within one major
version is low-risk for policy migration.

## Calibration experiment

I ran the differ at two settings and compared.

| Setting | rename-threshold | Renames detected | Result |
|---|---|---|---|
| Default | 0.72 | 0 | The one removed argument stays a genuine retirement |
| Lowered | 0.30 | 1 | A false rename appears |

The false rename at 0.30:

| From | To | Confidence | Name sim | Type match | Desc sim |
|---|---|---|---|---|---|
| `last_successful_backup_consistency_time` | `deletion_policy` | 0.42 | 0.259 | yes | 0.012 |

These two arguments are unrelated: the name similarity is 0.26 and the description
similarity is 0.01. The score of 0.42 comes almost entirely from the type matching by
coincidence. Lowering the threshold to 0.30 wrongly pairs them.

## The safe gap

Two real data points bracket the threshold:

- A true rename (the `dest_network_context` -> `dest_network_scope` case) scores 0.913
  (name 0.84, description 0.94).
- The worst false pair on real 7.x data scores 0.42 (name 0.26, description 0.01).

Any threshold between about 0.55 and 0.85 cleanly separates true renames from false pairs.

## Decision

- Keep the defaults: rename-threshold 0.72, review-threshold 0.55.
- At 0.72 the false pair (0.42) is correctly rejected and a true rename (0.91) is still
  caught, so the default sits in the middle of the safe gap.
- The 0 renames reported at the default is a real result, not a missed detection: lowering
  the threshold only surfaces a clearly wrong pair.

## Limitation and future work

The 7.x line has no true renames to tune against, so deep calibration is not possible
within this scope. Calibrating on real renames would need a major-version diff (for
example 6.x to 7.x), where breaking changes and renames occur. That is future work,
outside the current 7.x scope, and the detector's ability to catch a real rename is
already proven on the `dest_network_context` -> `dest_network_scope` fixture at 0.913.
