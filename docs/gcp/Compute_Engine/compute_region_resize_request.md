## 🛡️ Policy Deployment Engine: `compute_region_resize_request`

This section provides a concise policy evaluation for the `compute_region_resize_request` resource in GCP.

Reference: [Terraform Registry – compute_region_resize_request](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_resize_request)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name of this resize request. The name must be 1-63 characters long, and comply with RFC1035. | true | None | None |
| `resize_by` | The number of instances to be created by this resize request. The group's target size will be increased by this number. | true | None | None |
| `instance_group_manager` | The reference of the regional instance group manager this ResizeRequest is a part of. | true | None | None |
| `description` | An optional description of this resize-request. | false | None | None |
| `region` | The reference of the compute region scoping this request. If it is not provided, the provider region is used. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### requested_run_duration Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `seconds` | Span of time at a resolution of a second. Must be from 600 to 604800 inclusive. Note: minimum and maximum allowed range for requestedRunDuration is 10 minutes (600 seconds) and 7 days(604800 seconds) correspondingly. | true | None | None |
| `nanos` | Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 seconds field and a positive nanos field. Must be from 0 to 999,999,999 inclusive. | false | None | None |
