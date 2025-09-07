## 🛡️ Policy Deployment Engine: `vmwareengine_external_address`

This section provides a concise policy evaluation for the `vmwareengine_external_address` resource in GCP.

Reference: [Terraform Registry – vmwareengine_external_address](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vmwareengine_external_address)

---

## 1. Argument Reference

### `internal_ip`
- Description: (Required) The internal IP address of a workload VM.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Required) The resource name of the private cloud to create a new external address in. Resource names are schemeless URIs that follow the conventions in https://cloud.google.com/apis/design/resource_names. For example: projects/my-project/locations/us-west1-a/privateClouds/my-cloud
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The ID of the external IP Address.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) User-provided description for this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
