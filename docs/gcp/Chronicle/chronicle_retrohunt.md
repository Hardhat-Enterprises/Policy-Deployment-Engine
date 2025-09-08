## 🛡️ Policy Deployment Engine: `chronicle_retrohunt`

This section provides a concise policy evaluation for the `chronicle_retrohunt` resource in GCP.

Reference: [Terraform Registry – chronicle_retrohunt](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/chronicle_retrohunt)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location of the resource. This is the geographical region where the Chronicle instance resides, such as "us" or "europe-west2". | true | None | None |
| `instance` | The unique identifier for the Chronicle instance, which is the same as the customer ID. | true | None | None |
| `rule` | The Rule ID of the rule. | true | None | None |
| `retrohunt` | The retrohunt ID of the Retrohunt. A retrohunt is an execution of a Rule over a time range in the past. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### process_interval Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `start_time` | Inclusive start of the interval. | true | None | None |
| `end_time` | Exclusive end of the interval. | true | None | None |
