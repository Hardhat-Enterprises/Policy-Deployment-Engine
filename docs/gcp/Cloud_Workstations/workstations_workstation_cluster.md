## 🛡️ Policy Deployment Engine: `workstations_workstation_cluster`

This section provides a concise policy evaluation for the `workstations_workstation_cluster` resource in GCP.

Reference: [Terraform Registry – workstations_workstation_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/workstations_workstation_cluster)

---

## 1. Argument Reference

### `network`
- Description: (Required) The relative resource name of the VPC network on which the instance can be accessed. It is specified in the following form: "projects/{projectNumber}/global/networks/{network_id}".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnetwork`
- Description: (Required) Name of the Compute Engine subnetwork in which instances associated with this cluster will be created. Must be part of the subnetwork specified for this cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `workstation_cluster_id`
- Description: (Required) ID to use for the workstation cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Client-specified labels that are applied to the resource and that are also propagated to the underlying Compute Engine resources. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Human-readable name for this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Client-specified annotations. This is distinct from labels. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_cluster_config`
- Description: (Optional) Configuration for private cluster. Structure is [documented below](#nested_private_cluster_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `domain_config`
- Description: (Optional) Configuration options for a custom domain. Structure is [documented below](#nested_domain_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tags`
- Description: (Optional) Resource manager tags bound to this resource. For example: "123/environment": "production", "123/costCenter": "marketing"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The location where the workstation cluster should reside.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_private_cluster_config"></a>The `private_cluster_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_private_endpoint`
- Description: (Required) Whether Workstations endpoint is private.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_hostname`
- Description: (Output) Hostname for the workstation cluster. This field will be populated only when private endpoint is enabled. To access workstations in the cluster, create a new DNS zone mapping this domain name to an internal IP address and a forwarding rule mapping that address to the service attachment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_attachment_uri`
- Description: (Output) Service attachment URI for the workstation cluster. The service attachment is created when private endpoint is enabled. To access workstations in the cluster, configure access to the managed service using (Private Service Connect)[https://cloud.google.com/vpc/docs/configure-private-service-connect-services].
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_projects`
- Description: (Optional) Additional project IDs that are allowed to attach to the workstation cluster's service attachment. By default, the workstation cluster's project and the VPC host project (if different) are allowed. <a name="nested_domain_config"></a>The `domain_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `domain`
- Description: (Required) Domain used by Workstations for HTTP ingress.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
