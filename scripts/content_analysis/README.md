# Content Security Analysis

Extends PDE so it can analyse **content/code stored inside Terraform resource
attributes** (e.g. embedded Python), not just the Terraform configuration
structure.

## Pipeline

```
Terraform config → terraform plan (plan.json)
   → extract content-bearing attributes (python_code)
   → identify content type (registry.json)
   → static analyzer (Bandit, no execution)
   → normalize to standard findings
   → Rego "content security" policy → PASS / WARNING / FAIL
```

## Files

| File | Purpose |
|---|---|
| `registry.json` | content-type registry (attribute keys → language → analyzer command) |
| `extract.py` | walk plan JSON, collect code snippets |
| `analyze.py` | run Bandit on each snippet (static, never executes) |
| `normalize.py` | map Bandit output to the standard findings schema |
| `run.py` | standalone: plan.json → severity verdict (Python, no Rego) |
| `run_pde.py` | full runner: terraform → extract → analyze → normalize → inject → OPA → PASS/FAIL |

## Usage

```bash
# Full end-to-end (terraform + bandit + opa):
python3 scripts/content_analysis/run_pde.py \
    --fixtures 'inputs/gcp/Customer Engagement Suite/google_ces_agent/after_agent_callbacks.python_code' \
    --policy  'policies/gcp/Customer Engagement Suite/google_ces_agent/after_agent_callbacks.python_code.rego'

# Standalone severity check on an existing plan.json (no terraform/rego):
python3 scripts/content_analysis/run.py <plan.json>
```

`run_pde.py` shells out to `terraform`, `bandit`, and `opa` (all on PATH; see
`requirements.txt` for bandit).

## How the Rego side works

`policies/_helpers/policies/content_security.rego` is the 7th policy type. A
policy declares `"policy_type": "content security"` with `"values"` = severity
threshold(s). The runner injects `content_security_findings` into the OPA input,
and the helper flags any resource with a finding at/above the threshold.

## Extending to other content types

Add an entry to `registry.json` (new `attribute_keys` + analyzer command) and a
`normalize_<tool>()` adapter in `normalize.py`. The Rego helper is tool-agnostic
(reads only severity/confidence/rule_id).

## Tests

```bash
# Python tests (pytest) — requires bandit on PATH for test_analyze:
PATH="$PWD/.venv/bin:$PATH" .venv/bin/python -m pytest scripts/content_analysis/

# Rego helper test:
opa test tests/_helpers/content_security_test.rego \
    policies/_helpers/policies/content_security.rego \
    policies/_helpers/shared.rego -v
```
