## 🛡️ Policy Deployment Engine: `network_security_intercept_deployment`

This section provides a concise policy evaluation for the `network_security_intercept_deployment` resource in GCP.

Reference: [Terraform Registry – network_security_intercept_deployment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_intercept_deployment)

---

## 1. Argument Reference

### `forwarding_rule`
- Description: (Required) The regional forwarding rule that fronts the interceptors, for example: `projects/123456789/regions/us-central1/forwardingRules/my-rule`. See https://google.aip.dev/124.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `intercept_deployment_group`
- Description: (Required) The deployment group that this deployment is a part of, for example: `projects/123456789/locations/global/interceptDeploymentGroups/my-dg`. See https://google.aip.dev/124.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The cloud location of the deployment, e.g. `us-central1-a` or `asia-south1-b`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `intercept_deployment_id`
- Description: (Required) The ID to use for the new deployment, which will become the final component of the deployment's resource name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels are key/value pairs that help to organize and filter resources. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) User-provided description of the deployment. Used as additional context for the deployment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
