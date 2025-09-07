## 🛡️ Policy Deployment Engine: `cloud_ids_endpoint`

This section provides a concise policy evaluation for the `cloud_ids_endpoint` resource in GCP.

Reference: [Terraform Registry – cloud_ids_endpoint](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_ids_endpoint)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the endpoint in the format projects/{project_id}/locations/{locationId}/endpoints/{endpointId}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Required) Name of the VPC network that is connected to the IDS endpoint. This can either contain the VPC network name itself (like "src-net") or the full URL to the network (like "projects/{project_id}/global/networks/src-net").
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `severity`
- Description: (Required) The minimum alert severity level that is reported by the endpoint. Possible values are: `INFORMATIONAL`, `LOW`, `MEDIUM`, `HIGH`, `CRITICAL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the endpoint.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of the endpoint.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `threat_exceptions`
- Description: (Optional) Configuration for threat IDs excluded from generating alerts. Limit: 99 IDs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
