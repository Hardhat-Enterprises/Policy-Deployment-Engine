## 🛡️ Policy Deployment Engine: `vertex_ai_index_endpoint`

This section provides a concise policy evaluation for the `vertex_ai_index_endpoint` resource in GCP.

Reference: [Terraform Registry – vertex_ai_index_endpoint](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vertex_ai_index_endpoint)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) The display name of the Index. The name can be up to 128 characters long and can consist of any UTF-8 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) The description of the Index.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The labels with user-defined metadata to organize your Indexes. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) The full name of the Google Compute Engine [network](https://cloud.google.com//compute/docs/networks-and-firewalls#networks) to which the index endpoint should be peered. Private services access must already be configured for the network. If left unspecified, the index endpoint is not peered with any network. [Format](https://cloud.google.com/compute/docs/reference/rest/v1/networks/insert): `projects/{project}/global/networks/{network}`. Where `{project}` is a project number, as in `12345`, and `{network}` is network name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_service_connect_config`
- Description: (Optional) Optional. Configuration for private service connect. `network` and `privateServiceConnectConfig` are mutually exclusive. Structure is [documented below](#nested_private_service_connect_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `public_endpoint_enabled`
- Description: (Optional) If true, the deployed index will be accessible through public endpoint.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The region of the index endpoint. eg us-central1
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_private_service_connect_config"></a>The `private_service_connect_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_private_service_connect`
- Description: (Required) If set to true, the IndexEndpoint is created without private service access.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_allowlist`
- Description: (Optional) A list of Projects from which the forwarding rule will target the service attachment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
