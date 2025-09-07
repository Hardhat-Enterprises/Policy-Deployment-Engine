## 🛡️ Policy Deployment Engine: `document_ai_warehouse_location`

This section provides a concise policy evaluation for the `document_ai_warehouse_location` resource in GCP.

Reference: [Terraform Registry – document_ai_warehouse_location](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/document_ai_warehouse_location)

---

## 1. Argument Reference

### `database_type`
- Description: (Required) The type of database used to store customer data. Possible values are: `DB_INFRA_SPANNER`, `DB_CLOUD_SQL_POSTGRES`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_control_mode`
- Description: (Required) The access control mode for accessing the customer data. Possible values are: `ACL_MODE_DOCUMENT_LEVEL_ACCESS_CONTROL_GCI`, `ACL_MODE_DOCUMENT_LEVEL_ACCESS_CONTROL_BYOID`, `ACL_MODE_UNIVERSAL_ACCESS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_number`
- Description: (Required) The unique identifier of the project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location in which the instance is to be provisioned. It takes the form projects/{projectNumber}/locations/{location}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key`
- Description: (Optional) The KMS key used for CMEK encryption. It is required that the kms key is in the same region as the endpoint. The same key will be used for all provisioned resources, if encryption is available. If the kmsKey is left empty, no encryption will be enforced.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `document_creator_default_role`
- Description: (Optional) The default role for the person who create a document. Possible values are: `DOCUMENT_ADMIN`, `DOCUMENT_EDITOR`, `DOCUMENT_VIEWER`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
