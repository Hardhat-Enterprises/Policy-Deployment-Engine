## 🛡️ Policy Deployment Engine: `service_directory_endpoint`

This section provides a concise policy evaluation for the `service_directory_endpoint` resource in GCP.

Reference: [Terraform Registry – service_directory_endpoint](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_directory_endpoint)

---

## 1. Argument Reference

### `service`
- Description: (Required) The resource name of the service that this endpoint provides.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `endpoint_id`
- Description: (Required) The Resource ID must be 1-63 characters long, including digits, lowercase letters or the hyphen character.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `address`
- Description: (Optional) IPv4 or IPv6 address of the endpoint.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) Port that the endpoint is running on, must be in the range of [0, 65535]. If unspecified, the default is 0.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata`
- Description: (Optional) Metadata for the endpoint. This data can be consumed by service clients. The entire metadata dictionary may contain up to 512 characters, spread across all key-value pairs. Metadata that goes beyond any these limits will be rejected.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) The URL to the network, such as projects/PROJECT_NUMBER/locations/global/networks/NETWORK_NAME.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
