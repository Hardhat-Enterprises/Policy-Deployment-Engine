# PDE Schema Differ — version-aware policies (prototype)

## Status (read first)

This is a prototype. What works: a stable policy ID (resource_type::argument_path), a per-version validity map, a provider-schema differ with rename detection, and the "does the resource/argument exist in this version" check.

What does not exist yet: testing a policy under a different provider version. build_results.py's --version is only a label. It runs auto_test.py with the repo's pinned provider and committed plans, so a result recorded under any other version is really the pinned version's result. Do not commit validity-map entries for other versions produced this way.

The "101 policies" figure in this handover counts schema arguments on three resources, not policies (dev has 12 policies across them).

Next step: make the provider version a real input (install/select that provider version, plan the compliant and non-compliant fixtures under it, bypassing the committed plan cache, run OPA, and write the result into the validity map). A plan that fails because a newly required unrelated argument is missing should be recorded as "fixture needs updating", not as a policy failure.

build_results.py looks for fixtures under inputs/<resource>/. Update it if the folder restructure (#926) lands.

Read-only tool that compares two Terraform provider schema versions and reports what
changed, plus what it means for our existing policies. It never writes to `docs/`,
`inputs/`, or `policies/`, so it cannot affect the plan cache or the repo.

## Why

PDE is pinned to one provider version. Customers pin to older ones. When the provider
changes, arguments are added, removed, or renamed, and nothing tells us which existing
policies still hold. This tool answers that question with a number.

## Install

Python 3.8+. No dependencies (standard library only).

## Use

Step 1 — dump each provider schema. In a directory with the provider version pinned:
# versions.tf
terraform { required_providers { google = { source = "hashicorp/google", version = "7.0.0" } } }
```

```bash
terraform init -upgrade
terraform providers schema -json > schema_7.0.0.json
# repeat with version = "7.37.0" -> schema_7.37.0.json
```

Step 2 — compare:

```bash
python3 schema_differ.py schema_7.0.0.json schema_7.37.0.json \
    --provider google --from-label 7.0.0 --to-label 7.37.0 --out out/
```

Limit to the resources we actually cover:

```bash
python3 schema_differ.py schema_7.0.0.json schema_7.37.0.json \
    --only-resource google_compute_snapshot \
    --only-resource google_compute_network_firewall_policy_rule \
    --only-resource google_compute_region_commitment --out out/
```

## Output

- `out/changeset.json` - machine-readable changes plus migration analysis
- `out/report.md` - human-readable summary

## Rename detection

A renamed argument looks like one removal plus one addition. Treating it that way retires
a working policy and raises a new work item for the same thing. Instead each removed
argument is scored against each added argument in the same parent block:

| Signal | Weight |
|---|---|
| Name similarity | 0.45 |
| Type match | 0.30 |
| Description similarity | 0.25 |

Score at or above `--rename-threshold` (default 0.72) is a rename. Between
`--review-threshold` (default 0.55) and that is flagged for a human. Below is treated as a
genuine remove plus add

Validated on the real case `dest_network_context` to `dest_network_scope` (the beta and GA
spellings in the firewall rule resource), detected at 0.913 confidenc

## Tests

```bash
python3 test_differ.py
```

7 tests, including a false-positive check that an unrelated removal and addition are not
paired as a rename

## Status and limits

- Prototype. Confirm behaviour against the real repo before relying on it.
- Assumes one policy per argument (the PDE convention), so argument counts stand in for
  policy counts in the migration analysis.
- Does not yet read the actual `policies/` tree; it reasons from the schema. Cross-checking
  against real policy folders is the next step.
- Thresholds are tunable and should be calibrated on a real 7.x diff.
