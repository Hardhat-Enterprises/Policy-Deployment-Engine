## 🛡️ Policy Deployment Engine: `apigee_developer`

This section provides a concise policy evaluation for the `apigee_developer` resource in GCP.

Reference: [Terraform Registry – apigee_developer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_developer)

---

## 1. Argument Reference

### `email`
- Description: (Required) Email address of the developer. This value is used to uniquely identify the developer in Apigee hybrid. Note that the email address has to be in lowercase only..
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `first_name`
- Description: (Required) First name of the developer.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `last_name`
- Description: (Required) Last name of the developer.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_name`
- Description: (Required) User name of the developer. Not used by Apigee hybrid.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `org_id`
- Description: (Required) The Apigee Organization associated with the Apigee instance, in the format `organizations/{{org_name}}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `attributes`
- Description: (Optional) Developer attributes (name/value pairs). The custom attribute limit is 18. Structure is [documented below](#nested_attributes). <a name="nested_attributes"></a>The `attributes` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Key of the attribute
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) Value of the attribute
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
