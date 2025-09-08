## 🛡️ Policy Deployment Engine: `apigee_dns_zone`

This section provides a concise policy evaluation for the `apigee_dns_zone` resource in GCP.

Reference: [Terraform Registry – apigee_dns_zone](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_dns_zone)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `domain` | Doamin for the zone. | true | None | None |
| `description` | Description for the zone. | true | None | None |
| `org_id` | The Apigee Organization associated with the Apigee instance, in the format `organizations/{{org_name}}`. | true | None | None |
| `dns_zone_id` | ID of the dns zone. | true | None | None |

### peering_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `target_project_id` | The ID of the project that contains the producer VPC network. | true | None | None |
| `target_network_id` | The name of the producer VPC network. | true | None | None |
