## 🛡️ Policy Deployment Engine: `secure_source_manager_instance`

This section provides a concise policy evaluation for the `secure_source_manager_instance` resource in GCP.

Reference: [Terraform Registry – secure_source_manager_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secure_source_manager_instance)

---

## 1. Argument Reference

### `location`
- Description: (Required) The location for the Instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_id`
- Description: (Required) The name for the Instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key`
- Description: (Optional) Customer-managed encryption key name, in the format projects/*/locations/*/keyRings/*/cryptoKeys/*.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_config`
- Description: (Optional) Private settings for private instance. Structure is [documented below](#nested_private_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `workforce_identity_federation_config`
- Description: (Optional) Configuration for Workforce Identity Federation to support third party identity provider. If unset, defaults to the Google OIDC IdP. Structure is [documented below](#nested_workforce_identity_federation_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_policy`
- Description: to be abandoned, rather than deleted. Setting `DELETE` deletes the resource and all its contents. Setting `PREVENT` prevents the resource from accidental deletion by erroring out during plan. Default is `DELETE`.  Possible values are: * DELETE * PREVENT * ABANDON <a name="nested_private_config"></a>The `private_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_private`
- Description: (Required) 'Indicate if it's private instance.'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ca_pool`
- Description: (Required) CA pool resource, resource must in the format of `projects/{project}/locations/{location}/caPools/{ca_pool}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_service_attachment`
- Description: (Output) Service Attachment for HTTP, resource is in the format of `projects/{project}/regions/{region}/serviceAttachments/{service_attachment}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssh_service_attachment`
- Description: (Output) Service Attachment for SSH, resource is in the format of `projects/{project}/regions/{region}/serviceAttachments/{service_attachment}`. <a name="nested_workforce_identity_federation_config"></a>The `workforce_identity_federation_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Required) 'Whether Workforce Identity Federation is enabled.'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
