## 🛡️ Policy Deployment Engine: `privateca_certificate_authority`

This section provides a concise policy evaluation for the `privateca_certificate_authority` resource in GCP.

Reference: [Terraform Registry – privateca_certificate_authority](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/privateca_certificate_authority)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | Location of the CertificateAuthority. A full list of valid locations can be found by running `gcloud privateca locations list`. | true | None | None |
| `certificate_authority_id` | The user provided Resource ID for this Certificate Authority. | true | None | None |
| `pool` | The name of the CaPool this Certificate Authority belongs to. | true | None | None |
| `pem_ca_certificate` | The signed CA certificate issued from the subordinated CA's CSR. This is needed when activating the subordiante CA with a third party issuer. | false | None | None |
| `ignore_active_certificates_on_deletion` | This field allows the CA to be deleted even if the CA has active certs. Active certs include both unrevoked and unexpired certs. Use with care. Defaults to `false`. | false | None | None |
| `skip_grace_period` | If this flag is set, the Certificate Authority will be deleted as soon as possible without a 30-day grace period where undeletion would have been allowed. If you proceed, there will be no way to recover this CA. Use with care. Defaults to `false`. | false | None | None |
| `type` | The Type of this CertificateAuthority. ~> **Note:** For `SUBORDINATE` Certificate Authorities, they need to be activated before they can issue certificates. Default value is `SELF_SIGNED`. Possible values are: `SELF_SIGNED`, `SUBORDINATE`. | false | None | None |
| `lifetime` | The desired lifetime of the CA certificate. Used to create the "notBeforeTime" and "notAfterTime" fields inside an X.509 certificate. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". | false | None | None |
| `gcs_bucket` | The name of a Cloud Storage bucket where this CertificateAuthority will publish content, such as the CA certificate and CRLs. This must be a bucket name, without any prefixes (such as `gs://`) or suffixes (such as `.googleapis.com`). For example, to use a bucket named my-bucket, you would simply specify `my-bucket`. If not specified, a managed bucket will be created. | false | None | None |
| `labels` | Labels with user-defined metadata. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `deletion_protection` | When the field is set to true or unset in Terraform state, a `terraform apply` or `terraform destroy` that would delete the CertificateAuthority will fail. When the field is set to false, deleting the CertificateAuthority is allowed. | none | None | None |
| `desired_state` | Possible values: ENABLED, DISABLED, STAGED. | none | None | None |

### config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `subject_key_id` | When specified this provides a custom SKI to be used in the certificate. This should only be used to maintain a SKI of an existing CA originally created outside CA service, which was not generated using method (1) described in RFC 5280 section 4.2.1.2.. Structure is [documented below](#nested_config_subject_key_id). | false | None | None |
| `x509_config` | Describes how some of the technical X.509 fields in a certificate should be populated. Structure is [documented below](#nested_config_x509_config). | true | None | None |
| `subject_config` | Specifies some of the values in a certificate that are related to the subject. Structure is [documented below](#nested_config_subject_config). | true | None | None |

### key_spec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cloud_kms_key_version` | The resource name for an existing Cloud KMS CryptoKeyVersion in the format `projects/*/locations/*/keyRings/*/cryptoKeys/*/cryptoKeyVersions/*`. | false | None | None |
| `algorithm` | The algorithm to use for creating a managed Cloud KMS key for a for a simplified experience. All managed keys will be have their ProtectionLevel as HSM. Possible values are: `SIGN_HASH_ALGORITHM_UNSPECIFIED`, `RSA_PSS_2048_SHA256`, `RSA_PSS_3072_SHA256`, `RSA_PSS_4096_SHA256`, `RSA_PKCS1_2048_SHA256`, `RSA_PKCS1_3072_SHA256`, `RSA_PKCS1_4096_SHA256`, `EC_P256_SHA256`, `EC_P384_SHA384`. | false | None | None |

### subordinate_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `certificate_authority` | This can refer to a CertificateAuthority that was used to create a subordinate CertificateAuthority. This field is used for information and usability purposes only. The resource name is in the format `projects/*/locations/*/caPools/*/certificateAuthorities/*`. | false | None | None |
| `pem_issuer_chain` | Contains the PEM certificate chain for the issuers of this CertificateAuthority, but not pem certificate for this CA itself. Structure is [documented below](#nested_subordinate_config_pem_issuer_chain). | false | None | None |

### user_defined_access_urls Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `aia_issuing_certificate_urls` | A list of URLs where this CertificateAuthority's CA certificate is published that is specified by users. | false | None | None |
| `crl_access_urls` | A list of URLs where this CertificateAuthority's CRLs are published that is specified by users. | false | None | None |

### subject_key_id Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key_id` | The value of the KeyId in lowercase hexadecimal. | false | None | None |

### x509_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `additional_extensions` | Specifies an X.509 extension, which may be used in different parts of X.509 objects like certificates, CSRs, and CRLs. Structure is [documented below](#nested_config_x509_config_additional_extensions). | false | None | None |
| `policy_ids` | Describes the X.509 certificate policy object identifiers, per https://tools.ietf.org/html/rfc5280#section-4.2.1.4. Structure is [documented below](#nested_config_x509_config_policy_ids). | false | None | None |
| `aia_ocsp_servers` | Describes Online Certificate Status Protocol (OCSP) endpoint addresses that appear in the "Authority Information Access" extension in the certificate. | false | None | None |
| `ca_options` | Describes values that are relevant in a CA certificate. Structure is [documented below](#nested_config_x509_config_ca_options). | true | None | None |
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
| `is_ca` | When true, the "CA" in Basic Constraints extension will be set to true. | true | None | None |
| `non_ca` | When true, the "CA" in Basic Constraints extension will be set to false. If both `is_ca` and `non_ca` are unset, the extension will be omitted from the CA certificate. | false | None | None |
| `max_issuer_path_length` | Refers to the "path length constraint" in Basic Constraints extension. For a CA certificate, this value describes the depth of subordinate CA certificates that are allowed. If this value is less than 0, the request will fail. Setting the value to 0 requires setting `zero_max_issuer_path_length = true`. | false | None | None |
| `zero_max_issuer_path_length` | When true, the "path length constraint" in Basic Constraints extension will be set to 0. If both `max_issuer_path_length` and `zero_max_issuer_path_length` are unset, the max path length will be omitted from the CA certificate. | false | None | None |

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
| `organization` | The organization of the subject. | false | None | None |
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

### pem_issuer_chain Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `pem_certificates` | Expected to be in leaf-to-root order according to RFC 5246. | false | None | None |
