## 🛡️ Policy Deployment Engine: `compute_preview_feature`

This section provides a concise policy evaluation for the `compute_preview_feature` resource in GCP.

Reference: [Terraform Registry – compute_preview_feature](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_preview_feature)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `activation_status` | The activation status of the preview feature. Possible values are: `ENABLED`, `DISABLED`. | true | None | None |
| `name` | The name of the preview feature. | true | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### rollout_operation Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `rollout_input` | The input for the rollout operation. Structure is [documented below](#nested_rollout_operation_rollout_input). | false | None | None |

### rollout_input Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `predefined_rollout_plan` | Predefined rollout plans. Possible values are: `ROLLOUT_PLAN_FAST_ROLLOUT`. | true | None | None |
