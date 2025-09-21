## 🛡️ Policy Deployment Engine: `apihub_api_hub_instance`

This section provides a concise policy evaluation for the `apihub_api_hub_instance` resource in GCP.

Reference: [Terraform Registry – apihub_api_hub_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apihub_api_hub_instance)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `config` | Available configurations to provision an ApiHub Instance. Structure is [documented below](#nested_config). | true | false | Config block is required but security impact depends on its nested arguments. | None | None |
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | true | Location dictates data residency and compliance. Must align with approved regional policy (e.g. AU only). | ['australia-southeast1', 'australia-southeast2'] | ['us-central1', 'europe-west3'] |
| `description` | Optional. Description of the ApiHub instance. | false | false | Description is informational. Avoid sensitive information in free text fields. | None | None |
| `labels` | Optional. Instance labels to represent user-provided metadata. Refer to cloud documentation on labels for more details. https://cloud.google.com/compute/docs/labeling-resources **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Labels are metadata only and do not affect access control or encryption. Should not contain secrets. | None | None |
| `api_hub_instance_id` | Optional. Identifier to assign to the Api Hub instance. Must be unique within scope of the parent resource. If the field is not provided, system generated id will be used. This value should be 4-40 characters, and valid characters are `/a-z[0-9]-_/`. | false | false | Identifier controls naming only. Security risk is minimal provided no sensitive data is embedded in the ID. | ['c', 'c1', 'c2'] | ['anything else'] |
| `project` | If it is not provided, the provider project is used. | true | false | Required for terraform files to operate correctly | ['PDE'] | ['anything else'] |

### config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `encryption_type` | Optional. Encryption type for the region. If the encryption type is CMEK, the cmek_key_name must be provided. If no encryption type is provided, GMEK will be used. Possible values: ENCRYPTION_TYPE_UNSPECIFIED GMEK CMEK | false | true | Encryption type directly impacts data confidentiality. CMEK should be enforced to ensure org-controlled keys are used. | ['CMEK'] | ['GMEK', 'ENCRYPTION_TYPE_UNSPECIFIED'] |
| `cmek_key_name` | Optional. The Customer Managed Encryption Key (CMEK) used for data encryption. The CMEK name should follow the format of `projects/([^/]+)/locations/([^/]+)/keyRings/([^/]+)/cryptoKeys/([^/]+)`, where the location must match the instance location. If the CMEK is not provided, a GMEK will be created for the instance. | false | true | Key selection is critical for data protection. Only org-approved CMEK keys should be used; mismatched or default GMEK reduces control over encryption. | ['projects/PDE/locations/us-central1/keyRings/apihub/cryptoKeys/apihub-key'] | ['projects/test/locations/europe-west1/keyRings/dev/cryptoKeys/default-key'] |
| `disable_search` | Optional. If true, the search will be disabled for the instance. The default value is false. | false | true | Search exposure may inadvertently reveal sensitive data. To reduce risk, disabling search is recommended unless explicitly required. | ['true'] | ['false'] |
| `vertex_location` | Optional. The name of the Vertex AI location where the data store is stored. | false | false | Vertex location is informational for storage and compute; security implications are covered by 'location'. | None | None |
