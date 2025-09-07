## 🛡️ Policy Deployment Engine: `privateca_certificate_authority`

This section provides a concise policy evaluation for the `privateca_certificate_authority` resource in GCP.

Reference: [Terraform Registry – privateca_certificate_authority](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/privateca_certificate_authority)

---

## 1. Argument Reference

### `location`
- Description: (Required) Location of the CertificateAuthority. A full list of valid locations can be found by running `gcloud privateca locations list`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `certificate_authority_id`
- Description: (Required) The user provided Resource ID for this Certificate Authority.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pool`
- Description: (Required) The name of the CaPool this Certificate Authority belongs to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config`
- Description: (Required) The config used to create a self-signed X.509 certificate or CSR. Structure is [documented below](#nested_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_spec`
- Description: (Required) Used when issuing certificates for this CertificateAuthority. If this CertificateAuthority is a self-signed CertificateAuthority, this key is also used to sign the self-signed CA certificate. Otherwise, it is used to sign a CSR. Structure is [documented below](#nested_key_spec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pem_ca_certificate`
- Description: (Optional) The signed CA certificate issued from the subordinated CA's CSR. This is needed when activating the subordiante CA with a third party issuer.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ignore_active_certificates_on_deletion`
- Description: (Optional) This field allows the CA to be deleted even if the CA has active certs. Active certs include both unrevoked and unexpired certs. Use with care. Defaults to `false`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `skip_grace_period`
- Description: (Optional) If this flag is set, the Certificate Authority will be deleted as soon as possible without a 30-day grace period where undeletion would have been allowed. If you proceed, there will be no way to recover this CA. Use with care. Defaults to `false`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) The Type of this CertificateAuthority. ~> **Note:** For `SUBORDINATE` Certificate Authorities, they need to be activated before they can issue certificates. Default value is `SELF_SIGNED`. Possible values are: `SELF_SIGNED`, `SUBORDINATE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `lifetime`
- Description: (Optional) The desired lifetime of the CA certificate. Used to create the "notBeforeTime" and "notAfterTime" fields inside an X.509 certificate. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subordinate_config`
- Description: (Optional) If this is a subordinate CertificateAuthority, this field will be set with the subordinate configuration, which describes its issuers. Structure is [documented below](#nested_subordinate_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs_bucket`
- Description: (Optional) The name of a Cloud Storage bucket where this CertificateAuthority will publish content, such as the CA certificate and CRLs. This must be a bucket name, without any prefixes (such as `gs://`) or suffixes (such as `.googleapis.com`). For example, to use a bucket named my-bucket, you would simply specify `my-bucket`. If not specified, a managed bucket will be created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels with user-defined metadata. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_defined_access_urls`
- Description: (Optional) Custom URLs for accessing content published by this CA, such as the CA certificate and CRLs, that can be specified by users. Structure is [documented below](#nested_user_defined_access_urls).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_protection`
- Description: When the field is set to true or unset in Terraform state, a `terraform apply` or `terraform destroy` that would delete the CertificateAuthority will fail. When the field is set to false, deleting the CertificateAuthority is allowed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `desired_state`
- Description: Possible values: ENABLED, DISABLED, STAGED. <a name="nested_config"></a>The `config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subject_key_id`
- Description: (Optional) When specified this provides a custom SKI to be used in the certificate. This should only be used to maintain a SKI of an existing CA originally created outside CA service, which was not generated using method (1) described in RFC 5280 section 4.2.1.2.. Structure is [documented below](#nested_config_subject_key_id).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `x509_config`
- Description: (Required) Describes how some of the technical X.509 fields in a certificate should be populated. Structure is [documented below](#nested_config_x509_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subject_config`
- Description: (Required) Specifies some of the values in a certificate that are related to the subject. Structure is [documented below](#nested_config_subject_config). <a name="nested_config_subject_key_id"></a>The `subject_key_id` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_id`
- Description: (Optional) The value of the KeyId in lowercase hexadecimal. <a name="nested_config_x509_config"></a>The `x509_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_extensions`
- Description: (Optional) Specifies an X.509 extension, which may be used in different parts of X.509 objects like certificates, CSRs, and CRLs. Structure is [documented below](#nested_config_x509_config_additional_extensions).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_ids`
- Description: (Optional) Describes the X.509 certificate policy object identifiers, per https://tools.ietf.org/html/rfc5280#section-4.2.1.4. Structure is [documented below](#nested_config_x509_config_policy_ids).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aia_ocsp_servers`
- Description: (Optional) Describes Online Certificate Status Protocol (OCSP) endpoint addresses that appear in the "Authority Information Access" extension in the certificate.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ca_options`
- Description: (Required) Describes values that are relevant in a CA certificate. Structure is [documented below](#nested_config_x509_config_ca_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_usage`
- Description: (Required) Indicates the intended use for keys that correspond to a certificate. Structure is [documented below](#nested_config_x509_config_key_usage).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name_constraints`
- Description: (Optional) Describes the X.509 name constraints extension. Structure is [documented below](#nested_config_x509_config_name_constraints). <a name="nested_config_x509_config_additional_extensions"></a>The `additional_extensions` block supports:
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
- Description: (Required) Describes values that are relevant in a CA certificate. Structure is [documented below](#nested_config_x509_config_additional_extensions_additional_extensions_object_id). <a name="nested_config_x509_config_additional_extensions_additional_extensions_object_id"></a>The `object_id` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object_id_path`
- Description: (Required) An ObjectId specifies an object identifier (OID). These provide context and describe types in ASN.1 messages. <a name="nested_config_x509_config_policy_ids"></a>The `policy_ids` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object_id_path`
- Description: (Required) An ObjectId specifies an object identifier (OID). These provide context and describe types in ASN.1 messages. <a name="nested_config_x509_config_ca_options"></a>The `ca_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_ca`
- Description: (Required) When true, the "CA" in Basic Constraints extension will be set to true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `non_ca`
- Description: (Optional) When true, the "CA" in Basic Constraints extension will be set to false. If both `is_ca` and `non_ca` are unset, the extension will be omitted from the CA certificate.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_issuer_path_length`
- Description: (Optional) Refers to the "path length constraint" in Basic Constraints extension. For a CA certificate, this value describes the depth of subordinate CA certificates that are allowed. If this value is less than 0, the request will fail. Setting the value to 0 requires setting `zero_max_issuer_path_length = true`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zero_max_issuer_path_length`
- Description: (Optional) When true, the "path length constraint" in Basic Constraints extension will be set to 0. If both `max_issuer_path_length` and `zero_max_issuer_path_length` are unset, the max path length will be omitted from the CA certificate. <a name="nested_config_x509_config_key_usage"></a>The `key_usage` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `base_key_usage`
- Description: (Required) Describes high-level ways in which a key may be used. Structure is [documented below](#nested_config_x509_config_key_usage_base_key_usage).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `extended_key_usage`
- Description: (Required) Describes high-level ways in which a key may be used. Structure is [documented below](#nested_config_x509_config_key_usage_extended_key_usage).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `unknown_extended_key_usages`
- Description: (Optional) An ObjectId specifies an object identifier (OID). These provide context and describe types in ASN.1 messages. Structure is [documented below](#nested_config_x509_config_key_usage_unknown_extended_key_usages). <a name="nested_config_x509_config_key_usage_base_key_usage"></a>The `base_key_usage` block supports:
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
- Description: (Optional) The key may be used to decipher only. <a name="nested_config_x509_config_key_usage_extended_key_usage"></a>The `extended_key_usage` block supports:
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
- Description: (Optional) Corresponds to OID 1.3.6.1.5.5.7.3.9. Officially described as "Signing OCSP responses". <a name="nested_config_x509_config_key_usage_unknown_extended_key_usages"></a>The `unknown_extended_key_usages` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object_id_path`
- Description: (Required) An ObjectId specifies an object identifier (OID). These provide context and describe types in ASN.1 messages. <a name="nested_config_x509_config_name_constraints"></a>The `name_constraints` block supports:
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
- Description: (Optional) Contains the excluded URIs that apply to the host part of the name. The value can be a hostname or a domain with a leading period (like `.example.com`) <a name="nested_config_subject_config"></a>The `subject_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subject`
- Description: (Required) Contains distinguished name fields such as the location and organization. Structure is [documented below](#nested_config_subject_config_subject).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subject_alt_name`
- Description: (Optional) The subject alternative name fields. Structure is [documented below](#nested_config_subject_config_subject_alt_name). <a name="nested_config_subject_config_subject"></a>The `subject` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `country_code`
- Description: (Optional) The country code of the subject.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `organization`
- Description: (Optional) The organization of the subject.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `organizational_unit`
- Description: (Optional) The organizational unit of the subject.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `locality`
- Description: (Optional) The locality or city of the subject.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `province`
- Description: (Optional) The province, territory, or regional state of the subject.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `street_address`
- Description: (Optional) The street address of the subject.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `postal_code`
- Description: (Optional) The postal code of the subject.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `common_name`
- Description: (Required) The common name of the distinguished name. <a name="nested_config_subject_config_subject_alt_name"></a>The `subject_alt_name` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dns_names`
- Description: (Optional) Contains only valid, fully-qualified host names.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uris`
- Description: (Optional) Contains only valid RFC 3986 URIs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `email_addresses`
- Description: (Optional) Contains only valid RFC 2822 E-mail addresses.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_addresses`
- Description: (Optional) Contains only valid 32-bit IPv4 addresses or RFC 4291 IPv6 addresses. <a name="nested_key_spec"></a>The `key_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_kms_key_version`
- Description: (Optional) The resource name for an existing Cloud KMS CryptoKeyVersion in the format `projects/*/locations/*/keyRings/*/cryptoKeys/*/cryptoKeyVersions/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `algorithm`
- Description: (Optional) The algorithm to use for creating a managed Cloud KMS key for a for a simplified experience. All managed keys will be have their ProtectionLevel as HSM. Possible values are: `SIGN_HASH_ALGORITHM_UNSPECIFIED`, `RSA_PSS_2048_SHA256`, `RSA_PSS_3072_SHA256`, `RSA_PSS_4096_SHA256`, `RSA_PKCS1_2048_SHA256`, `RSA_PKCS1_3072_SHA256`, `RSA_PKCS1_4096_SHA256`, `EC_P256_SHA256`, `EC_P384_SHA384`. <a name="nested_subordinate_config"></a>The `subordinate_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `certificate_authority`
- Description: (Optional) This can refer to a CertificateAuthority that was used to create a subordinate CertificateAuthority. This field is used for information and usability purposes only. The resource name is in the format `projects/*/locations/*/caPools/*/certificateAuthorities/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pem_issuer_chain`
- Description: (Optional) Contains the PEM certificate chain for the issuers of this CertificateAuthority, but not pem certificate for this CA itself. Structure is [documented below](#nested_subordinate_config_pem_issuer_chain). <a name="nested_subordinate_config_pem_issuer_chain"></a>The `pem_issuer_chain` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pem_certificates`
- Description: (Optional) Expected to be in leaf-to-root order according to RFC 5246. <a name="nested_user_defined_access_urls"></a>The `user_defined_access_urls` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aia_issuing_certificate_urls`
- Description: (Optional) A list of URLs where this CertificateAuthority's CA certificate is published that is specified by users.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `crl_access_urls`
- Description: (Optional) A list of URLs where this CertificateAuthority's CRLs are published that is specified by users.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
