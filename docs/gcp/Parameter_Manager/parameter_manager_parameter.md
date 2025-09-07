## 🛡️ Policy Deployment Engine: `parameter_manager_parameter`

This section provides a concise policy evaluation for the `parameter_manager_parameter` resource in GCP.

Reference: [Terraform Registry – parameter_manager_parameter](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/parameter_manager_parameter)

---

## 1. Argument Reference

### `parameter_id`
- Description: (Required) This must be unique within the project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The labels assigned to this Parameter. Label keys must be between 1 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes, and must conform to the following PCRE regular expression: [\p{Ll}\p{Lo}][\p{Ll}\p{Lo}\p{N}_-]{0,62} Label values must be between 0 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes, and must conform to the following PCRE regular expression: [\p{Ll}\p{Lo}\p{N}_-]{0,63} No more than 64 labels can be assigned to a given resource. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `format`
- Description: (Optional) The format type of the parameter resource. Default value is `UNFORMATTED`. Possible values are: `UNFORMATTED`, `YAML`, `JSON`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key`
- Description: (Optional) The resource name of the Cloud KMS CryptoKey used to encrypt parameter version payload. Format `projects/{{project}}/locations/global/keyRings/{{key_ring}}/cryptoKeys/{{crypto_key}}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
