## 🛡️ Policy Deployment Engine: `privateca_certificate`

This section provides a concise policy evaluation for the `privateca_certificate` resource in GCP.

Reference: [Terraform Registry – privateca_certificate](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/privateca_certificate)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `pool` | The name of the CaPool this Certificate belongs to. | true | None | None |
| `name` | The name for this Certificate. | true | None | None |
| `location` | Location of the Certificate. A full list of valid locations can be found by running `gcloud privateca locations list`. | true | None | None |
| `lifetime` | The desired lifetime of the CA certificate. Used to create the "notBeforeTime" and "notAfterTime" fields inside an X.509 certificate. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". | false | None | None |
| `certificate_template` | The resource name for a CertificateTemplate used to issue this certificate, in the format `projects/*/locations/*/certificateTemplates/*`. If this is specified, the caller must have the necessary permission to use this template. If this is omitted, no template will be used. This template must be in the same location as the Certificate. | false | None | None |
| `labels` | Labels with user-defined metadata to apply to this resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `pem_csr` | Immutable. A pem-encoded X.509 certificate signing request (CSR). | false | None | None |
| `certificate_authority` | The Certificate Authority ID that should issue the certificate. For example, to issue a Certificate from a Certificate Authority with resource name `projects/my-project/locations/us-central1/caPools/my-pool/certificateAuthorities/my-ca`, argument `pool` should be set to `projects/my-project/locations/us-central1/caPools/my-pool`, argument `certificate_authority` should be set to `my-ca`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `x509_config` | Describes how some of the technical X.509 fields in a certificate should be populated. Structure is [documented below](#nested_config_x509_config). | true | None | None |
| `subject_config` | Specifies some of the values in a certificate that are related to the subject. Structure is [documented below](#nested_config_subject_config). | true | None | None |
| `subject_key_id` | When specified this provides a custom SKI to be used in the certificate. This should only be used to maintain a SKI of an existing CA originally created outside CA service, which was not generated using method (1) described in RFC 5280 section 4.2.1.2.. Structure is [documented below](#nested_config_subject_key_id). | false | None | None |
| `public_key` | A PublicKey describes a public key. Structure is [documented below](#nested_config_public_key). | true | None | None |

### x509_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `additional_extensions` | Specifies an X.509 extension, which may be used in different parts of X.509 objects like certificates, CSRs, and CRLs. Structure is [documented below](#nested_config_x509_config_additional_extensions). | false | None | None |
| `policy_ids` | Describes the X.509 certificate policy object identifiers, per https://tools.ietf.org/html/rfc5280#section-4.2.1.4. Structure is [documented below](#nested_config_x509_config_policy_ids). | false | None | None |
| `aia_ocsp_servers` | Describes Online Certificate Status Protocol (OCSP) endpoint addresses that appear in the "Authority Information Access" extension in the certificate. | false | None | None |
| `ca_options` | Describes values that are relevant in a CA certificate. Structure is [documented below](#nested_config_x509_config_ca_options). | false | None | None |
| `key_usage` | Indicates the intended use for keys that correspond to a certificate. Structure is [documented below](#nested_config_x509_config_key_usage). | true | None | None |
| `name_constraints` | Describes the X.509 name constraints extension. Structure is [documented below](#nested_config_x509_config_name_constraints). | false | None | None |

### additional_extensions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `critical` | Indicates whether or not this extension is critical (i.e., if the client does not know how to handle this extension, the client should consider this to be an error). | true | None | None |
| `value` | The value of this X.509 extension. A base64-encoded string. | true | None | None |
| `object_id` | Describes values that are relevant in a CA certificate. Structure is [documented below](#nested_config_x509_config_additional_extensions_additional_extensions_object_id). | true | None | None |

### object_id Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `object_id_path` | An ObjectId specifies an object identifier (OID). These provide context and describe types in ASN.1 messages. | true | None | None |

### policy_ids Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `object_id_path` | An ObjectId specifies an object identifier (OID). These provide context and describe types in ASN.1 messages. | true | None | None |

### ca_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `is_ca` | When true, the "CA" in Basic Constraints extension will be set to true. | false | None | None |
| `non_ca` | When true, the "CA" in Basic Constraints extension will be set to false. If both `is_ca` and `non_ca` are unset, the extension will be omitted from the CA certificate. | false | None | None |
| `max_issuer_path_length` | Refers to the "path length constraint" in Basic Constraints extension. For a CA certificate, this value describes the depth of subordinate CA certificates that are allowed. If this value is less than 0, the request will fail. | false | None | None |
| `zero_max_issuer_path_length` | When true, the "path length constraint" in Basic Constraints extension will be set to 0. if both `max_issuer_path_length` and `zero_max_issuer_path_length` are unset, the max path length will be omitted from the CA certificate. | false | None | None |

### key_usage Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `base_key_usage` | Describes high-level ways in which a key may be used. Structure is [documented below](#nested_config_x509_config_key_usage_base_key_usage). | true | None | None |
| `extended_key_usage` | Describes high-level ways in which a key may be used. Structure is [documented below](#nested_config_x509_config_key_usage_extended_key_usage). | true | None | None |
| `unknown_extended_key_usages` | An ObjectId specifies an object identifier (OID). These provide context and describe types in ASN.1 messages. Structure is [documented below](#nested_config_x509_config_key_usage_unknown_extended_key_usages). | false | None | None |

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
| `object_id_path` | An ObjectId specifies an object identifier (OID). These provide context and describe types in ASN.1 messages. | true | None | None |

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

### subject_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `subject` | Contains distinguished name fields such as the location and organization. Structure is [documented below](#nested_config_subject_config_subject). | true | None | None |
| `subject_alt_name` | The subject alternative name fields. Structure is [documented below](#nested_config_subject_config_subject_alt_name). | false | None | None |

### subject Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `country_code` | The country code of the subject. | false | None | None |
| `organization` | The organization of the subject. | true | None | None |
| `organizational_unit` | The organizational unit of the subject. | false | None | None |
| `locality` | The locality or city of the subject. | false | None | None |
| `province` | The province, territory, or regional state of the subject. | false | None | None |
| `street_address` | The street address of the subject. | false | None | None |
| `postal_code` | The postal code of the subject. | false | None | None |
| `common_name` | The common name of the distinguished name. | true | None | None |

### subject_alt_name Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `dns_names` | Contains only valid, fully-qualified host names. | false | None | None |
| `uris` | Contains only valid RFC 3986 URIs. | false | None | None |
| `email_addresses` | Contains only valid RFC 2822 E-mail addresses. | false | None | None |
| `ip_addresses` | Contains only valid 32-bit IPv4 addresses or RFC 4291 IPv6 addresses. | false | None | None |

### subject_key_id Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key_id` | The value of the KeyId in lowercase hexadecimal. | false | None | None |

### public_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key` | Required. A public key. When this is specified in a request, the padding and encoding can be any of the options described by the respective 'KeyType' value. When this is generated by the service, it will always be an RFC 5280 SubjectPublicKeyInfo structure containing an algorithm identifier and a key. A base64-encoded string. | false | None | None |
| `format` | The format of the public key. Currently, only PEM format is supported. Possible values are: `KEY_TYPE_UNSPECIFIED`, `PEM`. | true | None | None |
