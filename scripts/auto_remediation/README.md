# Auto-remediation (`scripts/auto_remediation`)

Finds Terraform resources that break a PDE policy and, where the policy itself says what a
compliant value is, patches the Terraform source and re-checks it with the same policy.

Nothing is hard-coded per resource. For each policy the engine asks OPA for the policy's own
conditions (`policy_type`, `attribute_path`, `values`), runs the policy against a plan to find the
non-compliant resources, derives a fix from those conditions, patches the attribute in the `.tf`
text, and evaluates the policy again on the patched resource.

## Requirements

- Python 3.11+ (Linux, macOS or Windows).
- [OPA](https://www.openpolicyagent.org/docs/#running-opa) on `PATH`, so that `opa version` works,
  or pass its full path with `--opa-bin`.
- [`python-hcl2`](https://pypi.org/project/python-hcl2/) for `validate-repo`, which reads the
  policies' `nonCompliant.tf` fixtures. It is listed in the repo's `pyproject.toml`
  (`uv sync`, or `pip install python-hcl2`).

## Commands

Run from the repository root (`python3` on Linux/macOS, `python` or `py` on Windows).

### `discover`: what is there

```bash
python3 scripts/auto_remediation/main.py discover --repo .
```

Counts the argument policies (`policies/<platform>/<Service>/<resource>/<argument>/policy.rego`)
and their conditions by `policy_type`. Writes nothing.

### `remediate`: fix a real Terraform project (dry run by default)

```bash
terraform -chdir=my-infra plan -out=plan.tfplan
terraform -chdir=my-infra show -json plan.tfplan > plan.json
python3 scripts/auto_remediation/main.py remediate --repo . --plan plan.json --tf-dir my-infra
```

Prints one JSON entry per violation: the resource, policy, attribute, current value, and either
the fix (`FIXABLE`) or why it needs a person (`NEEDS_MANUAL_REVIEW`). **Without `--apply` nothing is
written.** With `--apply`, each fixable attribute is patched in the first `.tf` file under
`--tf-dir` that declares the resource (`PATCHED`). Policies the engine cannot evaluate are listed as
`UNSUPPORTED` or `EVAL_ERROR`. Review the diff and re-run `terraform plan` afterwards.

On Windows PowerShell 5, `>` writes UTF-16; write the plan with
`terraform show -json plan.tfplan | Out-File -Encoding utf8 plan.json`.

### `validate-repo`: self-test against the repo's own fixtures

```bash
python3 scripts/auto_remediation/main.py validate-repo --repo . --log-out /tmp/ar-log.json
```

For every policy with a `nonCompliant.tf` beside it: build a plan from the fixture (with
`python-hcl2`, no `terraform` needed), find the violation, fix it, patch a copy of the text, and
re-verify. Prints the counts below; `--log-out` writes the details (manual-review reasons, patch
failures, unsupported policies, evaluation errors). `--write-fixed-to DIR` saves a
`BEFORE_nonCompliant.tf` / `AFTER_fixed.tf` pair for each verified fix, mirroring the `policies/`
tree. Nothing under `--repo` is modified. Write both outputs outside the repository.

### Options

| Option | Commands | Meaning |
| --- | --- | --- |
| `--opa-bin PATH` | all (before or after the command) | OPA binary; default `opa` on `PATH` |
| `--only TEXT` | all | Case-insensitive match on the resource type or service, e.g. `google_redis_instance` or `"Memorystore (Redis)"` |
| `--apply` | `remediate` | Write the fixes (default: dry run) |
| `--limit N` | `validate-repo` | Stop after N policies |
| `--log-out FILE` | `validate-repo` | Detailed JSON log |
| `--write-fixed-to DIR` | `validate-repo` | BEFORE/AFTER `.tf` pairs for verified fixes |

## Fix rules

| `policy_type` | Current value | Fix |
| --- | --- | --- |
| whitelist | scalar | the first allowed value, `values[0]` |
| whitelist | list | keep only allowed elements; if none are left, `[values[0]]` |
| blacklist | boolean | the other boolean |
| blacklist | list | remove the forbidden elements |
| blacklist | other scalar | manual review: many values could be valid, the policy names none |
| blacklist | of an empty / absent value | manual review: a meaningful value cannot be invented |
| range | number | clamp to the violated bound |

Everything else is not auto-fixed:

- other policy types (`pattern *`, `element *`, map key, presence, ...) and hand-written Rego with
  no helper conditions count as unsupported;
- content-security policies are unsupported (they need Bandit findings, which only
  `scripts/auto_test` produces);
- a policy the helpers refuse (its message carries `POLICY ERROR:`) is an evaluation error, never
  "fixed" or "clean".

OPA is given explicit files only: `policies/_helpers`, the resource's `_vars.rego` and the one
`policy.rego`, as `scripts/auto_test/auto_test.py` does. It is never given a resource folder, which
would load the sibling policies and the committed `<sha>.json` plans as data.

## `validate-repo` counts

| Field | Meaning |
| --- | --- |
| `total_policies_with_fixture` | Policies with a `nonCompliant.tf` that were evaluated (or skipped as content security) |
| `auto_fixed_and_reverified_compliant` | Fixed, and the same policy now reports no non-compliant resource |
| `auto_fixed_but_still_noncompliant` | Patched, but the policy still flags the resource (e.g. a second problem in the fixture) |
| `needs_manual_review` | No safe value follows from the policy (see the fix rules) |
| `condition_type_unsupported` | Policy type without a fix rule, custom Rego, or content security |
| `patch_failed` | Fix known, but the text patcher could not apply it (see limitations) |
| `no_violation_found_in_fixture` | The policy flagged nothing in its own `nonCompliant.tf` |
| `resource_name_mismatch` | OPA named a resource the engine could not find in the plan |
| `fixture_missing` | No `nonCompliant.tf` beside the policy |
| `eval_error` | OPA failed, the policy has no `conditions` rule, the fixture could not be read, or `POLICY ERROR:` |

## Limitations

- The patcher is text-based, scoped to PDE-style files: one resource block per label, nested
  *blocks* (`name { ... }`) at any depth. It does not patch map-typed attributes
  (`name = { key = value }`), and it does not create a nested block that is missing entirely; both
  are reported as `patch_failed` rather than guessed. Modules, `for_each` and `dynamic` blocks would
  need a real HCL writer.
- A policy's situations are paired with its conditions in order; a fix is computed for the first
  situation that flags a resource.
- `validate-repo` builds plans from `.tf` text, not with `terraform`, so values Terraform would
  compute are absent.

## Tests

```bash
python3 -m pytest scripts/auto_remediation -q
```

The fix rules, the patcher, discovery and the CLI need neither `opa` nor `python-hcl2`. The OPA
cases skip without `opa` on `PATH`, and the `validate-repo` case also skips without `python-hcl2`.
