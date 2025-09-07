## 🛡️ Policy Deployment Engine: `kms_autokey_config`

This section provides a concise policy evaluation for the `kms_autokey_config` resource in GCP.

Reference: [Terraform Registry – kms_autokey_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_autokey_config)

---

## 1. Argument Reference

### `folder`
- Description: (Required) The folder for which to retrieve config.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_project`
- Description: (Optional) The target key project for a given folder where KMS Autokey will provision a CryptoKey for any new KeyHandle the Developer creates. Should have the form `projects/<project_id_or_number>`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
