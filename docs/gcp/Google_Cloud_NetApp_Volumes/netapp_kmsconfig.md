## 🛡️ Policy Deployment Engine: `netapp_kmsconfig`

This section provides a concise policy evaluation for the `netapp_kmsconfig` resource in GCP.

Reference: [Terraform Registry – netapp_kmsconfig](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/netapp_kmsconfig)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `crypto_key_name` | Resource name of the regional CMEK key. | true | true | Encrypts data with an approved customer-managed key. | projects/deakin-lab-123/locations/australia-southeast2/keyRings/netapp-kr/cryptoKeys/netapp-cmek | projects/other-proj/locations/us-central1/keyRings/kr/cryptoKeys/key |
| `location` | Region to which the CMEK policy applies. | true | true | Ensures CMEK is enforced in approved regions. | australia-southeast2 | us-central1 |
| `name` | Name of the CMEK policy. | true | false | None | None | None |
| `description` | Description for the CMEK policy. | false | false | None | None | None |
| `labels` | Labels as key value pairs. Example: `{ "owner": "Bob", "department": "finance", "purpose": "testing" }`. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
