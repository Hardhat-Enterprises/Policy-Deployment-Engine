## 🛡️ Policy Deployment Engine: `iam_workload_identity_pool_provider`

This section provides a concise policy evaluation for the `iam_workload_identity_pool_provider` resource in GCP.

Reference: [Terraform Registry – iam_workload_identity_pool_provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider)

---

## 1. Argument Reference

### `workload_identity_pool_id`
- Description: (Required) The ID used for the pool, which is the final component of the pool resource name. This value should be 4-32 characters, and may contain the characters [a-z0-9-]. The prefix `gcp-` is reserved for use by Google, and may not be specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `workload_identity_pool_provider_id`
- Description: (Required) The ID for the provider, which becomes the final component of the resource name. This value must be 4-32 characters, and may contain the characters [a-z0-9-]. The prefix `gcp-` is reserved for use by Google, and may not be specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) A display name for the provider. Cannot exceed 32 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A description for the provider. Cannot exceed 256 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) Whether the provider is disabled. You cannot use a disabled provider to exchange tokens. However, existing tokens still grant access.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `attribute_mapping`
- Description: (Optional) Maps attributes from authentication credentials issued by an external identity provider to Google Cloud attributes, such as `subject` and `segment`. Each key must be a string specifying the Google Cloud IAM attribute to map to. The following keys are supported:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `attribute_condition`
- Description: (Optional) [A Common Expression Language](https://opensource.google/projects/cel) expression, in plain text, to restrict what otherwise valid authentication credentials issued by the provider should not be accepted. The expression must output a boolean representing whether to allow the federation. The following keywords may be referenced in the expressions:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aws`
- Description: (Optional) An Amazon Web Services identity provider. Not compatible with the property oidc or saml. Structure is [documented below](#nested_aws).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oidc`
- Description: (Optional) An OpenId Connect 1.0 identity provider. Not compatible with the property aws or saml. Structure is [documented below](#nested_oidc).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `saml`
- Description: (Optional) An SAML 2.0 identity provider. Not compatible with the property oidc or aws. Structure is [documented below](#nested_saml).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `x509`
- Description: (Optional) An X.509-type identity provider represents a CA. It is trusted to assert a client identity if the client has a certificate that chains up to this CA. Structure is [documented below](#nested_x509).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_aws"></a>The `aws` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `account_id`
- Description: (Required) The AWS account ID. <a name="nested_oidc"></a>The `oidc` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_audiences`
- Description: (Optional) Acceptable values for the `aud` field (audience) in the OIDC token. Token exchange requests are rejected if the token audience does not match one of the configured values. Each audience may be at most 256 characters. A maximum of 10 audiences may be configured. If this list is empty, the OIDC token audience must be equal to the full canonical resource name of the WorkloadIdentityPoolProvider, with or without the HTTPS prefix. For example: ``` //iam.googleapis.com/projects/<project-number>/locations/<location>/workloadIdentityPools/<pool-id>/providers/<provider-id> https://iam.googleapis.com/projects/<project-number>/locations/<location>/workloadIdentityPools/<pool-id>/providers/<provider-id> ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `issuer_uri`
- Description: (Required) The OIDC issuer URL.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jwks_json`
- Description: (Optional) OIDC JWKs in JSON String format. For details on definition of a JWK, see https:tools.ietf.org/html/rfc7517. If not set, then we use the `jwks_uri` from the discovery document fetched from the .well-known path for the `issuer_uri`. Currently, RSA and EC asymmetric keys are supported. The JWK must use following format and include only the following fields: ``` { "keys": [ { "kty": "RSA/EC", "alg": "<algorithm>", "use": "sig", "kid": "<key-id>", "n": "", "e": "", "x": "", "y": "", "crv": "" } ] } ``` <a name="nested_saml"></a>The `saml` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `idp_metadata_xml`
- Description: (Required) SAML Identity provider configuration metadata xml doc. <a name="nested_x509"></a>The `x509` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `trust_store`
- Description: (Required) A Trust store, use this trust store as a wrapper to config the trust anchor and optional intermediate cas to help build the trust chain for the incoming end entity certificate. Follow the x509 guidelines to define those PEM encoded certs. Only 1 trust store is currently supported. Structure is [documented below](#nested_x509_trust_store). <a name="nested_x509_trust_store"></a>The `trust_store` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `trust_anchors`
- Description: (Required) List of Trust Anchors to be used while performing validation against a given TrustStore. The incoming end entity's certificate must be chained up to one of the trust anchors here. Structure is [documented below](#nested_x509_trust_store_trust_anchors).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `intermediate_cas`
- Description: (Optional) Set of intermediate CA certificates used for building the trust chain to trust anchor. IMPORTANT: Intermediate CAs are only supported when configuring x509 federation. Structure is [documented below](#nested_x509_trust_store_intermediate_cas). <a name="nested_x509_trust_store_trust_anchors"></a>The `trust_anchors` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pem_certificate`
- Description: (Optional) PEM certificate of the PKI used for validation. Must only contain one ca certificate(either root or intermediate cert). <a name="nested_x509_trust_store_intermediate_cas"></a>The `intermediate_cas` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pem_certificate`
- Description: (Optional) PEM certificate of the PKI used for validation. Must only contain one ca certificate(either root or intermediate cert).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
