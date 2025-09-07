## 🛡️ Policy Deployment Engine: `healthcare_dataset`

This section provides a concise policy evaluation for the `healthcare_dataset` resource in GCP.

Reference: [Terraform Registry – healthcare_dataset](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/healthcare_dataset)

---

## 1. Argument Reference

### `name`
- Description: (Required) The resource name for the Dataset.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the Dataset.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_zone`
- Description: (Optional) The default timezone used by this dataset. Must be a either a valid IANA time zone name such as "America/New_York" or empty, which defaults to UTC. This is used for parsing times in resources (e.g., HL7 messages) where no explicit timezone is specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_spec`
- Description: (Optional) A nested object resource. Structure is [documented below](#nested_encryption_spec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_encryption_spec"></a>The `encryption_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) KMS encryption key that is used to secure this dataset and its sub-resources. The key used for encryption and the dataset must be in the same location. If empty, the default Google encryption key will be used to secure this dataset. The format is projects/{projectId}/locations/{locationId}/keyRings/{keyRingId}/cryptoKeys/{keyId}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
