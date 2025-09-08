## 🛡️ Policy Deployment Engine: `parameter_manager_regional_parameter`

This section provides a concise policy evaluation for the `parameter_manager_regional_parameter` resource in GCP.

Reference: [Terraform Registry – parameter_manager_regional_parameter](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/parameter_manager_regional_parameter)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location of the regional parameter. eg us-central1 | true | None | None |
| `parameter_id` | This must be unique within the project. | true | None | None |
| `labels` | The labels assigned to this regional Parameter. Label keys must be between 1 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes, and must conform to the following PCRE regular expression: [\p{Ll}\p{Lo}][\p{Ll}\p{Lo}\p{N}_-]{0,62} Label values must be between 0 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes, and must conform to the following PCRE regular expression: [\p{Ll}\p{Lo}\p{N}_-]{0,63} No more than 64 labels can be assigned to a given resource. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `format` | The format type of the regional parameter. Default value is `UNFORMATTED`. Possible values are: `UNFORMATTED`, `YAML`, `JSON`. | false | None | None |
| `kms_key` | The resource name of the Cloud KMS CryptoKey used to encrypt regional parameter version payload. Format `projects/{{project}}/locations/{{location}}/keyRings/{{key_ring}}/cryptoKeys/{{crypto_key}}` | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
