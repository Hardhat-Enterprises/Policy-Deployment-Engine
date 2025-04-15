# ✅ GCP Backup & DR Vault Policy – `ignore_inactive_datasources`

This policy checks whether all Google Cloud Backup and DR Vault resources have the `ignore_inactive_datasources` attribute set to `true`. This helps ensure that your backup vaults don't get blocked by inactive or outdated data sources.

---

## 🛡️ Why This Policy Matters

The `ignore_inactive_datasources` field tells Google Backup & DR to skip any inactive data sources during operations.  
If this value is not correctly configured, it may prevent vault deletions or cause unnecessary dependency issues.

> **Compliant Setting:**  
> `ignore_inactive_datasources = true`

---

## 📁 Directory Structure

```
.
├── policies/
│   └── gcp/
│       └── backupdr/
│           └── vault/
│               └── ignore_inactive_datasources/
│                   ├── policy.rego
│                   └── vars.rego
├── inputs/
│   └── gcp/
│       └── backupdr/
│           └── vault/
│               └── ignore_inactive_datasources/
│                   └── plan.json
```

---

## 🔍 What This Policy Does

1. Looks for all resources of type `google_backup_dr_backup_vault`
2. Checks if `ignore_inactive_datasources` is set to `true`
3. Reports non-compliant resources where the value is `false` or missing

---

## 🧪 How to Run the Policy

Use the command below to evaluate compliance:

```bash
opa eval \
--data ./policies/gcp \
--input ./inputs/gcp/backupdr/vault/ignore_inactive_datasources/plan.json \
--format pretty \
"data.terraform.gcp.security.backupdr.vault.ignore_inactive_datasources.summary.message"
```

### ✅ Sample Output:

```
[
  "Total GCP Backup Vault detected: 2",
  "Non-compliant GCP Backup Vault: 0/2"
]
```

---

## 📊 Compliance Summary

| Attribute                     | Required Value |
|------------------------------|----------------|
| `ignore_inactive_datasources` | `true`         |

---

## 👨‍💻 Maintainer Notes

This policy was created as part of the GCP Backup & DR service compliance hardening initiative using the Policy Deployment Engine (PDE).
