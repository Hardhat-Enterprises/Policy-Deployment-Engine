# Development merge and preparation validation

Validated on Windows on 2026-09-22, directly on `Task/pde_folder_restructure`.

- Preparation starting commit: `686cdf6eb86730ef4547f18fd452795799232d58`.
- Merged development commit: `23b081d5b1418e56bd082d4baaf0e3837c17775a`.
- Production migration was not run. No push or merge into `dev` was performed.

## Passing checks

| Check | Result |
|---|---|
| `python -m pytest -q -m "not repository_data"` | 494 passed; 6 repository-data cases deselected |
| `bash tests/_helpers/unit_test_helpers.sh` | 11 suites; 275 Rego tests passed |
| Merge conflicts | Resolved; no unmerged paths |
| Preparation diff whitespace check against fetched `dev` | Passed |
| Production inputs and GCP policies against fetched `dev` | Identical |
| Shared Rego engine source against fetched `dev` | Identical; helper documentation retargeted |

The isolated tests cover migration in temporary repositories, config inheritance
and overrides, provider-pin isolation, normalized hashes, valid historical-name
adoption, stale-plan rejection, atomic publication failure, failed-build
preservation, temporary Terraform workspaces, old-base/new-head findings,
Windows output and failure-report emission. Terraform execution is mocked in
workspace tests; production Terraform plans were not rebuilt.

The complete Python suite was also run: 490 cases passed and the six cases below
failed before four additional report/CI regression tests were added. The final
isolated run includes those four passing cases.

## Expected failures before cutover

These remain enabled in CI; no migration workaround or softened gate was added.

- `test_the_real_repo_passes_its_own_gate`: true arguments still have flat policies
  and fixtures under `inputs/`, so new-layout coverage fails.
- `test_the_real_repo_has_no_strays`: migration has not created the shared config.
- `test_plan_cache_for_matches_auto_test_on_the_real_repo`: the expected migrated
  argument directory does not exist yet.
- `test_every_exemption_is_still_needed` (three cases): the new-layout reader
  cannot evaluate the unmigrated fixtures for App Hub, Certificate Manager and
  Cloud Storage. Existing exemptions were retained.

Whole-tree structural lint and content lint each reported 1,682 findings: 1,680
legacy policy placements, missing shared configuration and the remaining legacy
GCP input tree. Read-only plan verification rejected those 1,680 legacy policy
placements. Whole-GCP evaluation exited nonzero and emitted a fresh report with
1,680 failed entries across 110 services and 446 resource types; these are layout
failures, not evaluated policy verdicts. No Terraform invocation was needed.

The ALL workflow retains plan-verification failures while allowing evaluation to
produce a current portal report. The artifact remains named `policy-results`.

## Data preservation baseline

After incorporating incoming `dev` data, both the staged and working trees match
these fetched-development Git trees exactly:

| Subtree | Git tree object |
|---|---|
| `inputs/` | `803ac7342f8a941f259b6135b092c45bce1b3cc9` |
| `policies/gcp/` | `8f84b5eb04609b3f541325566b4fc157af9c60b1` |

Incoming student-data whitespace was preserved. The merge diff against the old
branch reports inherited whitespace warnings; the preparation diff against
fetched `dev` is clean.

Follow [the cutover guide](layout-cutover.md) for the later refresh, reviewed
migration, identity/hash verification, full evaluation and portal integration
checks. Passing preparation tests does not substitute for those cutover checks.
