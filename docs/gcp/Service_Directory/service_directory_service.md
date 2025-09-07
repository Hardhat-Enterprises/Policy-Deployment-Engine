## 🛡️ Policy Deployment Engine: `service_directory_service`

This section provides a concise policy evaluation for the `service_directory_service` resource in GCP.

Reference: [Terraform Registry – service_directory_service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_directory_service)

---

## 1. Argument Reference

### `namespace`
- Description: (Required) The resource name of the namespace this service will belong to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_id`
- Description: (Required) The Resource ID must be 1-63 characters long, including digits, lowercase letters or the hyphen character.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata`
- Description: (Optional) Metadata for the service. This data can be consumed by service clients. The entire metadata dictionary may contain up to 2000 characters, spread across all key-value pairs. Metadata that goes beyond any these limits will be rejected.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
