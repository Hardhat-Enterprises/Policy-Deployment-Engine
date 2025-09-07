## 🛡️ Policy Deployment Engine: `apigee_env_references`

This section provides a concise policy evaluation for the `apigee_env_references` resource in GCP.

Reference: [Terraform Registry – apigee_env_references](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_env_references)

---

## 1. Argument Reference

### `name`
- Description: (Required) Required. The resource id of this reference. Values must match the regular expression [\w\s-.]+.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_type`
- Description: (Required) The type of resource referred to by this reference. Valid values are 'KeyStore' or 'TrustStore'.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `refers`
- Description: (Required) Required. The id of the resource to which this reference refers. Must be the id of a resource that exists in the parent environment and is of the given resourceType.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `env_id`
- Description: (Required) The Apigee environment group associated with the Apigee environment, in the format `organizations/{{org_name}}/environments/{{env_name}}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Optional. A human-readable description of this reference.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
