## 🛡️ Policy Deployment Engine: `apigee_security_profile_v2`

This section provides a concise policy evaluation for the `apigee_security_profile_v2` resource in GCP.

Reference: [Terraform Registry – apigee_security_profile_v2](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_security_profile_v2)

---

## 1. Argument Reference

### `profile_assessment_configs`
- Description: (Required) A map of the assessment name and the assessment config. Structure is [documented below](#nested_profile_assessment_configs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `org_id`
- Description: (Required) The Apigee Organization associated with the Apigee Security Profile V2, in the format `organizations/{{org_name}}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `profile_id`
- Description: (Required) Resource ID of the security profile.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the security profile. <a name="nested_profile_assessment_configs"></a>The `profile_assessment_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `assessment`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weight`
- Description: (Required) The weight of the assessment. Possible values are: `MINOR`, `MODERATE`, `MAJOR`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
