## 🛡️ Policy Deployment Engine: `redis_cluster_user_created_connections`

This section provides a concise policy evaluation for the `redis_cluster_user_created_connections` resource in GCP.

Reference: [Terraform Registry – redis_cluster_user_created_connections](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/redis_cluster_user_created_connections)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of the Redis cluster these endpoints should be added to. | true | false | None | None | None |
| `region` | The name of the region of the Redis cluster these endpoints should be added to. | true | false | None | None | None |
| `cluster_endpoints` | A list of cluster endpoints Structure is [documented below](#nested_cluster_endpoints). | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `connections` |  | false | false | None | None | None |
| `psc_connection` |  | false | false | None | None | None |

### cluster_endpoints Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `connections` | Structure is [documented below](#nested_cluster_endpoints_cluster_endpoints_connections). | false | false | None | None | None |

### connections Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `psc_connection` | Detailed information of a PSC connection that is created by the customer who owns the cluster. Structure is [documented below](#nested_cluster_endpoints_cluster_endpoints_connections_connections_psc_connection). | false | false | None | None | None |

### psc_connection Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `psc_connection_id` | The PSC connection id of the forwarding rule connected to the service attachment. | true | false | None | None | None |
| `address` | The IP allocated on the consumer network for the PSC forwarding rule. | true | false | None | None | None |
| `forwarding_rule` | The URI of the consumer side forwarding rule. Format: projects/{project}/regions/{region}/forwardingRules/{forwarding_rule} | true | false | None | None | None |
| `project_id` | The consumer project_id where the forwarding rule is created from. | false | false | None | None | None |
| `network` | The consumer network where the IP address resides, in the form of projects/{project_id}/global/networks/{network_id}. | true | false | None | None | None |
| `service_attachment` | The service attachment which is the target of the PSC connection, in the form of projects/{project-id}/regions/{region}/serviceAttachments/{service-attachment-id}. | true | false | None | None | None |
| `psc_connection_status` | (Output) Output Only. The status of the PSC connection: whether a connection exists and ACTIVE or it no longer exists. Possible values: ACTIVE NOT_FOUND | false | false | None | None | None |
| `connection_type` | (Output) Output Only. Type of a PSC Connection. Possible values: CONNECTION_TYPE_DISCOVERY CONNECTION_TYPE_PRIMARY CONNECTION_TYPE_READER | false | false | None | None | None |
