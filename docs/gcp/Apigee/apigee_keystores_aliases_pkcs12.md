## 🛡️ Policy Deployment Engine: `apigee_keystores_aliases_pkcs12`

This section provides a concise policy evaluation for the `apigee_keystores_aliases_pkcs12` resource in GCP.

Reference: [Terraform Registry – apigee_keystores_aliases_pkcs12](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_keystores_aliases_pkcs12)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `org_id` | Organization ID associated with the alias, without organization/ prefix | true | None | None |
| `environment` | Environment associated with the alias | true | None | None |
| `keystore` | Keystore Name | true | None | None |
| `alias` | Alias Name | true | None | None |
| `file` | PKCS12 file content - - - | true | None | None |
| `password` | Password for the PKCS12 file if it's encrypted | false | None | None |
