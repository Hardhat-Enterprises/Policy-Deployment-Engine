## 🛡️ Policy Deployment Engine: `active_directory_peering`

This section provides a concise policy evaluation for the `active_directory_peering` resource in GCP.

Reference: [Terraform Registry – active_directory_peering](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/active_directory_peering)

---

## 1. Argument Reference

### `authorized_network`
- Description: (Required) The full names of the Google Compute Engine networks to which the instance is connected. Caller needs to make sure that CIDR subnets do not overlap between networks, else peering creation will fail.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `domain_resource`
- Description: (Required) Full domain resource path for the Managed AD Domain involved in peering. The resource path should be in the form projects/{projectId}/locations/global/domains/{domainName}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `peering_id`
- Description: (Required)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Resource labels that can contain user-provided metadata **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `status`
- Description: (Optional) The current state of this Peering.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `status_message`
- Description: (Optional) Additional information about the current status of this peering, if available.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
