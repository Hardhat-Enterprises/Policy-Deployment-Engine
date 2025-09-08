## 🛡️ Policy Deployment Engine: `apigee_keystores_aliases_key_cert_file`

This section provides a concise policy evaluation for the `apigee_keystores_aliases_key_cert_file` resource in GCP.

Reference: [Terraform Registry – apigee_keystores_aliases_key_cert_file](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_keystores_aliases_key_cert_file)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `org_id` | Organization ID associated with the alias, without organization/ prefix | true | None | None |
| `environment` | Environment associated with the alias | true | None | None |
| `keystore` | Keystore Name | true | None | None |
| `alias` | Alias Name | true | None | None |
| `cert` | Cert content - - - | true | None | None |
| `key` | Private Key content, omit if uploading to truststore | false | None | None |
| `password` | Password for the Private Key if it's encrypted | false | None | None |
