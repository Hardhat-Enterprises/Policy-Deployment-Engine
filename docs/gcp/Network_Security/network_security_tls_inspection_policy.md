## 🛡️ Policy Deployment Engine: `network_security_tls_inspection_policy`

This section provides a concise policy evaluation for the `network_security_tls_inspection_policy` resource in GCP.

Reference: [Terraform Registry – network_security_tls_inspection_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_tls_inspection_policy)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ca_pool` | A CA pool resource used to issue interception certificates. | true | false | None | None | None |
| `name` | Short name of the TlsInspectionPolicy resource to be created. | true | false | None | None | None |
| `description` | Free-text description of the resource. | false | false | None | None | None |
| `trust_config` | A TrustConfig resource used when making a connection to the TLS server. This is a relative resource path following the form \"projects/{project}/locations/{location}/trustConfigs/{trust_config}\". This is necessary to intercept TLS connections to servers with certificates signed by a private CA or self-signed certificates. Trust config and the TLS inspection policy must be in the same region. Note that Secure Web Proxy does not yet honor this field. | false | false | None | None | None |
| `min_tls_version` | Minimum TLS version that the firewall should use when negotiating connections with both clients and servers. If this is not set, then the default value is to allow the broadest set of clients and servers (TLS 1.0 or higher). Setting this to more restrictive values may improve security, but may also prevent the firewall from connecting to some clients or servers. Note that Secure Web Proxy does not yet honor this field. Default value is `TLS_VERSION_UNSPECIFIED`. Possible values are: `TLS_VERSION_UNSPECIFIED`, `TLS_1_0`, `TLS_1_1`, `TLS_1_2`, `TLS_1_3`. | false | false | None | None | None |
| `tls_feature_profile` | The selected Profile. If this is not set, then the default value is to allow the broadest set of clients and servers (\"PROFILE_COMPATIBLE\"). Setting this to more restrictive values may improve security, but may also prevent the TLS inspection proxy from connecting to some clients or servers. Note that Secure Web Proxy does not yet honor this field. Default value is `PROFILE_UNSPECIFIED`. Possible values are: `PROFILE_UNSPECIFIED`, `PROFILE_COMPATIBLE`, `PROFILE_MODERN`, `PROFILE_RESTRICTED`, `PROFILE_CUSTOM`. | false | false | None | None | None |
| `custom_tls_features` | List of custom TLS cipher suites selected. This field is valid only if the selected tls_feature_profile is CUSTOM. The compute.SslPoliciesService.ListAvailableFeatures method returns the set of features that can be specified in this list. Note that Secure Web Proxy does not yet honor this field. | false | false | None | None | None |
| `exclude_public_ca_set` | If FALSE (the default), use our default set of public CAs in addition to any CAs specified in trustConfig. These public CAs are currently based on the Mozilla Root Program and are subject to change over time. If TRUE, do not accept our default set of public CAs. Only CAs specified in trustConfig will be accepted. | false | false | None | None | None |
| `location` | The location of the tls inspection policy. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
