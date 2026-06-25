# Fixture migration — status

✅ **Dependency-resource backlog is cleared.** All input fixtures now contain
only their tested resource type, use the `compliant_example_N` /
`non_compliant_example_N` label convention, and pass:

```
python scripts/linters/linter.py --tree all   # content checks on by default; 0 errors
```

Orphan policies (a `<arg>.rego` with no input fixture) have been deleted so every
remaining policy has an input to test it (`docs/` is unchanged — re-add policies +
inputs when revisiting those resources). auto_test reports 0 unmatched, 0 orphans.

## ⚠️ Outstanding: validate the injected fake values

Where dependencies were removed, their references were replaced with best-effort
GCP-format fake values (e.g. `projects/<p>/topics/<t>`, `accessPolicies/123456789`,
service-account emails) built from each dependency's own literals. These were
**not** validated with `terraform plan` (no terraform/OPA in the authoring env).

Before relying on the fixtures, run a `terraform plan` pass over `inputs/gcp` and
correct any fake value the provider rejects. Hand-authored fixtures that warrant a
closer look:

- `App Engine/google_app_engine_standard_app_version/service` — source_url + SA email rebuilt by hand.
- `Backup for GKE/google_gke_backup_restore_channel/name` — tested resource was missing; authored from docs.
- `OS Config v2/google_os_config_v2_policy_orchestrator_for_folder/*` — long dependency chain removed; folder_id faked.
