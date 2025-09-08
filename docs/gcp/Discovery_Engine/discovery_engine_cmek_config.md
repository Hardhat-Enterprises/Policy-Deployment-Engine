## 🛡️ Policy Deployment Engine: `discovery_engine_cmek_config`

This section provides a concise policy evaluation for the `discovery_engine_cmek_config` resource in GCP.

Reference: [Terraform Registry – discovery_engine_cmek_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/discovery_engine_cmek_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kms_key` | KMS key resource name which will be used to encrypt resources `projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{keyId}`. | true | None | None |
| `location` | The geographic location where the CMEK config should reside. The value can only be one of "us" and "eu". | true | None | None |
| `cmek_config_id` | The unique id of the cmek config. | false | None | None |
| `set_default` | Set the following CmekConfig as the default to be used for child resources if one is not specified. The default value is true. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### single_region_keys Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kms_key` | Single-regional kms key resource name which will be used to encrypt resources `projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{keyId}`. | true | None | None |
