## 🛡️ Policy Deployment Engine: `bigtable_app_profile`

This section provides a concise policy evaluation for the `bigtable_app_profile` resource in GCP.

Reference: [Terraform Registry – bigtable_app_profile](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_app_profile)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `app_profile_id` | The unique name of the app profile in the form `[_a-zA-Z0-9][-_.a-zA-Z0-9]*`. | true | None | None |
| `description` | Long form description of the use case for this app profile. | false | None | None |
| `multi_cluster_routing_use_any` | If true, read/write requests are routed to the nearest cluster in the instance, and will fail over to the nearest cluster that is available in the event of transient errors or delays. Clusters in a region are considered equidistant. Choosing this option sacrifices read-your-writes consistency to improve availability. | false | None | None |
| `instance` | The name of the instance to create the app profile within. | false | None | None |
| `ignore_warnings` | If true, ignore safety checks when deleting/updating the app profile. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### single_cluster_routing Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cluster_id` | The cluster to which read/write requests should be routed. | true | None | None |
| `allow_transactional_writes` | If true, CheckAndMutateRow and ReadModifyWriteRow requests are allowed by this app profile. It is unsafe to send these requests to the same table/row/column in multiple clusters. | false | None | None |

### standard_isolation Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `priority` | The priority of requests sent using this app profile. Possible values are: `PRIORITY_LOW`, `PRIORITY_MEDIUM`, `PRIORITY_HIGH`. | true | None | None |

### data_boost_isolation_read_only Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `compute_billing_owner` | The Compute Billing Owner for this Data Boost App Profile. Possible values are: `HOST_PAYS`. | true | None | None |
