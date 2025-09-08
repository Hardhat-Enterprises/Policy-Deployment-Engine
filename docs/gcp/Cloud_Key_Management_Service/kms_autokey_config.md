## 🛡️ Policy Deployment Engine: `kms_autokey_config`

This section provides a concise policy evaluation for the `kms_autokey_config` resource in GCP.

Reference: [Terraform Registry – kms_autokey_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_autokey_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `folder` | The folder for which to retrieve config. | true | None | None |
| `key_project` | The target key project for a given folder where KMS Autokey will provision a CryptoKey for any new KeyHandle the Developer creates. Should have the form `projects/<project_id_or_number>`. | false | None | None |
