## 🛡️ Policy Deployment Engine: `compute_service_attachment`

This section provides a concise policy evaluation for the `compute_service_attachment` resource in GCP.

Reference: [Terraform Registry – compute_service_attachment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_service_attachment)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `connection_preference` | The connection preference to use for this service attachment. Valid values include "ACCEPT_AUTOMATIC", "ACCEPT_MANUAL". | true | None | None |
| `target_service` | The URL of a service serving the endpoint identified by this service attachment. | true | None | None |
| `nat_subnets` | An array of subnets that is provided for NAT in this service attachment. | true | None | None |
| `enable_proxy_protocol` | If true, enable the proxy protocol which is for supplying client TCP/IP address data in TCP connections that traverse proxies on their way to destination servers. | true | None | None |
| `description` | An optional description of this resource. | false | None | None |
| `domain_names` | If specified, the domain name will be used during the integration between the PSC connected endpoints and the Cloud DNS. For example, this is a valid domain name: "p.mycompany.com.". Current max number of domain names supported is 1. | false | None | None |
| `consumer_reject_lists` | An array of projects that are not allowed to connect to this service attachment. | false | None | None |
| `reconcile_connections` | This flag determines whether a consumer accept/reject list change can reconcile the statuses of existing ACCEPTED or REJECTED PSC endpoints. If false, connection policy update will only affect existing PENDING PSC endpoints. Existing ACCEPTED/REJECTED endpoints will remain untouched regardless how the connection policy is modified . If true, update will affect both PENDING and ACCEPTED/REJECTED PSC endpoints. For example, an ACCEPTED PSC endpoint will be moved to REJECTED if its project is added to the reject list. | false | None | None |
| `propagated_connection_limit` | The number of consumer spokes that connected Private Service Connect endpoints can be propagated to through Network Connectivity Center. This limit lets the service producer limit how many propagated Private Service Connect connections can be established to this service attachment from a single consumer. If the connection preference of the service attachment is ACCEPT_MANUAL, the limit applies to each project or network that is listed in the consumer accept list. If the connection preference of the service attachment is ACCEPT_AUTOMATIC, the limit applies to each project that contains a connected endpoint. If unspecified, the default propagated connection limit is 250. To explicitly send a zero value, set `send_propagated_connection_limit_if_zero = true`. | false | None | None |
| `region` | URL of the region where the resource resides. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `send_propagated_connection_limit_if_zero` | When false, setting propagated_connection_limit to zero causes the provider to use to the API's default value. When true, the provider will set propagated_connection_limit to zero. Defaults to false. | none | None | None |

### consumer_accept_lists Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project_id_or_num` | A project that is allowed to connect to this service attachment. Only one of project_id_or_num and network_url may be set. | false | None | None |
| `network_url` | The network that is allowed to connect to this service attachment. Only one of project_id_or_num and network_url may be set. | false | None | None |
| `connection_limit` | The number of consumer forwarding rules the consumer project can create. | true | None | None |
