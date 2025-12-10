## 🛡️ Policy Deployment Engine: `discovery_engine_cmek_config`

This section provides a concise policy evaluation for the `discovery_engine_cmek_config` resource in GCP.

Reference: [Terraform Registry – discovery_engine_cmek_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/discovery_engine_cmek_config)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `kms_key` | KMS key resource name which will be used to encrypt resources `projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{keyId}`. | true | true | Encryption key related | my-crypto-key | nc-crypto-key |
| `location` | The geographic location where the CMEK config should reside. The value can only be one of "us" and "eu". | true | true | Data residency laws exist, eu has strongest avaliable for the service. | eu | us |
| `single_region_keys` | Single-regional CMEKs that are required for some VAIS features. Structure is [documented below](#nested_single_region_keys). | false | true | region keys for encryption | projects/735927692082/locations/eu/keyRings/my-ring/cryptoKeys/my-eu-key |   |
| `cmek_config_id` | The unique id of the cmek config. | false | false | an ID | None | None |
| `set_default` | Set the following CmekConfig as the default to be used for child resources if one is not specified. The default value is true. | false | false | only a concern if you have child resources | None | None |
| `project` | If it is not provided, the provider project is used. | true | false | project ID | None | None |

### single_region_keys Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `kms_key` | Single-regional kms key resource name which will be used to encrypt resources `projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{keyId}`. | true | true | encryption | projects/735927692082/locations/europe-west1/keyRings/my-ring/cryptoKeys/my-eu1-key |   |
