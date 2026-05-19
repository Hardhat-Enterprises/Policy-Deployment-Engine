## 🛡️ Policy Deployment Engine: `google_dns_response_policy`
This section provides a concise policy evaluation for the `google_dns_response_policy` resource in GCP.
Reference: [Terraform Registry – google_dns_response_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_response_policy)
---
## Argument Reference  
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `response_policy_name` | The user assigned name for this Response Policy. | true | false | The policy name has no independent security policy impact. | None | None |
| `description` | The description of the response policy. Defaults to 'Managed by Terraform' if not set. | false | false | Description has no direct security impact on the resource or data contained. While a meaningful description improves governance and audit traceability, it does not constitute a security control and no policy has been implemented for this argument. | None | None |
| `networks` | The list of network names specifying networks to which this policy is applied. Structure is documented below. | false | false | Network binding has no independent security policy impact at this level. | None | None |
| `gke_clusters` | The list of Google Kubernetes Engine clusters that can see this zone. Structure is documented below. | false | false | GKE cluster binding has no independent security policy impact at this level. | None | None |
| `project` | The ID of the project in which the resource belongs. | false | false | Project ID has no impact on the security of the resource or data contained. | None | None |

### networks Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `network_url` | The fully qualified URL of the VPC network to bind to. | true | false | Network URL binding has no independent security policy impact at this level. | None | None |

### gke_clusters Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `gke_cluster_name` | The resource name of the cluster to bind this ManagedZone to. | true | false | GKE cluster name has no independent security policy impact at this level. | None | None |
