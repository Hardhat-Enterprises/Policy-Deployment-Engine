## 🛡️ Policy Deployment Engine: `apigee_environment_keyvaluemaps_entries`

This section provides a concise policy evaluation for the `apigee_environment_keyvaluemaps_entries` resource in GCP.

Reference: [Terraform Registry – apigee_environment_keyvaluemaps_entries](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_environment_keyvaluemaps_entries)

---

## 1. Argument Reference

### `name`
- Description: (Required) Required. Resource URI that can be used to identify the scope of the key value map entries.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Required) Required. Data or payload that is being retrieved and associated with the unique key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `env_keyvaluemap_id`
- Description: (Required) The Apigee environment keyvalumaps Id associated with the Apigee environment, in the format `organizations/{{org_name}}/environments/{{env_name}}/keyvaluemaps/{{keyvaluemap_name}}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
