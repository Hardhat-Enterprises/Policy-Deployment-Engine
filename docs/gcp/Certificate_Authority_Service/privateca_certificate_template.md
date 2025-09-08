## 🛡️ Policy Deployment Engine: `privateca_certificate_template`

This section provides a concise policy evaluation for the `privateca_certificate_template` resource in GCP.

Reference: [Terraform Registry – privateca_certificate_template](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/privateca_certificate_template)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The resource name for this CertificateTemplate in the format `projects/*/locations/*/certificateTemplates/*`. | true | None | None |
| `location` | The location for the resource | true | None | None |
| `maximum_lifetime` | Optional. The maximum lifetime allowed for all issued certificates that use this template. If the issuing CaPool's IssuancePolicy specifies a maximum lifetime the minimum of the two durations will be the maximum lifetime for issued. Note that if the issuing CertificateAuthority expires before a Certificate's requested maximum_lifetime, the effective lifetime will be explicitly truncated to match it. | false | None | None |
| `description` | Optional. A human-readable description of scenarios this template is intended for. | false | None | None |
| `labels` | Optional. Labels with user-defined metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### predefined_values Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key_usage` | Optional. Indicates the intended use for keys that correspond to a certificate. Structure is [documented below](#nested_predefined_values_key_usage). | false | None | None |
| `ca_options` | Optional. Describes options in this X509Parameters that are relevant in a CA certificate. Structure is [documented below](#nested_predefined_values_ca_options). | false | None | None |
| `policy_ids` | Optional. Describes the X.509 certificate policy object identifiers, per https://tools.ietf.org/html/rfc5280#section-4.2.1.4. Structure is [documented below](#nested_predefined_values_policy_ids). | false | None | None |
| `aia_ocsp_servers` | Optional. Describes Online Certificate Status Protocol (OCSP) endpoint addresses that appear in the "Authority Information Access" extension in the certificate. | false | None | None |
| `additional_extensions` | Optional. Describes custom X.509 extensions. Structure is [documented below](#nested_predefined_values_additional_extensions). | false | None | None |
| `name_constraints` | Describes the X.509 name constraints extension. Structure is [documented below](#nested_predefined_values_name_constraints). | false | None | None |

### identity_constraints Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cel_expression` | Optional. A CEL expression that may be used to validate the resolved X.509 Subject and/or Subject Alternative Name before a certificate is signed. To see the full allowed syntax and some examples, see https://cloud.google.com/certificate-authority-service/docs/using-cel Structure is [documented below](#nested_identity_constraints_cel_expression). | false | None | None |
| `allow_subject_passthrough` | Required. If this is true, the Subject field may be copied from a certificate request into the signed certificate. Otherwise, the requested Subject will be discarded. | true | None | None |
| `allow_subject_alt_names_passthrough` | Required. If this is true, the SubjectAltNames extension may be copied from a certificate request into the signed certificate. Otherwise, the requested SubjectAltNames will be discarded. | true | None | None |

### passthrough_extensions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `known_extensions` | Optional. A set of named X.509 extensions. Will be combined with additional_extensions to determine the full set of X.509 extensions. | false | None | None |
| `additional_extensions` | Optional. A set of ObjectIds identifying custom X.509 extensions. Will be combined with known_extensions to determine the full set of X.509 extensions. Structure is [documented below](#nested_passthrough_extensions_additional_extensions). | false | None | None |

### key_usage Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `base_key_usage` | Describes high-level ways in which a key may be used. Structure is [documented below](#nested_predefined_values_key_usage_base_key_usage). | false | None | None |
| `extended_key_usage` | Detailed scenarios in which a key may be used. Structure is [documented below](#nested_predefined_values_key_usage_extended_key_usage). | false | None | None |
| `unknown_extended_key_usages` | Used to describe extended key usages that are not listed in the KeyUsage.ExtendedKeyUsageOptions message. Structure is [documented below](#nested_predefined_values_key_usage_unknown_extended_key_usages). | false | None | None |

### base_key_usage Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `digital_signature` | The key may be used for digital signatures. | false | None | None |
| `content_commitment` | The key may be used for cryptographic commitments. Note that this may also be referred to as "non-repudiation". | false | None | None |
| `key_encipherment` | The key may be used to encipher other keys. | false | None | None |
| `data_encipherment` | The key may be used to encipher data. | false | None | None |
| `key_agreement` | The key may be used in a key agreement protocol. | false | None | None |
| `cert_sign` | The key may be used to sign certificates. | false | None | None |
| `crl_sign` | The key may be used sign certificate revocation lists. | false | None | None |
| `encipher_only` | The key may be used to encipher only. | false | None | None |
| `decipher_only` | The key may be used to decipher only. | false | None | None |

### extended_key_usage Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `server_auth` | Corresponds to OID 1.3.6.1.5.5.7.3.1. Officially described as "TLS WWW server authentication", though regularly used for non-WWW TLS. | false | None | None |
| `client_auth` | Corresponds to OID 1.3.6.1.5.5.7.3.2. Officially described as "TLS WWW client authentication", though regularly used for non-WWW TLS. | false | None | None |
| `code_signing` | Corresponds to OID 1.3.6.1.5.5.7.3.3. Officially described as "Signing of downloadable executable code client authentication". | false | None | None |
| `email_protection` | Corresponds to OID 1.3.6.1.5.5.7.3.4. Officially described as "Email protection". | false | None | None |
| `time_stamping` | Corresponds to OID 1.3.6.1.5.5.7.3.8. Officially described as "Binding the hash of an object to a time". | false | None | None |
| `ocsp_signing` | Corresponds to OID 1.3.6.1.5.5.7.3.9. Officially described as "Signing OCSP responses". | false | None | None |

### unknown_extended_key_usages Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `object_id_path` | Required. The parts of an OID path. The most significant parts of the path come first. | true | None | None |

### ca_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `is_ca` | Optional. Refers to the "CA" X.509 extension, which is a boolean value. When this value is true, the "CA" in Basic Constraints extension will be set to true. | false | None | None |
| `null_ca` | Optional. When true, the "CA" in Basic Constraints extension will be set to null and omitted from the CA certificate. If both `is_ca` and `null_ca` are unset, the "CA" in Basic Constraints extension will be set to false. Note that the behavior when `is_ca = false` for this resource is different from the behavior in the Certificate Authority, Certificate and CaPool resources. | false | None | None |
| `max_issuer_path_length` | Optional. Refers to the "path length constraint" in Basic Constraints extension. For a CA certificate, this value describes the depth of subordinate CA certificates that are allowed. If this value is less than 0, the request will fail. | false | None | None |
| `zero_max_issuer_path_length` | Optional. When true, the "path length constraint" in Basic Constraints extension will be set to 0. if both `max_issuer_path_length` and `zero_max_issuer_path_length` are unset, the max path length will be omitted from the CA certificate. | false | None | None |

### policy_ids Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `object_id_path` | Required. The parts of an OID path. The most significant parts of the path come first. | true | None | None |

### additional_extensions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `object_id` | Required. The OID for this X.509 extension. Structure is [documented below](#nested_predefined_values_additional_extensions_additional_extensions_object_id). | true | None | None |
| `critical` | Optional. Indicates whether or not this extension is critical (i.e., if the client does not know how to handle this extension, the client should consider this to be an error). | false | None | None |
| `value` | Required. The value of this X.509 extension. | true | None | None |
| `object_id_path` | Required. The parts of an OID path. The most significant parts of the path come first. | true | None | None |

### object_id Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `object_id_path` | Required. The parts of an OID path. The most significant parts of the path come first. | true | None | None |

### name_constraints Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `critical` | Indicates whether or not the name constraints are marked critical. | true | None | None |
| `permitted_dns_names` | Contains permitted DNS names. Any DNS name that can be constructed by simply adding zero or more labels to the left-hand side of the name satisfies the name constraint. For example, `example.com`, `www.example.com`, `www.sub.example.com` would satisfy `example.com` while `example1.com` does not. | false | None | None |
| `excluded_dns_names` | Contains excluded DNS names. Any DNS name that can be constructed by simply adding zero or more labels to the left-hand side of the name satisfies the name constraint. For example, `example.com`, `www.example.com`, `www.sub.example.com` would satisfy `example.com` while `example1.com` does not. | false | None | None |
| `permitted_ip_ranges` | Contains the permitted IP ranges. For IPv4 addresses, the ranges are expressed using CIDR notation as specified in RFC 4632. For IPv6 addresses, the ranges are expressed in similar encoding as IPv4 addresses. | false | None | None |
| `excluded_ip_ranges` | Contains the excluded IP ranges. For IPv4 addresses, the ranges are expressed using CIDR notation as specified in RFC 4632. For IPv6 addresses, the ranges are expressed in similar encoding as IPv4 addresses. | false | None | None |
| `permitted_email_addresses` | Contains the permitted email addresses. The value can be a particular email address, a hostname to indicate all email addresses on that host or a domain with a leading period (e.g. `.example.com`) to indicate all email addresses in that domain. | false | None | None |
| `excluded_email_addresses` | Contains the excluded email addresses. The value can be a particular email address, a hostname to indicate all email addresses on that host or a domain with a leading period (e.g. `.example.com`) to indicate all email addresses in that domain. | false | None | None |
| `permitted_uris` | Contains the permitted URIs that apply to the host part of the name. The value can be a hostname or a domain with a leading period (like `.example.com`) | false | None | None |
| `excluded_uris` | Contains the excluded URIs that apply to the host part of the name. The value can be a hostname or a domain with a leading period (like `.example.com`) | false | None | None |

### cel_expression Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `expression` | Textual representation of an expression in Common Expression Language syntax. | false | None | None |
| `title` | Optional. Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression. | false | None | None |
| `description` | Optional. Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI. | false | None | None |
| `location` | Optional. String indicating the location of the expression for error reporting, e.g. a file name and a position in the file. | false | None | None |
