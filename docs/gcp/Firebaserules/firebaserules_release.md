## 🛡️ Policy Deployment Engine: `firebaserules_release`

This section provides a concise policy evaluation for the `firebaserules_release` resource in GCP.

Reference: [Terraform Registry – firebaserules_release](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebaserules_release)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Format: `projects/{project_id}/releases/{release_id}`\Firestore Rules Releases will **always** have the name 'cloud.firestore' | true | None | None |
| `ruleset_name` | Name of the `Ruleset` referred to by this `Release`. The `Ruleset` must exist for the `Release` to be created. - - - | true | None | None |
| `project` | The project for the resource | false | None | None |
