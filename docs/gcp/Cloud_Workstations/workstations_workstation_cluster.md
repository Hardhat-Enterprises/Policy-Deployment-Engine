## 🛡️ Policy Deployment Engine: `workstations_workstation_cluster`

This section provides a concise policy evaluation for the `workstations_workstation_cluster` resource in GCP.

Reference: [Terraform Registry – workstations_workstation_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/workstations_workstation_cluster)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `network` | The relative resource name of the VPC network on which the instance can be accessed. It is specified in the following form: "projects/{projectNumber}/global/networks/{network_id}". | true | true | Workstation clusters should use approved VPC networks so that access is restricted to trusted network boundaries and managed infrastructure. | The workstation cluster uses an approved network, such as workstation-cluster. | The workstation cluster uses an unapproved network, such as network-1. |
| `subnetwork` | Name of the Compute Engine subnetwork in which instances associated with this cluster will be created. Must be part of the subnetwork specified for this cluster. | true | false | None | None | None |
| `workstation_cluster_id` | ID to use for the workstation cluster. | true | true | Workstation cluster IDs should follow an approved naming standard so that clusters can be clearly identified, audited, and managed. | The workstation cluster uses an approved workstation_cluster_id, such as workstation-cluster. | The workstation cluster uses an unapproved workstation_cluster_id, such as wrong-cluster. |
| `labels` | Client-specified labels that are applied to the resource and that are also propagated to the underlying Compute Engine resources. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | true | Labels should follow the required labelling standard so that workstation clusters can be tracked by ownership, environment, and operational responsibility. | The workstation cluster includes approved labels, such as label = key. | The workstation cluster is missing required labels or uses unapproved label values. |
| `display_name` | Human-readable name for this resource. | false | false | Display name is mainly used as a human-readable identifier and does not directly control workstation cluster security settings. | None | None |
| `annotations` | Client-specified annotations. This is distinct from labels. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | Annotations provide additional metadata, but this policy set does not use annotations to enforce security controls. | None | None |
| `private_cluster_config` | Configuration for private cluster. Structure is [documented below](#nested_private_cluster_config). | false | false | None | None | None |
| `domain_config` | Configuration options for a custom domain. Structure is [documented below](#nested_domain_config). | false | false | Custom domain configuration affects HTTP ingress naming, but this policy set does not validate approved domains. | None | None |
| `tags` | Resource manager tags bound to this resource. For example: "123/environment": "production", "123/costCenter": "marketing" | false | false | Tags help organise and classify resources, but this policy set does not validate resource manager tag values. | None | None |
| `location` | The location where the workstation cluster should reside. | false | true | Workstation clusters should be deployed only in approved regions to meet organisational, compliance, and data governance requirements. | The workstation cluster is deployed in an approved location, such as us-central1. | The workstation cluster is deployed in an unapproved location, such as us-east1. |
| `project` | If it is not provided, the provider project is used. | false | true | Workstation clusters should be created only in approved projects so that they remain under the correct governance, billing, monitoring, and access control boundaries. | The workstation cluster is created in an approved project, such as 925810350503. | The workstation cluster is created in an unapproved project. |

### private_cluster_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enable_private_endpoint` | Whether Workstations endpoint is private. | true | false | Private endpoint usage can improve network isolation, but this policy set does not enforce private endpoint configuration. | None | None |
| `cluster_hostname` | (Output) Hostname for the workstation cluster. This field will be populated only when private endpoint is enabled. To access workstations in the cluster, create a new DNS zone mapping this domain name to an internal IP address and a forwarding rule mapping that address to the service attachment. | false | false | This is an output value populated when private endpoint is enabled and is not directly assessed by this policy set. | None | None |
| `service_attachment_uri` | (Output) Service attachment URI for the workstation cluster. The service attachment is created when private endpoint is enabled. To access workstations in the cluster, configure access to the managed service using (Private Service Connect)[https://cloud.google.com/vpc/docs/configure-private-service-connect-services]. | false | false | This is an output value related to private endpoint configuration and is not directly assessed by this policy set. | None | None |
| `allowed_projects` | Additional project IDs that are allowed to attach to the workstation cluster's service attachment. By default, the workstation cluster's project and the VPC host project (if different) are allowed. | false | false | Allowed projects can affect access to the service attachment, but this policy set does not validate approved project attachments. | None | None |

### domain_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `domain` | Domain used by Workstations for HTTP ingress. | true | false | None | None | None |
