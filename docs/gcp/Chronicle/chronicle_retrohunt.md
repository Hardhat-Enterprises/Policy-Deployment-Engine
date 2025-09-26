## 🛡️ Policy Deployment Engine: `chronicle_retrohunt`

This section provides a concise policy evaluation for the `chronicle_retrohunt` resource in GCP.

Reference: [Terraform Registry – chronicle_retrohunt](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/chronicle_retrohunt)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `process_interval` | Represents a time interval, encoded as a Timestamp start (inclusive) and a Timestamp end (exclusive). The start must be less than or equal to the end. When the start equals the end, the interval is empty (matches no time). When both start and end are unspecified, the interval matches any time. Structure is [documented below](#nested_process_interval). | true | false | None | None | None |
| `location` | The location of the resource. This is the geographical region where the Chronicle instance resides, such as "us" or "europe-west2". | true | true | Restricting Chronicle resources to approved regions ensures compliance with data residency and service availability requirements. | australia-southeast1 | Any location other than 'australia-southeast1', such as 'europe-west3', is considered non-compliant. |
| `instance` | The unique identifier for the Chronicle instance, which is the same as the customer ID. | true | false | None | None | None |
| `rule` | The Rule ID of the rule. | true | false | None | None | None |
| `retrohunt` | The retrohunt ID of the Retrohunt. A retrohunt is an execution of a Rule over a time range in the past. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |

### process_interval Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `start_time` | Inclusive start of the interval. | true | false | None | None | None |
| `end_time` | Exclusive end of the interval. | true | false | None | None | None |
