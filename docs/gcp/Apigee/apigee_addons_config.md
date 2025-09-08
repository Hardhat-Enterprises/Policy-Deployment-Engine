## 🛡️ Policy Deployment Engine: `apigee_addons_config`

This section provides a concise policy evaluation for the `apigee_addons_config` resource in GCP.

Reference: [Terraform Registry – apigee_addons_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_addons_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `org` | Name of the Apigee organization. | true | None | None |

### addons_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `advanced_api_ops_config` | Configuration for the Advanced API Ops add-on. Structure is [documented below](#nested_addons_config_advanced_api_ops_config). | false | None | None |
| `integration_config` | Configuration for the Integration add-on. Structure is [documented below](#nested_addons_config_integration_config). | false | None | None |
| `monetization_config` | Configuration for the Monetization add-on. Structure is [documented below](#nested_addons_config_monetization_config). | false | None | None |
| `api_security_config` | Configuration for the API Security add-on. Structure is [documented below](#nested_addons_config_api_security_config). | false | None | None |
| `connectors_platform_config` | Configuration for the Monetization add-on. Structure is [documented below](#nested_addons_config_connectors_platform_config). | false | None | None |

### advanced_api_ops_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Flag that specifies whether the Advanced API Ops add-on is enabled. | false | None | None |

### integration_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Flag that specifies whether the Integration add-on is enabled. | false | None | None |

### monetization_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Flag that specifies whether the Monetization add-on is enabled. | false | None | None |

### api_security_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Flag that specifies whether the API security add-on is enabled. | false | None | None |
| `expires_at` | (Output) Time at which the API Security add-on expires in in milliseconds since epoch. If unspecified, the add-on will never expire. | none | None | None |

### connectors_platform_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Flag that specifies whether the Connectors Platform add-on is enabled. | false | None | None |
| `expires_at` | (Output) Time at which the Connectors Platform add-on expires in milliseconds since epoch. If unspecified, the add-on will never expire. | none | None | None |
