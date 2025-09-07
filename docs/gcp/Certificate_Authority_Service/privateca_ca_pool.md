## 🛡️ Policy Deployment Engine: `privateca_ca_pool`

This section provides a concise policy evaluation for the `privateca_ca_pool` resource in GCP.

Reference: [Terraform Registry – privateca_ca_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/privateca_ca_pool)

---

## 1. Argument Reference

### `name`
- Description: (Required) The name for this CaPool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tier`
- Description: (Required) The Tier of this CaPool. Possible values are: `ENTERPRISE`, `DEVOPS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Location of the CaPool. A full list of valid locations can be found by running `gcloud privateca locations list`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `issuance_policy`
- Description: (Optional) The IssuancePolicy to control how Certificates will be issued from this CaPool. Structure is [documented below](#nested_issuance_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `publishing_options`
- Description: (Optional) The PublishingOptions to follow when issuing Certificates from any CertificateAuthority in this CaPool. Structure is [documented below](#nested_publishing_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels with user-defined metadata. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_issuance_policy"></a>The `issuance_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_key_types`
- Description: (Optional) If any AllowedKeyType is specified, then the certificate request's public key must match one of the key types listed here. Otherwise, any key may be used. Structure is [documented below](#nested_issuance_policy_allowed_key_types).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backdate_duration`
- Description: (Optional) The duration to backdate all certificates issued from this CaPool. If not set, the certificates will be issued with a not_before_time of the issuance time (i.e. the current time). If set, the certificates will be issued with a not_before_time of the issuance time minus the backdate_duration. The not_after_time will be adjusted to preserve the requested lifetime. The backdate_duration must be less than or equal to 48 hours.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maximum_lifetime`
- Description: (Optional) The maximum lifetime allowed for issued Certificates. Note that if the issuing CertificateAuthority expires before a Certificate's requested maximumLifetime, the effective lifetime will be explicitly truncated to match it.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_issuance_modes`
- Description: (Optional) IssuanceModes specifies the allowed ways in which Certificates may be requested from this CaPool. Structure is [documented below](#nested_issuance_policy_allowed_issuance_modes).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `identity_constraints`
- Description: (Optional) Describes constraints on identities that may appear in Certificates issued through this CaPool. If this is omitted, then this CaPool will not add restrictions on a certificate's identity. Structure is [documented below](#nested_issuance_policy_identity_constraints).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `baseline_values`
- Description: (Optional) A set of X.509 values that will be applied to all certificates issued through this CaPool. If a certificate request includes conflicting values for the same properties, they will be overwritten by the values defined here. If a certificate request uses a CertificateTemplate that defines conflicting predefinedValues for the same properties, the certificate issuance request will fail. Structure is [documented below](#nested_issuance_policy_baseline_values). <a name="nested_issuance_policy_allowed_key_types"></a>The `allowed_key_types` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rsa`
- Description: (Optional) Describes an RSA key that may be used in a Certificate issued from a CaPool. Structure is [documented below](#nested_issuance_policy_allowed_key_types_allowed_key_types_rsa).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `elliptic_curve`
- Description: (Optional) Represents an allowed Elliptic Curve key type. Structure is [documented below](#nested_issuance_policy_allowed_key_types_allowed_key_types_elliptic_curve). <a name="nested_issuance_policy_allowed_key_types_allowed_key_types_rsa"></a>The `rsa` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_modulus_size`
- Description: (Optional) The minimum allowed RSA modulus size, in bits. If this is not set, or if set to zero, the service-level min RSA modulus size will continue to apply.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_modulus_size`
- Description: (Optional) The maximum allowed RSA modulus size, in bits. If this is not set, or if set to zero, the service will not enforce an explicit upper bound on RSA modulus sizes. <a name="nested_issuance_policy_allowed_key_types_allowed_key_types_elliptic_curve"></a>The `elliptic_curve` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `signature_algorithm`
- Description: (Required) The algorithm used. Possible values are: `ECDSA_P256`, `ECDSA_P384`, `EDDSA_25519`. <a name="nested_issuance_policy_allowed_issuance_modes"></a>The `allowed_issuance_modes` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_csr_based_issuance`
- Description: (Required) When true, allows callers to create Certificates by specifying a CSR.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_config_based_issuance`
- Description: (Required) When true, allows callers to create Certificates by specifying a CertificateConfig. <a name="nested_issuance_policy_identity_constraints"></a>The `identity_constraints` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_subject_passthrough`
- Description: (Required) If this is set, the Subject field may be copied from a certificate request into the signed certificate. Otherwise, the requested Subject will be discarded.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_subject_alt_names_passthrough`
- Description: (Required) If this is set, the SubjectAltNames extension may be copied from a certificate request into the signed certificate. Otherwise, the requested SubjectAltNames will be discarded.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cel_expression`
- Description: (Optional) A CEL expression that may be used to validate the resolved X.509 Subject and/or Subject Alternative Name before a certificate is signed. To see the full allowed syntax and some examples, see https://cloud.google.com/certificate-authority-service/docs/cel-guide Structure is [documented below](#nested_issuance_policy_identity_constraints_cel_expression). <a name="nested_issuance_policy_identity_constraints_cel_expression"></a>The `cel_expression` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expression`
- Description: (Required) Textual representation of an expression in Common Expression Language syntax.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `title`
- Description: (Optional) Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) String indicating the location of the expression for error reporting, e.g. a file name and a position in the file. <a name="nested_issuance_policy_baseline_values"></a>The `baseline_values` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_extensions`
- Description: (Optional) Specifies an X.509 extension, which may be used in different parts of X.509 objects like certificates, CSRs, and CRLs. Structure is [documented below](#nested_issuance_policy_baseline_values_additional_extensions).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_ids`
- Description: (Optional) Describes the X.509 certificate policy object identifiers, per https://tools.ietf.org/html/rfc5280#section-4.2.1.4. Structure is [documented below](#nested_issuance_policy_baseline_values_policy_ids).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aia_ocsp_servers`
- Description: (Optional) Describes Online Certificate Status Protocol (OCSP) endpoint addresses that appear in the "Authority Information Access" extension in the certificate.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ca_options`
- Description: (Required) Describes values that are relevant in a CA certificate. Structure is [documented below](#nested_issuance_policy_baseline_values_ca_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_usage`
- Description: (Required) Indicates the intended use for keys that correspond to a certificate. Structure is [documented below](#nested_issuance_policy_baseline_values_key_usage).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name_constraints`
- Description: (Optional) Describes the X.509 name constraints extension. Structure is [documented below](#nested_issuance_policy_baseline_values_name_constraints). <a name="nested_issuance_policy_baseline_values_additional_extensions"></a>The `additional_extensions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `critical`
- Description: (Required) Indicates whether or not this extension is critical (i.e., if the client does not know how to handle this extension, the client should consider this to be an error).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Required) The value of this X.509 extension. A base64-encoded string.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object_id`
- Description: (Required) Describes values that are relevant in a CA certificate. Structure is [documented below](#nested_issuance_policy_baseline_values_additional_extensions_additional_extensions_object_id). <a name="nested_issuance_policy_baseline_values_additional_extensions_additional_extensions_object_id"></a>The `object_id` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object_id_path`
- Description: (Required) An ObjectId specifies an object identifier (OID). These provide context and describe types in ASN.1 messages. <a name="nested_issuance_policy_baseline_values_policy_ids"></a>The `policy_ids` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object_id_path`
- Description: (Required) An ObjectId specifies an object identifier (OID). These provide context and describe types in ASN.1 messages. <a name="nested_issuance_policy_baseline_values_ca_options"></a>The `ca_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_ca`
- Description: (Optional) When true, the "CA" in Basic Constraints extension will be set to true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `non_ca`
- Description: (Optional) When true, the "CA" in Basic Constraints extension will be set to false. If both `is_ca` and `non_ca` are unset, the extension will be omitted from the CA certificate.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_issuer_path_length`
- Description: (Optional) Refers to the "path length constraint" in Basic Constraints extension. For a CA certificate, this value describes the depth of subordinate CA certificates that are allowed. If this value is less than 0, the request will fail.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zero_max_issuer_path_length`
- Description: (Optional) When true, the "path length constraint" in Basic Constraints extension will be set to 0. if both `max_issuer_path_length` and `zero_max_issuer_path_length` are unset, the max path length will be omitted from the CA certificate. <a name="nested_issuance_policy_baseline_values_key_usage"></a>The `key_usage` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `base_key_usage`
- Description: (Required) Describes high-level ways in which a key may be used. Structure is [documented below](#nested_issuance_policy_baseline_values_key_usage_base_key_usage).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `extended_key_usage`
- Description: (Required) Describes high-level ways in which a key may be used. Structure is [documented below](#nested_issuance_policy_baseline_values_key_usage_extended_key_usage).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `unknown_extended_key_usages`
- Description: (Optional) An ObjectId specifies an object identifier (OID). These provide context and describe types in ASN.1 messages. Structure is [documented below](#nested_issuance_policy_baseline_values_key_usage_unknown_extended_key_usages). <a name="nested_issuance_policy_baseline_values_key_usage_base_key_usage"></a>The `base_key_usage` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `digital_signature`
- Description: (Optional) The key may be used for digital signatures.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `content_commitment`
- Description: (Optional) The key may be used for cryptographic commitments. Note that this may also be referred to as "non-repudiation".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_encipherment`
- Description: (Optional) The key may be used to encipher other keys.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_encipherment`
- Description: (Optional) The key may be used to encipher data.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_agreement`
- Description: (Optional) The key may be used in a key agreement protocol.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cert_sign`
- Description: (Optional) The key may be used to sign certificates.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `crl_sign`
- Description: (Optional) The key may be used sign certificate revocation lists.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encipher_only`
- Description: (Optional) The key may be used to encipher only.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `decipher_only`
- Description: (Optional) The key may be used to decipher only. <a name="nested_issuance_policy_baseline_values_key_usage_extended_key_usage"></a>The `extended_key_usage` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `server_auth`
- Description: (Optional) Corresponds to OID 1.3.6.1.5.5.7.3.1. Officially described as "TLS WWW server authentication", though regularly used for non-WWW TLS.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_auth`
- Description: (Optional) Corresponds to OID 1.3.6.1.5.5.7.3.2. Officially described as "TLS WWW client authentication", though regularly used for non-WWW TLS.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `code_signing`
- Description: (Optional) Corresponds to OID 1.3.6.1.5.5.7.3.3. Officially described as "Signing of downloadable executable code client authentication".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `email_protection`
- Description: (Optional) Corresponds to OID 1.3.6.1.5.5.7.3.4. Officially described as "Email protection".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_stamping`
- Description: (Optional) Corresponds to OID 1.3.6.1.5.5.7.3.8. Officially described as "Binding the hash of an object to a time".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ocsp_signing`
- Description: (Optional) Corresponds to OID 1.3.6.1.5.5.7.3.9. Officially described as "Signing OCSP responses". <a name="nested_issuance_policy_baseline_values_key_usage_unknown_extended_key_usages"></a>The `unknown_extended_key_usages` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object_id_path`
- Description: (Required) An ObjectId specifies an object identifier (OID). These provide context and describe types in ASN.1 messages. <a name="nested_issuance_policy_baseline_values_name_constraints"></a>The `name_constraints` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `critical`
- Description: (Required) Indicates whether or not the name constraints are marked critical.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `permitted_dns_names`
- Description: (Optional) Contains permitted DNS names. Any DNS name that can be constructed by simply adding zero or more labels to the left-hand side of the name satisfies the name constraint. For example, `example.com`, `www.example.com`, `www.sub.example.com` would satisfy `example.com` while `example1.com` does not.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `excluded_dns_names`
- Description: (Optional) Contains excluded DNS names. Any DNS name that can be constructed by simply adding zero or more labels to the left-hand side of the name satisfies the name constraint. For example, `example.com`, `www.example.com`, `www.sub.example.com` would satisfy `example.com` while `example1.com` does not.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `permitted_ip_ranges`
- Description: (Optional) Contains the permitted IP ranges. For IPv4 addresses, the ranges are expressed using CIDR notation as specified in RFC 4632. For IPv6 addresses, the ranges are expressed in similar encoding as IPv4 addresses.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `excluded_ip_ranges`
- Description: (Optional) Contains the excluded IP ranges. For IPv4 addresses, the ranges are expressed using CIDR notation as specified in RFC 4632. For IPv6 addresses, the ranges are expressed in similar encoding as IPv4 addresses.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `permitted_email_addresses`
- Description: (Optional) Contains the permitted email addresses. The value can be a particular email address, a hostname to indicate all email addresses on that host or a domain with a leading period (e.g. `.example.com`) to indicate all email addresses in that domain.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `excluded_email_addresses`
- Description: (Optional) Contains the excluded email addresses. The value can be a particular email address, a hostname to indicate all email addresses on that host or a domain with a leading period (e.g. `.example.com`) to indicate all email addresses in that domain.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `permitted_uris`
- Description: (Optional) Contains the permitted URIs that apply to the host part of the name. The value can be a hostname or a domain with a leading period (like `.example.com`)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `excluded_uris`
- Description: (Optional) Contains the excluded URIs that apply to the host part of the name. The value can be a hostname or a domain with a leading period (like `.example.com`) <a name="nested_publishing_options"></a>The `publishing_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `publish_ca_cert`
- Description: (Required) When true, publishes each CertificateAuthority's CA certificate and includes its URL in the "Authority Information Access" X.509 extension in all issued Certificates. If this is false, the CA certificate will not be published and the corresponding X.509 extension will not be written in issued certificates.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `publish_crl`
- Description: (Required) When true, publishes each CertificateAuthority's CRL and includes its URL in the "CRL Distribution Points" X.509 extension in all issued Certificates. If this is false, CRLs will not be published and the corresponding X.509 extension will not be written in issued certificates. CRLs will expire 7 days from their creation. However, we will rebuild daily. CRLs are also rebuilt shortly after a certificate is revoked.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encoding_format`
- Description: (Optional) Specifies the encoding format of each CertificateAuthority's CA certificate and CRLs. If this is omitted, CA certificates and CRLs will be published in PEM. Possible values are: `PEM`, `DER`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
