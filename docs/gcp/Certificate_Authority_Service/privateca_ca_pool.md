## 🛡️ Policy Deployment Engine: `privateca_ca_pool`

This section provides a concise policy evaluation for the `privateca_ca_pool` resource in GCP.

Reference: [Terraform Registry – privateca_ca_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/privateca_ca_pool)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name for this CaPool. | true | false | None | None | None |
| `tier` | The Tier of this CaPool. Possible values are: `ENTERPRISE`, `DEVOPS`. | true | true | CA Pool must use the ENTERPRISE tier to enforce admin approval controls and audit logging for all certificate operations. The DEVOPS tier lacks HSM-backed keys and granular audit logging required by organisational policy. | Set tier to 'ENTERPRISE'. | Set tier to 'DEVOPS'. |
| `location` | Location of the CaPool. A full list of valid locations can be found by running `gcloud privateca locations list`. | true | true | CA Pool must be deployed in an approved geographic region to enforce data residency and organisational compliance. | Set location to 'australia-southeast1' or 'australia-southeast2'. | Any location outside the approved whitelist, e.g. 'us-central1'. |
| `issuance_policy` | The IssuancePolicy to control how Certificates will be issued from this CaPool. Structure is [documented below](#nested_issuance_policy). | false | false | None | None | None |
| `publishing_options` | The PublishingOptions to follow when issuing Certificates from any CertificateAuthority in this CaPool. Structure is [documented below](#nested_publishing_options). | false | false | None | None | None |
| `labels` | Labels with user-defined metadata. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `allowed_key_types` |  | false | false | None | None | None |
| `rsa` |  | false | false | None | None | None |
| `elliptic_curve` |  | false | false | None | None | None |
| `allowed_issuance_modes` |  | false | false | None | None | None |
| `identity_constraints` |  | false | false | None | None | None |
| `cel_expression` |  | false | false | None | None | None |
| `baseline_values` |  | false | false | None | None | None |
| `additional_extensions` |  | false | false | None | None | None |
| `object_id` |  | false | false | None | None | None |
| `policy_ids` |  | false | false | None | None | None |
| `ca_options` |  | false | false | None | None | None |
| `key_usage` |  | false | false | None | None | None |
| `base_key_usage` |  | false | false | None | None | None |
| `extended_key_usage` |  | false | false | None | None | None |
| `unknown_extended_key_usages` |  | false | false | None | None | None |
| `name_constraints` |  | false | false | None | None | None |

### issuance_policy Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `allowed_key_types` | If any AllowedKeyType is specified, then the certificate request's public key must match one of the key types listed here. Otherwise, any key may be used. Structure is [documented below](#nested_issuance_policy_allowed_key_types). | false | true | CA Pool issuance policy must restrict elliptic curve signing algorithms to approved types only to enforce cryptographic compliance. | Set elliptic_curve.signature_algorithm to 'ECDSA_P256' or 'ECDSA_P384'. | Using 'EDDSA_25519' or leaving allowed_key_types unrestricted. |
| `backdate_duration` | The duration to backdate all certificates issued from this CaPool. If not set, the certificates will be issued with a not_before_time of the issuance time (i.e. the current time). If set, the certificates will be issued with a not_before_time of the issuance time minus the backdate_duration. The not_after_time will be adjusted to preserve the requested lifetime. The backdate_duration must be less than or equal to 48 hours. | false | false | None | None | None |
| `maximum_lifetime` | The maximum lifetime allowed for issued Certificates. Note that if the issuing CertificateAuthority expires before a Certificate's requested maximumLifetime, the effective lifetime will be explicitly truncated to match it. | false | true | CA Pool maximum certificate lifetime must not exceed 87600h (10 years / 315360000s) to limit the exposure window if a certificate is compromised. Long-lived certificates increase the risk of undetected key compromise. | Set maximum_lifetime to '315360000s' (87600h) or less. | Set maximum_lifetime to a value exceeding '315360000s', e.g. '315360001s'. |
| `allowed_issuance_modes` | IssuanceModes specifies the allowed ways in which Certificates may be requested from this CaPool. Structure is [documented below](#nested_issuance_policy_allowed_issuance_modes). | false | false | None | None | None |
| `identity_constraints` | Describes constraints on identities that may appear in Certificates issued through this CaPool. If this is omitted, then this CaPool will not add restrictions on a certificate's identity. Structure is [documented below](#nested_issuance_policy_identity_constraints). | false | false | None | None | None |
| `baseline_values` | A set of X.509 values that will be applied to all certificates issued through this CaPool. If a certificate request includes conflicting values for the same properties, they will be overwritten by the values defined here. If a certificate request uses a CertificateTemplate that defines conflicting predefinedValues for the same properties, the certificate issuance request will fail. Structure is [documented below](#nested_issuance_policy_baseline_values). | false | false | None | None | None |

### publishing_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `publish_ca_cert` | When true, publishes each CertificateAuthority's CA certificate and includes its URL in the "Authority Information Access" X.509 extension in all issued Certificates. If this is false, the CA certificate will not be published and the corresponding X.509 extension will not be written in issued certificates. | true | true | CA Pool must publish CA certificates so that clients can establish trust with the CA hierarchy. Without this, relying parties cannot validate the chain of trust for issued certificates. | Set publish_ca_cert to true. | Set publish_ca_cert to false. |
| `publish_crl` | When true, publishes each CertificateAuthority's CRL and includes its URL in the "CRL Distribution Points" X.509 extension in all issued Certificates. If this is false, CRLs will not be published and the corresponding X.509 extension will not be written in issued certificates. CRLs will expire 7 days from their creation. However, we will rebuild daily. CRLs are also rebuilt shortly after a certificate is revoked. | true | true | CA Pool must publish Certificate Revocation Lists so that relying parties can detect and reject revoked certificates. Without CRL publishing, compromised certificates remain trusted. | Set publish_crl to true. | Set publish_crl to false. |
| `encoding_format` | Specifies the encoding format of each CertificateAuthority's CA certificate and CRLs. If this is omitted, CA certificates and CRLs will be published in PEM. Possible values are: `PEM`, `DER`. | false | false | None | None | None |

### allowed_key_types Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `rsa` | Describes an RSA key that may be used in a Certificate issued from a CaPool. Structure is [documented below](#nested_issuance_policy_allowed_key_types_allowed_key_types_rsa). | false | false | None | None | None |
| `elliptic_curve` | Represents an allowed Elliptic Curve key type. Structure is [documented below](#nested_issuance_policy_allowed_key_types_allowed_key_types_elliptic_curve). | false | false | None | None | None |

### rsa Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `min_modulus_size` | The minimum allowed RSA modulus size, in bits. If this is not set, or if set to zero, the service-level min RSA modulus size will continue to apply. | false | false | None | None | None |
| `max_modulus_size` | The maximum allowed RSA modulus size, in bits. If this is not set, or if set to zero, the service will not enforce an explicit upper bound on RSA modulus sizes. | false | false | None | None | None |

### elliptic_curve Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `signature_algorithm` | The algorithm used. Possible values are: `ECDSA_P256`, `ECDSA_P384`, `EDDSA_25519`. | true | true | Elliptic curve signature algorithm must be restricted to OS-approved types to enforce cryptographic compliance across all certificates issued by the pool. | Set signature_algorithm to 'ECDSA_P256' or 'ECDSA_P384'. | Set signature_algorithm to 'EDDSA_25519'. |

### allowed_issuance_modes Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `allow_csr_based_issuance` | When true, allows callers to create Certificates by specifying a CSR. | true | true | CA Pool must allow CSR-based issuance so that certificate requestors retain control of their private keys. Config-based issuance alone requires the CA to generate keys on behalf of requestors, violating the principle that private keys must never leave the requesting system. | Set allow_csr_based_issuance to true. | Set allow_csr_based_issuance to false. |
| `allow_config_based_issuance` | When true, allows callers to create Certificates by specifying a CertificateConfig. | true | false | None | None | None |

### identity_constraints Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `allow_subject_passthrough` | If this is set, the Subject field may be copied from a certificate request into the signed certificate. Otherwise, the requested Subject will be discarded. | true | false | None | None | None |
| `allow_subject_alt_names_passthrough` | If this is set, the SubjectAltNames extension may be copied from a certificate request into the signed certificate. Otherwise, the requested SubjectAltNames will be discarded. | true | false | None | None | None |
| `cel_expression` | A CEL expression that may be used to validate the resolved X.509 Subject and/or Subject Alternative Name before a certificate is signed. To see the full allowed syntax and some examples, see https://cloud.google.com/certificate-authority-service/docs/cel-guide Structure is [documented below](#nested_issuance_policy_identity_constraints_cel_expression). | false | false | None | None | None |

### cel_expression Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | Textual representation of an expression in Common Expression Language syntax. | true | false | None | None | None |
| `title` | Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression. | false | false | None | None | None |
| `description` | Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI. | false | false | None | None | None |
| `location` | String indicating the location of the expression for error reporting, e.g. a file name and a position in the file. | false | false | None | None | None |

### baseline_values Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `additional_extensions` | Specifies an X.509 extension, which may be used in different parts of X.509 objects like certificates, CSRs, and CRLs. Structure is [documented below](#nested_issuance_policy_baseline_values_additional_extensions). | false | false | None | None | None |
| `policy_ids` | Describes the X.509 certificate policy object identifiers, per https://tools.ietf.org/html/rfc5280#section-4.2.1.4. Structure is [documented below](#nested_issuance_policy_baseline_values_policy_ids). | false | false | None | None | None |
| `aia_ocsp_servers` | Describes Online Certificate Status Protocol (OCSP) endpoint addresses that appear in the "Authority Information Access" extension in the certificate. | false | false | None | None | None |
| `ca_options` | Describes values that are relevant in a CA certificate. Structure is [documented below](#nested_issuance_policy_baseline_values_ca_options). | true | false | None | None | None |
| `key_usage` | Indicates the intended use for keys that correspond to a certificate. Structure is [documented below](#nested_issuance_policy_baseline_values_key_usage). | true | false | None | None | None |
| `name_constraints` | Describes the X.509 name constraints extension. Structure is [documented below](#nested_issuance_policy_baseline_values_name_constraints). | false | false | None | None | None |

### additional_extensions Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `critical` | Indicates whether or not this extension is critical (i.e., if the client does not know how to handle this extension, the client should consider this to be an error). | true | false | None | None | None |
| `value` | The value of this X.509 extension. A base64-encoded string. | true | false | None | None | None |
| `object_id` | Describes values that are relevant in a CA certificate. Structure is [documented below](#nested_issuance_policy_baseline_values_additional_extensions_additional_extensions_object_id). | true | false | None | None | None |

### object_id Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `object_id_path` | An ObjectId specifies an object identifier (OID). These provide context and describe types in ASN.1 messages. | true | false | None | None | None |

### policy_ids Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `object_id_path` | An ObjectId specifies an object identifier (OID). These provide context and describe types in ASN.1 messages. | true | false | None | None | None |

### ca_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `is_ca` | When true, the "CA" in Basic Constraints extension will be set to true. | false | false | None | None | None |
| `non_ca` | When true, the "CA" in Basic Constraints extension will be set to false. If both `is_ca` and `non_ca` are unset, the extension will be omitted from the CA certificate. | false | false | None | None | None |
| `max_issuer_path_length` | Refers to the "path length constraint" in Basic Constraints extension. For a CA certificate, this value describes the depth of subordinate CA certificates that are allowed. If this value is less than 0, the request will fail. | false | false | None | None | None |
| `zero_max_issuer_path_length` | When true, the "path length constraint" in Basic Constraints extension will be set to 0. if both `max_issuer_path_length` and `zero_max_issuer_path_length` are unset, the max path length will be omitted from the CA certificate. | false | false | None | None | None |

### key_usage Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `base_key_usage` | Describes high-level ways in which a key may be used. Structure is [documented below](#nested_issuance_policy_baseline_values_key_usage_base_key_usage). | true | false | None | None | None |
| `extended_key_usage` | Describes high-level ways in which a key may be used. Structure is [documented below](#nested_issuance_policy_baseline_values_key_usage_extended_key_usage). | true | false | None | None | None |
| `unknown_extended_key_usages` | An ObjectId specifies an object identifier (OID). These provide context and describe types in ASN.1 messages. Structure is [documented below](#nested_issuance_policy_baseline_values_key_usage_unknown_extended_key_usages). | false | false | None | None | None |

### base_key_usage Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `digital_signature` | The key may be used for digital signatures. | false | false | None | None | None |
| `content_commitment` | The key may be used for cryptographic commitments. Note that this may also be referred to as "non-repudiation". | false | false | None | None | None |
| `key_encipherment` | The key may be used to encipher other keys. | false | false | None | None | None |
| `data_encipherment` | The key may be used to encipher data. | false | false | None | None | None |
| `key_agreement` | The key may be used in a key agreement protocol. | false | false | None | None | None |
| `cert_sign` | The key may be used to sign certificates. | false | false | None | None | None |
| `crl_sign` | The key may be used sign certificate revocation lists. | false | false | None | None | None |
| `encipher_only` | The key may be used to encipher only. | false | false | None | None | None |
| `decipher_only` | The key may be used to decipher only. | false | false | None | None | None |

### extended_key_usage Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `server_auth` | Corresponds to OID 1.3.6.1.5.5.7.3.1. Officially described as "TLS WWW server authentication", though regularly used for non-WWW TLS. | false | false | None | None | None |
| `client_auth` | Corresponds to OID 1.3.6.1.5.5.7.3.2. Officially described as "TLS WWW client authentication", though regularly used for non-WWW TLS. | false | false | None | None | None |
| `code_signing` | Corresponds to OID 1.3.6.1.5.5.7.3.3. Officially described as "Signing of downloadable executable code client authentication". | false | false | None | None | None |
| `email_protection` | Corresponds to OID 1.3.6.1.5.5.7.3.4. Officially described as "Email protection". | false | false | None | None | None |
| `time_stamping` | Corresponds to OID 1.3.6.1.5.5.7.3.8. Officially described as "Binding the hash of an object to a time". | false | false | None | None | None |
| `ocsp_signing` | Corresponds to OID 1.3.6.1.5.5.7.3.9. Officially described as "Signing OCSP responses". | false | false | None | None | None |

### unknown_extended_key_usages Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `object_id_path` | An ObjectId specifies an object identifier (OID). These provide context and describe types in ASN.1 messages. | true | false | None | None | None |

### name_constraints Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `critical` | Indicates whether or not the name constraints are marked critical. | true | false | None | None | None |
| `permitted_dns_names` | Contains permitted DNS names. Any DNS name that can be constructed by simply adding zero or more labels to the left-hand side of the name satisfies the name constraint. For example, `example.com`, `www.example.com`, `www.sub.example.com` would satisfy `example.com` while `example1.com` does not. | false | false | None | None | None |
| `excluded_dns_names` | Contains excluded DNS names. Any DNS name that can be constructed by simply adding zero or more labels to the left-hand side of the name satisfies the name constraint. For example, `example.com`, `www.example.com`, `www.sub.example.com` would satisfy `example.com` while `example1.com` does not. | false | false | None | None | None |
| `permitted_ip_ranges` | Contains the permitted IP ranges. For IPv4 addresses, the ranges are expressed using CIDR notation as specified in RFC 4632. For IPv6 addresses, the ranges are expressed in similar encoding as IPv4 addresses. | false | false | None | None | None |
| `excluded_ip_ranges` | Contains the excluded IP ranges. For IPv4 addresses, the ranges are expressed using CIDR notation as specified in RFC 4632. For IPv6 addresses, the ranges are expressed in similar encoding as IPv4 addresses. | false | false | None | None | None |
| `permitted_email_addresses` | Contains the permitted email addresses. The value can be a particular email address, a hostname to indicate all email addresses on that host or a domain with a leading period (e.g. `.example.com`) to indicate all email addresses in that domain. | false | false | None | None | None |
| `excluded_email_addresses` | Contains the excluded email addresses. The value can be a particular email address, a hostname to indicate all email addresses on that host or a domain with a leading period (e.g. `.example.com`) to indicate all email addresses in that domain. | false | false | None | None | None |
| `permitted_uris` | Contains the permitted URIs that apply to the host part of the name. The value can be a hostname or a domain with a leading period (like `.example.com`) | false | false | None | None | None |
| `excluded_uris` | Contains the excluded URIs that apply to the host part of the name. The value can be a hostname or a domain with a leading period (like `.example.com`) | false | false | None | None | None |
