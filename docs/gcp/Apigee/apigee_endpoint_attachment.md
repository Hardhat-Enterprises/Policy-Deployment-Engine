## 🛡️ Policy Deployment Engine: `apigee_endpoint_attachment`

This section provides a concise policy evaluation for the `apigee_endpoint_attachment` resource in GCP.

Reference: [Terraform Registry – apigee_endpoint_attachment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_endpoint_attachment)

---

## 1. Argument Reference

### `location`
- Description: (Required) Location of the endpoint attachment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_attachment`
- Description: (Required) Format: projects/*/regions/*/serviceAttachments/*
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `org_id`
- Description: (Required) The Apigee Organization associated with the Apigee instance, in the format `organizations/{{org_name}}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `endpoint_attachment_id`
- Description: (Required) ID of the endpoint attachment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
