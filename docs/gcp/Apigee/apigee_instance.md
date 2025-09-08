## 🛡️ Policy Deployment Engine: `apigee_instance`

This section provides a concise policy evaluation for the `apigee_instance` resource in GCP.

Reference: [Terraform Registry – apigee_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_instance)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Resource ID of the instance. | true | None | None |
| `location` | Required. Compute Engine location where the instance resides. | true | None | None |
| `org_id` | The Apigee Organization associated with the Apigee instance, in the format `organizations/{{org_name}}`. | true | None | None |
| `peering_cidr_range` | The size of the CIDR block range that will be reserved by the instance. For valid values, see [CidrRange](https://cloud.google.com/apigee/docs/reference/apis/apigee/rest/v1/organizations.instances#CidrRange) on the documentation. | false | None | None |
| `ip_range` | IP range represents the customer-provided CIDR block of length 22 that will be used for the Apigee instance creation. This optional range, if provided, should be freely available as part of larger named range the customer has allocated to the Service Networking peering. If this is not provided, Apigee will automatically request for any available /22 CIDR block from Service Networking. The customer should use this CIDR block for configuring their firewall needs to allow traffic from Apigee. Input format: "a.b.c.d/22" | false | None | None |
| `description` | Description of the instance. | false | None | None |
| `display_name` | Display name of the instance. | false | None | None |
| `disk_encryption_key_name` | Customer Managed Encryption Key (CMEK) used for disk and volume encryption. Required for Apigee paid subscriptions only. Use the following format: `projects/([^/]+)/locations/([^/]+)/keyRings/([^/]+)/cryptoKeys/([^/]+)` | false | None | None |
| `consumer_accept_list` | Optional. Customer accept list represents the list of projects (id/number) on customer side that can privately connect to the service attachment. It is an optional field which the customers can provide during the instance creation. By default, the customer project associated with the Apigee organization will be included to the list. | false | None | None |

### access_logging_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Boolean flag that specifies whether the customer access log feature is enabled. | true | None | None |
| `filter` | Ship the access log entries that match the statusCode defined in the filter. The statusCode is the only expected/supported filter field. (Ex: statusCode) The filter will parse it to the Common Expression Language semantics for expression evaluation to build the filter condition. (Ex: "filter": statusCode >= 200 && statusCode < 300 ) | false | None | None |
