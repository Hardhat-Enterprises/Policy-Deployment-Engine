## 🛡️ Policy Deployment Engine: `healthcare_dataset`

This section provides a concise policy evaluation for the `healthcare_dataset` resource in GCP.

Reference: [Terraform Registry – healthcare_dataset](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/healthcare_dataset)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The resource name for the Dataset. | true | false | The name is a resource identifier only and does not affect security posture. | None | None |
| `location` | The location for the Dataset. | true | true | Deploying healthcare datasets in unapproved regions may violate data residency and sovereignty requirements for PHI. Organisations must ensure that patient data remains within approved geographic boundaries to comply with HIPAA, GDPR, and regional healthcare regulations. | location = "us-central1" or location = "us-east1" or location = "australia-southeast1" | location set to a non-approved region e.g. "us-west1" |
| `time_zone` | The default timezone used by this dataset. Must be a either a valid IANA time zone name such as "America/New_York" or empty, which defaults to UTC. This is used for parsing times in resources (e.g., HL7 messages) where no explicit timezone is specified. | false | false | The time_zone field affects timestamp parsing in HL7 messages but does not directly affect the security posture of the dataset. | None | None |
| `encryption_spec` | A nested object resource. Structure is [documented below](#nested_encryption_spec). | false | true | Without a customer-managed encryption key (CMEK), the dataset uses Google-managed encryption keys. CMEK gives organisations full control over key lifecycle, rotation, and revocation, which is required for HIPAA compliance and zero-trust security models. | encryption_spec block present with a valid kms_key_name | encryption_spec block not set (null) — uses Google-managed encryption only |
| `project` | If it is not provided, the provider project is used. | false | false | The project field is an optional resource scoping attribute and does not directly affect security posture. | None | None |

### encryption_spec Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `kms_key_name` | KMS encryption key that is used to secure this dataset and its sub-resources. The key used for encryption and the dataset must be in the same location. If empty, the default Google encryption key will be used to secure this dataset. The format is projects/{projectId}/locations/{locationId}/keyRings/{keyRingId}/cryptoKeys/{keyId}. | false | true | Without a KMS key, the dataset relies on Google-managed encryption, preventing organisations from controlling key rotation, revocation, and access. A customer-managed key ensures the organisation retains full ownership of PHI encryption and can immediately revoke access if needed. | kms_key_name = "projects/PROJECT/locations/REGION/keyRings/RING/cryptoKeys/KEY" | kms_key_name not set (null or empty) — falls back to Google-managed encryption |
