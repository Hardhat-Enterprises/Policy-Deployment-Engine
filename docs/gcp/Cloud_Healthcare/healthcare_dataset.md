## 🛡️ Policy Deployment Engine: `healthcare_dataset`

This section provides a concise policy evaluation for the `healthcare_dataset` resource in GCP.

Reference: [Terraform Registry – healthcare_dataset](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/healthcare_dataset)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The resource name for the Dataset. | true | None | None |
| `location` | The location for the Dataset. | true | None | None |
| `time_zone` | The default timezone used by this dataset. Must be a either a valid IANA time zone name such as "America/New_York" or empty, which defaults to UTC. This is used for parsing times in resources (e.g., HL7 messages) where no explicit timezone is specified. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### encryption_spec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kms_key_name` | KMS encryption key that is used to secure this dataset and its sub-resources. The key used for encryption and the dataset must be in the same location. If empty, the default Google encryption key will be used to secure this dataset. The format is projects/{projectId}/locations/{locationId}/keyRings/{keyRingId}/cryptoKeys/{keyId}. | false | None | None |
