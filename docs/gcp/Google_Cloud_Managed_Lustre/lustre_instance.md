## 🛡️ Policy Deployment Engine: `lustre_instance`

This section provides a concise policy evaluation for the `lustre_instance` resource in GCP.

Reference: [Terraform Registry – lustre_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/lustre_instance)

---

## 1. Argument Reference

### `capacity_gib`
- Description: (Required) The storage capacity of the instance in gibibytes (GiB). Allowed values are from `18000` to `954000`, in increments of 9000.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filesystem`
- Description: (Required) The filesystem name for this instance. This name is used by client-side tools, including when mounting the instance. Must be eight characters or less and can only contain letters and numbers.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Required) The full name of the VPC network to which the instance is connected. Must be in the format `projects/{project_id}/global/networks/{network_name}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `per_unit_storage_throughput`
- Description: (Required) The throughput of the instance in MB/s/TiB. Valid values are 125, 250, 500, 1000.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_id`
- Description: (Required) The name of the Managed Lustre instance. * Must contain only lowercase letters, numbers, and hyphens. * Must start with a letter. * Must be between 1-63 characters. * Must end with a number or a letter.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gke_support_enabled`
- Description: (Optional) Indicates whether you want to enable support for GKE clients. By default, GKE clients are not supported.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A user-readable description of the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
