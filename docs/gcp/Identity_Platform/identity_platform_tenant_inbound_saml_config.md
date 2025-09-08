## 🛡️ Policy Deployment Engine: `identity_platform_tenant_inbound_saml_config`

This section provides a concise policy evaluation for the `identity_platform_tenant_inbound_saml_config` resource in GCP.

Reference: [Terraform Registry – identity_platform_tenant_inbound_saml_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/identity_platform_tenant_inbound_saml_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name of the InboundSamlConfig resource. Must start with 'saml.' and can only have alphanumeric characters, hyphens, underscores or periods. The part after 'saml.' must also start with a lowercase letter, end with an alphanumeric character, and have at least 2 characters. | true | None | None |
| `tenant` | The name of the tenant where this inbound SAML config resource exists | true | None | None |
| `display_name` | Human friendly display name. | true | None | None |
| `enabled` | If this config allows users to sign in with the provider. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### idp_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `idp_entity_id` | Unique identifier for all SAML entities | true | None | None |
| `sso_url` | URL to send Authentication request to. | true | None | None |
| `sign_request` | Indicates if outbounding SAMLRequest should be signed. | false | None | None |
| `idp_certificates` | The IDP's certificate data to verify the signature in the SAMLResponse issued by the IDP. Structure is [documented below](#nested_idp_config_idp_certificates). | true | None | None |

### sp_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `sp_entity_id` | Unique identifier for all SAML entities. | true | None | None |
| `callback_uri` | Callback URI where responses from IDP are handled. Must start with `https://`. | true | None | None |
| `sp_certificates` | (Output) The IDP's certificate data to verify the signature in the SAMLResponse issued by the IDP. Structure is [documented below](#nested_sp_config_sp_certificates). The `sp_certificates` block contains: | none | None | None |
| `x509_certificate` | (Output) The x509 certificate | none | None | None |

### idp_certificates Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `x509_certificate` | The x509 certificate | false | None | None |
