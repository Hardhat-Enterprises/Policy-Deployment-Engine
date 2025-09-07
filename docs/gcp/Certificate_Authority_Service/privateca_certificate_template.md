## 🛡️ Policy Deployment Engine: `privateca_certificate_template`

This section provides a concise policy evaluation for the `privateca_certificate_template` resource in GCP.

Reference: [Terraform Registry – privateca_certificate_template](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/privateca_certificate_template)

---

## 1. Argument Reference

### `name`
- Description: (Required) The resource name for this CertificateTemplate in the format `projects/*/locations/*/certificateTemplates/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `predefined_values`
- Description: (Optional) Optional. A set of X.509 values that will be applied to all issued certificates that use this template. If the certificate request includes conflicting values for the same properties, they will be overwritten by the values defined here. If the issuing CaPool's IssuancePolicy defines conflicting baseline_values for the same properties, the certificate issuance request will fail. Structure is [documented below](#nested_predefined_values).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `identity_constraints`
- Description: (Optional) Optional. Describes constraints on identities that may be appear in Certificates issued using this template. If this is omitted, then this template will not add restrictions on a certificate's identity. Structure is [documented below](#nested_identity_constraints).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `passthrough_extensions`
- Description: (Optional) Optional. Describes the set of X.509 extensions that may appear in a Certificate issued using this CertificateTemplate. If a certificate request sets extensions that don't appear in the passthrough_extensions, those extensions will be dropped. If the issuing CaPool's IssuancePolicy defines baseline_values that don't appear here, the certificate issuance request will fail. If this is omitted, then this template will not add restrictions on a certificate's X.509 extensions. These constraints do not apply to X.509 extensions set in this CertificateTemplate's predefined_values. Structure is [documented below](#nested_passthrough_extensions).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maximum_lifetime`
- Description: (Optional) Optional. The maximum lifetime allowed for all issued certificates that use this template. If the issuing CaPool's IssuancePolicy specifies a maximum lifetime the minimum of the two durations will be the maximum lifetime for issued. Note that if the issuing CertificateAuthority expires before a Certificate's requested maximum_lifetime, the effective lifetime will be explicitly truncated to match it.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Optional. A human-readable description of scenarios this template is intended for.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Optional. Labels with user-defined metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_predefined_values"></a>The `predefined_values` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_usage`
- Description: (Optional) Optional. Indicates the intended use for keys that correspond to a certificate. Structure is [documented below](#nested_predefined_values_key_usage).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ca_options`
- Description: (Optional) Optional. Describes options in this X509Parameters that are relevant in a CA certificate. Structure is [documented below](#nested_predefined_values_ca_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_ids`
- Description: (Optional) Optional. Describes the X.509 certificate policy object identifiers, per https://tools.ietf.org/html/rfc5280#section-4.2.1.4. Structure is [documented below](#nested_predefined_values_policy_ids).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aia_ocsp_servers`
- Description: (Optional) Optional. Describes Online Certificate Status Protocol (OCSP) endpoint addresses that appear in the "Authority Information Access" extension in the certificate.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_extensions`
- Description: (Optional) Optional. Describes custom X.509 extensions. Structure is [documented below](#nested_predefined_values_additional_extensions).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name_constraints`
- Description: (Optional) Describes the X.509 name constraints extension. Structure is [documented below](#nested_predefined_values_name_constraints). <a name="nested_predefined_values_key_usage"></a>The `key_usage` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `base_key_usage`
- Description: (Optional) Describes high-level ways in which a key may be used. Structure is [documented below](#nested_predefined_values_key_usage_base_key_usage).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `extended_key_usage`
- Description: (Optional) Detailed scenarios in which a key may be used. Structure is [documented below](#nested_predefined_values_key_usage_extended_key_usage).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `unknown_extended_key_usages`
- Description: (Optional) Used to describe extended key usages that are not listed in the KeyUsage.ExtendedKeyUsageOptions message. Structure is [documented below](#nested_predefined_values_key_usage_unknown_extended_key_usages). <a name="nested_predefined_values_key_usage_base_key_usage"></a>The `base_key_usage` block supports:
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
- Description: (Optional) The key may be used to decipher only. <a name="nested_predefined_values_key_usage_extended_key_usage"></a>The `extended_key_usage` block supports:
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
- Description: (Optional) Corresponds to OID 1.3.6.1.5.5.7.3.9. Officially described as "Signing OCSP responses". <a name="nested_predefined_values_key_usage_unknown_extended_key_usages"></a>The `unknown_extended_key_usages` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object_id_path`
- Description: (Required) Required. The parts of an OID path. The most significant parts of the path come first. <a name="nested_predefined_values_ca_options"></a>The `ca_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_ca`
- Description: (Optional) Optional. Refers to the "CA" X.509 extension, which is a boolean value. When this value is true, the "CA" in Basic Constraints extension will be set to true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `null_ca`
- Description: (Optional) Optional. When true, the "CA" in Basic Constraints extension will be set to null and omitted from the CA certificate. If both `is_ca` and `null_ca` are unset, the "CA" in Basic Constraints extension will be set to false. Note that the behavior when `is_ca = false` for this resource is different from the behavior in the Certificate Authority, Certificate and CaPool resources.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_issuer_path_length`
- Description: (Optional) Optional. Refers to the "path length constraint" in Basic Constraints extension. For a CA certificate, this value describes the depth of subordinate CA certificates that are allowed. If this value is less than 0, the request will fail.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zero_max_issuer_path_length`
- Description: (Optional) Optional. When true, the "path length constraint" in Basic Constraints extension will be set to 0. if both `max_issuer_path_length` and `zero_max_issuer_path_length` are unset, the max path length will be omitted from the CA certificate. <a name="nested_predefined_values_policy_ids"></a>The `policy_ids` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object_id_path`
- Description: (Required) Required. The parts of an OID path. The most significant parts of the path come first. <a name="nested_predefined_values_additional_extensions"></a>The `additional_extensions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object_id`
- Description: (Required) Required. The OID for this X.509 extension. Structure is [documented below](#nested_predefined_values_additional_extensions_additional_extensions_object_id).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `critical`
- Description: (Optional) Optional. Indicates whether or not this extension is critical (i.e., if the client does not know how to handle this extension, the client should consider this to be an error).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Required) Required. The value of this X.509 extension. <a name="nested_predefined_values_additional_extensions_additional_extensions_object_id"></a>The `object_id` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object_id_path`
- Description: (Required) Required. The parts of an OID path. The most significant parts of the path come first. <a name="nested_predefined_values_name_constraints"></a>The `name_constraints` block supports:
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
- Description: (Optional) Contains the excluded URIs that apply to the host part of the name. The value can be a hostname or a domain with a leading period (like `.example.com`) <a name="nested_identity_constraints"></a>The `identity_constraints` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cel_expression`
- Description: (Optional) Optional. A CEL expression that may be used to validate the resolved X.509 Subject and/or Subject Alternative Name before a certificate is signed. To see the full allowed syntax and some examples, see https://cloud.google.com/certificate-authority-service/docs/using-cel Structure is [documented below](#nested_identity_constraints_cel_expression).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_subject_passthrough`
- Description: (Required) Required. If this is true, the Subject field may be copied from a certificate request into the signed certificate. Otherwise, the requested Subject will be discarded.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_subject_alt_names_passthrough`
- Description: (Required) Required. If this is true, the SubjectAltNames extension may be copied from a certificate request into the signed certificate. Otherwise, the requested SubjectAltNames will be discarded. <a name="nested_identity_constraints_cel_expression"></a>The `cel_expression` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expression`
- Description: (Optional) Textual representation of an expression in Common Expression Language syntax.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `title`
- Description: (Optional) Optional. Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Optional. Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) Optional. String indicating the location of the expression for error reporting, e.g. a file name and a position in the file. <a name="nested_passthrough_extensions"></a>The `passthrough_extensions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `known_extensions`
- Description: (Optional) Optional. A set of named X.509 extensions. Will be combined with additional_extensions to determine the full set of X.509 extensions.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_extensions`
- Description: (Optional) Optional. A set of ObjectIds identifying custom X.509 extensions. Will be combined with known_extensions to determine the full set of X.509 extensions. Structure is [documented below](#nested_passthrough_extensions_additional_extensions). <a name="nested_passthrough_extensions_additional_extensions"></a>The `additional_extensions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object_id_path`
- Description: (Required) Required. The parts of an OID path. The most significant parts of the path come first.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
