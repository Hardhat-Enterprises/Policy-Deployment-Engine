# Restructuring preparation and cutover

`Task/pde_folder_restructure` merges `dev` normally so it retains new engine
features, tooling, assessments and student submissions. Preparation updates the
tools; it does not move the production policies or inputs. After each merge,
record the data baseline and leave it unchanged while adapting the tooling.

Normal commands target argument directories under
`policies/gcp/<Service>/<resource>/<argument>/`. Each contains `policy.rego`,
`compliant.tf`, `nonCompliant.tf` and one committed `<fixture-sha>.json`.
`_vars.rego` stays in the resource directory. `policies/gcp/config.tf` supplies
the default configuration; an argument's optional `config.tf` replaces it.
Differences other than CRLF/lone-CR/BOM normalization remain significant.

## Preparation checks

From the repository root, with Python 3.11+, OPA and Git installed:

```bash
python -m pip install pytest pyyaml
python -m pytest -q -m "not repository_data"
bash tests/_helpers/unit_test_helpers.sh
```

Migration tests use synthetic temporary repositories only. The generator requires
the shared configuration created by migration and must not be used on real data
before cutover. Tests marked `repository_data`, whole-tree structural/content
checks, plan verification and GCP evaluation will report the legacy layout until
cutover. These checks remain enabled in CI, including the whole-tree engine gate
for helper changes. There is no temporary whole-tree migration in CI.

After cutover, contributor commands are:

```bash
python scripts/check_resource.py
python scripts/auto_test/auto_test.py "gcp/Cloud Storage/google_storage_bucket"
python scripts/auto_test/auto_test.py gcp --verify-plan-cache
python scripts/linters/policy_lint.py "gcp/Cloud Storage/google_storage_bucket"
```

Pre-commit uses `--skip-coverage` for document completeness without coverage or OPA;
full resource checks and PR checks enforce coverage and evaluation. Normal commands
accept positional targets or `--policies`, not `--inputs`. The old-layout reader is
private to comparison with a pre-cutover baseline.

## Final cutover

1. Fetch and merge the then-current `dev` into `Task/pde_folder_restructure`.
   Reconcile newer tooling and repeat isolated checks. Record source policy
   identities, fixture hashes and evaluation outcomes using the matching `dev`
   tooling before migrating.
2. Commit preparation changes so the checkout is clean. Review the migration:
   `python scripts/migration/restructure_gcp.py` (dry-run by default).
3. Resolve missing/stale plans with the matching old-layout `dev` harness before
   cutover; the migration refuses to rebuild or guess. Repeat dry-run after fixes.
4. Apply the reviewed migration:
   `python scripts/migration/restructure_gcp.py --apply`.
5. Review the migration's retained-plan and rebuild reports. Every source identity
   must map once; policy/fixture bytes and meaningful local configs are preserved.
   Base-only config consolidation can change effective hashes. The migration
   removes those invalidated plans and reports each old/new hash; it does not
   rebuild plans or rename them to imply validity. Run
   `python scripts/auto_test/auto_test.py gcp` to regenerate missing plans, then
   `python scripts/auto_test/auto_test.py gcp --verify-plan-cache`. After regeneration,
   a second migration dry-run must report a verified no-op. The migration never
   stages, commits, merges or pushes.
6. Run the full Python and Rego suites, structural/content lint, read-only plan
   verification and complete GCP evaluation with `--report`. Compare identities and
   outcomes with the recorded baseline; investigate every difference.
7. Complete portal integration checks and require passing CI before submitting the
   restructuring branch for merge into `dev`.

The migration chooses the most common normalized **base-only** source config,
using source-path order to break ties. Base-only means the standard Google
`required_providers` source declaration and empty `provider "google" {}` block.
Token comparison ignores whitespace and comments outside strings. Extra or
different declarations, provider settings, version constraints and uncertain
matches remain exact local overrides; the migration does not attempt general
Terraform semantic equivalence. If no base-only source config exists, preflight
fails rather than making a fixture-specific configuration global.

All base-only variants use the shared config after migration. Configs containing
locals or supporting resources remain local, including the certificate public
key, gRPC location helper and multicast dependencies. Local configuration replaces
the shared default entirely. Future local overrides survive migration reruns.

Every source plan must be present and valid for its original fixture before
migration. Only provably equivalent historical line-ending hash names may be
adopted. Unchanged effective hashes retain their plans; changed hashes require
regeneration. Counts are recalculated from the tree at execution time. Dry-run
returns 0 for a valid proposed migration, even if it lists future rebuilds.
Application or verification of a migrated tree returns 2 while plans are missing,
and prints regeneration instructions instead of claiming a verified no-op.
Stale/invalid plans, collisions and mixed or incomplete layouts abort with exit 1.

The entire `inputs/` tree is inventoried before mutation. Only migration sources,
empty directories and zero-byte `.gitkeep` placeholders are allowed; unexpected
files, nonempty placeholders, unmigrated platform data and links abort with paths.
Sources and cleanup targets are rechecked before application. After verifying the
moved content, identities, retained plans and expected missing plans, the migration
rechecks cleanup targets, deletes empty placeholders and removes empty directories
bottom-up, including `inputs/` and AWS/Azure placeholders. It never recursively
deletes unverified contents. An already migrated tree can receive cleanup-only
application for leftover empty input directories/placeholders, using the same
clean-checkout requirement. Missing plans still require regeneration afterward.

These tooling changes are tested on synthetic repositories only. Do not run
production migration during preparation. Before committing migrated data, complete
plan regeneration, read-only cache verification and full policy evaluation.

## Portal integration contract

The portal is outside this repository. Before cutover, verify that its policy
discovery and file links use argument directories and `policy.rego`; that plan
lookup passes the intended checkout root and uses its provider pin and selected
config; and that assignment ownership includes fixtures, overrides and plan files.
Report entries retain `service`, `resource`, `policy`, `passed` and existing
failure fields. Dotted argument names remain report identities. Keep the
`policy-results` artifact name and verify the portal can consume reports from
failed as well as successful evaluation runs. Verify its shared-tooling drift
comparison accepts the merged tooling and that pre-cutover baselines still work.
