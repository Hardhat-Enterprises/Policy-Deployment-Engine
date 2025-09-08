## 🛡️ Policy Deployment Engine: `workstations_workstation_cluster`

This section provides a concise policy evaluation for the `workstations_workstation_cluster` resource in GCP.

Reference: [Terraform Registry – workstations_workstation_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/workstations_workstation_cluster)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network` | The relative resource name of the VPC network on which the instance can be accessed. It is specified in the following form: "projects/{projectNumber}/global/networks/{network_id}". | true | None | None |
| `subnetwork` | Name of the Compute Engine subnetwork in which instances associated with this cluster will be created. Must be part of the subnetwork specified for this cluster. | true | None | None |
| `workstation_cluster_id` | ID to use for the workstation cluster. | true | None | None |
| `labels` | Client-specified labels that are applied to the resource and that are also propagated to the underlying Compute Engine resources. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `display_name` | Human-readable name for this resource. | false | None | None |
| `annotations` | Client-specified annotations. This is distinct from labels. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `tags` | Resource manager tags bound to this resource. For example: "123/environment": "production", "123/costCenter": "marketing" | false | None | None |
| `location` | The location where the workstation cluster should reside. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### private_cluster_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_private_endpoint` | Whether Workstations endpoint is private. | true | None | None |
| `cluster_hostname` | (Output) Hostname for the workstation cluster. This field will be populated only when private endpoint is enabled. To access workstations in the cluster, create a new DNS zone mapping this domain name to an internal IP address and a forwarding rule mapping that address to the service attachment. | none | None | None |
| `service_attachment_uri` | (Output) Service attachment URI for the workstation cluster. The service attachment is created when private endpoint is enabled. To access workstations in the cluster, configure access to the managed service using (Private Service Connect)[https://cloud.google.com/vpc/docs/configure-private-service-connect-services]. | none | None | None |
| `allowed_projects` | Additional project IDs that are allowed to attach to the workstation cluster's service attachment. By default, the workstation cluster's project and the VPC host project (if different) are allowed. | false | None | None |

### domain_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `domain` | Domain used by Workstations for HTTP ingress. | true | None | None |
