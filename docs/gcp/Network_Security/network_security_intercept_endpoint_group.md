## 🛡️ Policy Deployment Engine: `network_security_intercept_endpoint_group`

This section provides a concise policy evaluation for the `network_security_intercept_endpoint_group` resource in GCP.

Reference: [Terraform Registry – network_security_intercept_endpoint_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_intercept_endpoint_group)

---

## 1. Argument Reference

### `intercept_deployment_group`
- Description: (Required) The deployment group that this endpoint group is connected to, for example: `projects/123456789/locations/global/interceptDeploymentGroups/my-dg`. See https://google.aip.dev/124.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The cloud location of the endpoint group, currently restricted to `global`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `intercept_endpoint_group_id`
- Description: (Required) The ID to use for the endpoint group, which will become the final component of the endpoint group's resource name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels are key/value pairs that help to organize and filter resources. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) User-provided description of the endpoint group. Used as additional context for the endpoint group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
