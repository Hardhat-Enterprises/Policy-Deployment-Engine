## 🛡️ Policy Deployment Engine: `netapp_kmsconfig`

This section provides a concise policy evaluation for the `netapp_kmsconfig` resource in GCP.

Reference: [Terraform Registry – netapp_kmsconfig](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/netapp_kmsconfig)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `crypto_key_name` | Resource name of the KMS key to use. Only regional keys are supported. Format: `projects/{{project}}/locations/{{location}}/keyRings/{{key_ring}}/cryptoKeys/{{key}}`. | true | None | None |
| `location` | Name of the policy location. CMEK policies apply to the whole region. | true | None | None |
| `name` | Name of the CMEK policy. | true | None | None |
| `description` | Description for the CMEK policy. | false | None | None |
| `labels` | Labels as key value pairs. Example: `{ "owner": "Bob", "department": "finance", "purpose": "testing" }`. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
