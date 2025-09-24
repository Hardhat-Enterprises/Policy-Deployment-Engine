# Bigtable policies – quick guide 

### What each area checks
- Instance
  - deletion_protection: enable safeguards against accidental deletion
  - instance_type: avoid DEVELOPMENT for prod use cases
  - display_name: shouldn’t be empty
- Table
  - deletion_protection: flags only when explicitly set to false (low-noise)
  - column_families: require at least one
- GC policy
  - max_age: must be set (avoid unbounded retention)
- IAM
  - instance_iam_binding: block owner/editor/bigtable.admin
  - table_iam_binding: block allUsers/allAuthenticatedUsers
  - backup_iam_binding: block allUsers/allAuthenticatedUsers
- App profile
  - routing policy present (single_cluster_routing or multi_cluster_routing_use_any)

### How messages are produced
Each rule defines `conditions`. The shared helper composes a `message` and `details` with:
- situation description
- non-compliant resources
- suggested remedies

### Quick test with OPA
1) Create a tiny input (save as `test_bigtable_plan.json` at repo root or here):
```
{
  "planned_values": {
    "root_module": {
      "resources": [
        {
          "address": "google_bigtable_instance.test",
          "type": "google_bigtable_instance",
          "name": "test-instance",
          "values": {
            "name": "test-instance",
            "deletion_protection": false,
            "instance_type": "DEVELOPMENT",
            "display_name": ""
          }
        },
        {
          "address": "google_bigtable_table.test",
          "type": "google_bigtable_table",
          "name": "test-table",
          "values": {
            "name": "test-table",
            "deletion_protection": false,
            "column_family": []
          }
        }
      ]
    }
  }
}
```

2) Evaluate one policy (table deletion protection):
```
opa eval \
  --data policies/gcp/_helpers/helpers.rego \
  --data policies/gcp/bigtable/google_bigtable_table/vars.rego \
  --data policies/gcp/bigtable/google_bigtable_table/deletion_protection/policy.rego \
  --input test_bigtable_plan.json \
  "data.terraform.gcp.security.bigtable.google_bigtable_table.deletion_protection.message"
```

3) Evaluate the whole Bigtable package:
```
opa eval \
  --data policies/gcp/ \
  --input test_bigtable_plan.json \
  --format pretty \
  "data.terraform.gcp.security.bigtable"
```

### Notes
- Table deletion protection uses a conditional blacklist (only flags when explicitly `false`) so we avoid noise and remain compatible with `lifecycle { prevent_destroy = true }`.
- We intentionally skipped unverifiable/advisory checks for now to keep the signal high.
