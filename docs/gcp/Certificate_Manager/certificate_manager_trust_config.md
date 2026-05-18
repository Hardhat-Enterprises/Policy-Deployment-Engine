## 🛡️ Policy Deployment Engine: `certificate_manager_trust_config`

This section provides a concise policy evaluation for the `certificate_manager_trust_config` resource in GCP.

Reference: [Terraform Registry – certificate_manager_trust_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/certificate_manager_trust_config)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | A user-defined name of the trust config. Trust config names must be unique globally. | true | false | None | None | None |
| `location` | The trust config location. | true | true | The trust config location controls where the trust configuration is created and managed. | Use an approved trust config location. | Using an unapproved trust config location. |
| `labels` | Set of label tags associated with the trust config. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `description` | One or more paragraphs of text description of a trust config. | false | false | None | None | None |
| `trust_stores` | Set of trust stores to perform validation against. This field is supported when TrustConfig is configured with Load Balancers, currently not supported for SPIFFE certificate validation. Structure is [documented below](#nested_trust_stores). | false | false | None | None | None |
| `allowlisted_certificates` | Allowlisted PEM-encoded certificates. A certificate matching an allowlisted certificate is always considered valid as long as the certificate is parseable, proof of private key possession is established, and constraints on the certificate's SAN field are met. Structure is [documented below](#nested_allowlisted_certificates). | false | true | Allowlisted certificates are trust exceptions and should not be configured directly without an approved exception. | Do not define allowlisted certificates in the trust config. | Defining allowlisted certificates directly in the trust config. |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `trust_anchors` |  | false | false | None | None | None |
| `intermediate_cas` |  | false | false | None | None | None |

### trust_stores Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `trust_anchors` | List of Trust Anchors to be used while performing validation against a given TrustStore. Structure is [documented below](#nested_trust_stores_trust_stores_trust_anchors). | false | false | None | None | None |
| `intermediate_cas` | Set of intermediate CA certificates used for the path building phase of chain validation. The field is currently not supported if trust config is used for the workload certificate feature. Structure is [documented below](#nested_trust_stores_trust_stores_intermediate_cas). | false | false | None | None | None |

### allowlisted_certificates Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `pem_certificate` | PEM certificate that is allowlisted. The certificate can be up to 5k bytes, and must be a parseable X.509 certificate. | true | true | An allowlisted PEM certificate can be treated as a trusted exception during certificate validation. | Do not define an allowlisted PEM certificate in Terraform. | Defining an allowlisted PEM certificate directly in Terraform. |

### trust_anchors Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `pem_certificate` | PEM root certificate of the PKI used for validation. Each certificate provided in PEM format may occupy up to 5kB. **Note**: This property is sensitive and will not be displayed in the plan. | false | false | None | None | None |

### intermediate_cas Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `pem_certificate` | PEM intermediate certificate used for building up paths for validation. Each certificate provided in PEM format may occupy up to 5kB. **Note**: This property is sensitive and will not be displayed in the plan. | false | false | None | None | None |
