## 🛡️ Policy Deployment Engine: `document_ai_warehouse_location`

This section provides a concise policy evaluation for the `document_ai_warehouse_location` resource in GCP.

Reference: [Terraform Registry – document_ai_warehouse_location](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/document_ai_warehouse_location)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `database_type` | The type of database used to store customer data. Possible values are: `DB_INFRA_SPANNER`, `DB_CLOUD_SQL_POSTGRES`. | true | None | None |
| `access_control_mode` | The access control mode for accessing the customer data. Possible values are: `ACL_MODE_DOCUMENT_LEVEL_ACCESS_CONTROL_GCI`, `ACL_MODE_DOCUMENT_LEVEL_ACCESS_CONTROL_BYOID`, `ACL_MODE_UNIVERSAL_ACCESS`. | true | None | None |
| `project_number` | The unique identifier of the project. | true | None | None |
| `location` | The location in which the instance is to be provisioned. It takes the form projects/{projectNumber}/locations/{location}. | true | None | None |
| `kms_key` | The KMS key used for CMEK encryption. It is required that the kms key is in the same region as the endpoint. The same key will be used for all provisioned resources, if encryption is available. If the kmsKey is left empty, no encryption will be enforced. | false | None | None |
| `document_creator_default_role` | The default role for the person who create a document. Possible values are: `DOCUMENT_ADMIN`, `DOCUMENT_EDITOR`, `DOCUMENT_VIEWER`. | false | None | None |
