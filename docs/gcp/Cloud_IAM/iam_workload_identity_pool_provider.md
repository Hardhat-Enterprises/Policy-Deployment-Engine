## 🛡️ Policy Deployment Engine: `iam_workload_identity_pool_provider - WILL NOT BE COMPLETED IN ONE TRIMESTER`

This section provides a concise policy evaluation for the `iam_workload_identity_pool_provider - WILL NOT BE COMPLETED IN ONE TRIMESTER` resource in GCP.

Reference: [Terraform Registry – iam_workload_identity_pool_provider - WILL NOT BE COMPLETED IN ONE TRIMESTER](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider - WILL NOT BE COMPLETED IN ONE TRIMESTER)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `workload_identity_pool_id` | The ID used for the pool, which is the final component of the pool resource name. This value should be 4-32 characters, and may contain the characters [a-z0-9-]. The prefix `gcp-` is reserved for use by Google, and may not be specified. | true | false | None | None | None |
| `workload_identity_pool_provider_id` | The ID for the provider, which becomes the final component of the resource name. This value must be 4-32 characters, and may contain the characters [a-z0-9-]. The prefix `gcp-` is reserved for use by Google, and may not be specified. | true | false | None | None | None |
| `display_name` | A display name for the provider. Cannot exceed 32 characters. | false | false | None | None | None |
| `description` | A description for the provider. Cannot exceed 256 characters. | false | false | None | None | None |
| `disabled` | Whether the provider is disabled. You cannot use a disabled provider to exchange tokens. However, existing tokens still grant access. | false | false | None | None | None |
| `attribute_mapping` | Maps attributes from authentication credentials issued by an external identity provider to Google Cloud attributes, such as `subject` and `segment`. Each key must be a string specifying the Google Cloud IAM attribute to map to. The following keys are supported: * `google.subject`: The principal IAM is authenticating. You can reference this value in IAM bindings. This is also the subject that appears in Cloud Logging logs. Cannot exceed 127 characters. * `google.groups`: Groups the external identity belongs to. You can grant groups access to resources using an IAM `principalSet` binding; access applies to all members of the group. You can also provide custom attributes by specifying `attribute.{custom_attribute}`, where `{custom_attribute}` is the name of the custom attribute to be mapped. You can define a maximum of 50 custom attributes. The maximum length of a mapped attribute key is 100 characters, and the key may only contain the characters [a-z0-9_]. You can reference these attributes in IAM policies to define fine-grained access for a workload to Google Cloud resources. For example: * `google.subject`: `principal://iam.googleapis.com/projects/{project}/locations/{location}/workloadIdentityPools/{pool}/subject/{value}` * `google.groups`: `principalSet://iam.googleapis.com/projects/{project}/locations/{location}/workloadIdentityPools/{pool}/group/{value}` * `attribute.{custom_attribute}`: `principalSet://iam.googleapis.com/projects/{project}/locations/{location}/workloadIdentityPools/{pool}/attribute.{custom_attribute}/{value}` Each value must be a [Common Expression Language](https://opensource.google/projects/cel) function that maps an identity provider credential to the normalized attribute specified by the corresponding map key. You can use the `assertion` keyword in the expression to access a JSON representation of the authentication credential issued by the provider. The maximum length of an attribute mapping expression is 2048 characters. When evaluated, the total size of all mapped attributes must not exceed 8KB. For AWS providers, the following rules apply: - If no attribute mapping is defined, the following default mapping applies: ``` { "google.subject":"assertion.arn", "attribute.aws_role": "assertion.arn.contains('assumed-role')" " ? assertion.arn.extract('{account_arn}assumed-role/')" "   + 'assumed-role/'" "   + assertion.arn.extract('assumed-role/{role_name}/')" " : assertion.arn", } ``` - If any custom attribute mappings are defined, they must include a mapping to the `google.subject` attribute. For OIDC providers, the following rules apply: - Custom attribute mappings must be defined, and must include a mapping to the `google.subject` attribute. For example, the following maps the `sub` claim of the incoming credential to the `subject` attribute on a Google token. ``` {"google.subject": "assertion.sub"} ``` | false | false | None | None | None |
| `attribute_condition` | [A Common Expression Language](https://opensource.google/projects/cel) expression, in plain text, to restrict what otherwise valid authentication credentials issued by the provider should not be accepted. The expression must output a boolean representing whether to allow the federation. The following keywords may be referenced in the expressions: * `assertion`: JSON representing the authentication credential issued by the provider. * `google`: The Google attributes mapped from the assertion in the `attribute_mappings`. * `attribute`: The custom attributes mapped from the assertion in the `attribute_mappings`. The maximum length of the attribute condition expression is 4096 characters. If unspecified, all valid authentication credential are accepted. The following example shows how to only allow credentials with a mapped `google.groups` value of `admins`: ``` "'admins' in google.groups" ``` | false | false | None | None | None |
| `aws` | An Amazon Web Services identity provider. Not compatible with the property oidc or saml. Structure is [documented below](#nested_aws). | false | false | None | None | None |
| `oidc` | An OpenId Connect 1.0 identity provider. Not compatible with the property aws or saml. Structure is [documented below](#nested_oidc). | false | false | None | None | None |
| `saml` | An SAML 2.0 identity provider. Not compatible with the property oidc or aws. Structure is [documented below](#nested_saml). | false | false | None | None | None |
| `x509` | An X.509-type identity provider represents a CA. It is trusted to assert a client identity if the client has a certificate that chains up to this CA. Structure is [documented below](#nested_x509). | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `trust_store` |  | false | false | None | None | None |
| `trust_anchors` |  | false | false | None | None | None |
| `intermediate_cas` |  | false | false | None | None | None |

### aws Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `account_id` | The AWS account ID. | true | false | None | None | None |

### oidc Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `allowed_audiences` | Acceptable values for the `aud` field (audience) in the OIDC token. Token exchange requests are rejected if the token audience does not match one of the configured values. Each audience may be at most 256 characters. A maximum of 10 audiences may be configured. If this list is empty, the OIDC token audience must be equal to the full canonical resource name of the WorkloadIdentityPoolProvider, with or without the HTTPS prefix. For example: ``` //iam.googleapis.com/projects/<project-number>/locations/<location>/workloadIdentityPools/<pool-id>/providers/<provider-id> https://iam.googleapis.com/projects/<project-number>/locations/<location>/workloadIdentityPools/<pool-id>/providers/<provider-id> ``` | false | false | None | None | None |
| `issuer_uri` | The OIDC issuer URL. | true | false | None | None | None |
| `jwks_json` | OIDC JWKs in JSON String format. For details on definition of a JWK, see https:tools.ietf.org/html/rfc7517. If not set, then we use the `jwks_uri` from the discovery document fetched from the .well-known path for the `issuer_uri`. Currently, RSA and EC asymmetric keys are supported. The JWK must use following format and include only the following fields: ``` { "keys": [ { "kty": "RSA/EC", "alg": "<algorithm>", "use": "sig", "kid": "<key-id>", "n": "", "e": "", "x": "", "y": "", "crv": "" } ] } ``` | false | false | None | None | None |

### saml Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `idp_metadata_xml` | SAML Identity provider configuration metadata xml doc. | true | false | None | None | None |

### x509 Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `trust_store` | A Trust store, use this trust store as a wrapper to config the trust anchor and optional intermediate cas to help build the trust chain for the incoming end entity certificate. Follow the x509 guidelines to define those PEM encoded certs. Only 1 trust store is currently supported. Structure is [documented below](#nested_x509_trust_store). | true | false | None | None | None |

### trust_store Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `trust_anchors` | List of Trust Anchors to be used while performing validation against a given TrustStore. The incoming end entity's certificate must be chained up to one of the trust anchors here. Structure is [documented below](#nested_x509_trust_store_trust_anchors). | true | false | None | None | None |
| `intermediate_cas` | Set of intermediate CA certificates used for building the trust chain to trust anchor. IMPORTANT: Intermediate CAs are only supported when configuring x509 federation. Structure is [documented below](#nested_x509_trust_store_intermediate_cas). | false | false | None | None | None |

### trust_anchors Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `pem_certificate` | PEM certificate of the PKI used for validation. Must only contain one ca certificate(either root or intermediate cert). | false | false | None | None | None |

### intermediate_cas Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `pem_certificate` | PEM certificate of the PKI used for validation. Must only contain one ca certificate(either root or intermediate cert). | false | false | None | None | None |
