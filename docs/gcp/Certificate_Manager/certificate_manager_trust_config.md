## 🛡️ Policy Deployment Engine: `certificate_manager_trust_config`

This section provides a concise policy evaluation for the `certificate_manager_trust_config` resource in GCP.

Reference: [Terraform Registry – certificate_manager_trust_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/certificate_manager_trust_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | A user-defined name of the trust config. Trust config names must be unique globally. | true | None | None |
| `location` | The trust config location. | true | None | None |
| `labels` | Set of label tags associated with the trust config. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `description` | One or more paragraphs of text description of a trust config. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### trust_stores Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `trust_anchors` | List of Trust Anchors to be used while performing validation against a given TrustStore. Structure is [documented below](#nested_trust_stores_trust_stores_trust_anchors). | false | None | None |
| `intermediate_cas` | Set of intermediate CA certificates used for the path building phase of chain validation. The field is currently not supported if trust config is used for the workload certificate feature. Structure is [documented below](#nested_trust_stores_trust_stores_intermediate_cas). | false | None | None |

### allowlisted_certificates Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `pem_certificate` | PEM certificate that is allowlisted. The certificate can be up to 5k bytes, and must be a parseable X.509 certificate. | true | None | None |

### trust_anchors Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `pem_certificate` | PEM root certificate of the PKI used for validation. Each certificate provided in PEM format may occupy up to 5kB. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |

### intermediate_cas Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `pem_certificate` | PEM intermediate certificate used for building up paths for validation. Each certificate provided in PEM format may occupy up to 5kB. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
