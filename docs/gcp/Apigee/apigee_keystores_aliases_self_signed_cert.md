## 🛡️ Policy Deployment Engine: `apigee_keystores_aliases_self_signed_cert`

This section provides a concise policy evaluation for the `apigee_keystores_aliases_self_signed_cert` resource in GCP.

Reference: [Terraform Registry – apigee_keystores_aliases_self_signed_cert](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_keystores_aliases_self_signed_cert)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `org_id` | The Apigee Organization name associated with the Apigee environment | true | None | None |
| `environment` | The Apigee environment name | true | None | None |
| `keystore` | The Apigee keystore name associated in an Apigee environment | true | None | None |
| `alias` | Alias for the key/certificate pair. Values must match the regular expression [\w\s-.]{1,255}. This must be provided for all formats except selfsignedcert; self-signed certs may specify the alias in either this parameter or the JSON body. | true | None | None |
| `sig_alg` | Signature algorithm to generate private key. Valid values are SHA512withRSA, SHA384withRSA, and SHA256withRSA | true | None | None |
| `key_size` | Key size. Default and maximum value is 2048 bits. | false | None | None |
| `cert_validity_in_days` | Validity duration of certificate, in days. Accepts positive non-zero value. Defaults to 365. | false | None | None |

### subject Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `country_code` | Two-letter country code. Example, IN for India, US for United States of America. | false | None | None |
| `state` | State or district name. Maximum length is 128 characters. | false | None | None |
| `locality` | City or town name. Maximum length is 128 characters. | false | None | None |
| `org` | Organization name. Maximum length is 64 characters. | false | None | None |
| `org_unit` | Organization team name. Maximum length is 64 characters. | false | None | None |
| `common_name` | Common name of the organization. Maximum length is 64 characters. | false | None | None |
| `email` | Email address. Max 255 characters. | false | None | None |

### subject_alternative_dns_names Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `subject_alternative_name` | Subject Alternative Name | false | None | None |
