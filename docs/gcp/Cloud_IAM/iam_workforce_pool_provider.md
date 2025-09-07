## 🛡️ Policy Deployment Engine: `iam_workforce_pool_provider`

This section provides a concise policy evaluation for the `iam_workforce_pool_provider` resource in GCP.

Reference: [Terraform Registry – iam_workforce_pool_provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workforce_pool_provider)

---

## 1. Argument Reference

### `location`
- Description: (Required) The location for the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `workforce_pool_id`
- Description: (Required) The ID to use for the pool, which becomes the final component of the resource name. The IDs must be a globally unique string of 6 to 63 lowercase letters, digits, or hyphens. It must start with a letter, and cannot have a trailing hyphen. The prefix `gcp-` is reserved for use by Google, and may not be specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `provider_id`
- Description: (Required) The ID for the provider, which becomes the final component of the resource name. This value must be 4-32 characters, and may contain the characters [a-z0-9-]. The prefix `gcp-` is reserved for use by Google, and may not be specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) A user-specified display name for the provider. Cannot exceed 32 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A user-specified description of the provider. Cannot exceed 256 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) Whether the provider is disabled. You cannot use a disabled provider to exchange tokens. However, existing tokens still grant access.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `attribute_mapping`
- Description: (Optional) Maps attributes from the authentication credentials issued by an external identity provider to Google Cloud attributes, such as `subject` and `segment`. Each key must be a string specifying the Google Cloud IAM attribute to map to. The following keys are supported:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `attribute_condition`
- Description: (Optional) A [Common Expression Language](https://opensource.google/projects/cel) expression, in plain text, to restrict what otherwise valid authentication credentials issued by the provider should not be accepted. The expression must output a boolean representing whether to allow the federation. The following keywords may be referenced in the expressions:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `saml`
- Description: (Optional) Represents a SAML identity provider. Structure is [documented below](#nested_saml).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oidc`
- Description: (Optional) Represents an OpenId Connect 1.0 identity provider. Structure is [documented below](#nested_oidc).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `extra_attributes_oauth2_client`
- Description: (Optional) The configuration for OAuth 2.0 client used to get the additional user attributes. This should be used when users can't get the desired claims in authentication credentials. Currently this configuration is only supported with SAML and OIDC protocol. Structure is [documented below](#nested_extra_attributes_oauth2_client). <a name="nested_saml"></a>The `saml` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `idp_metadata_xml`
- Description: (Required) SAML Identity provider configuration metadata xml doc. The xml document should comply with [SAML 2.0 specification](https://docs.oasis-open.org/security/saml/v2.0/saml-metadata-2.0-os.pdf). The max size of the acceptable xml document will be bounded to 128k characters. The metadata xml document should satisfy the following constraints: 1) Must contain an Identity Provider Entity ID. 2) Must contain at least one non-expired signing key certificate. 3) For each signing key: a) Valid from should be no more than 7 days from now. b) Valid to should be no more than 10 years in the future. 4) Up to 3 IdP signing keys are allowed in the metadata xml. When updating the provider's metadata xml, at least one non-expired signing key must overlap with the existing metadata. This requirement is skipped if there are no non-expired signing keys present in the existing metadata. <a name="nested_oidc"></a>The `oidc` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `issuer_uri`
- Description: (Required) The OIDC issuer URI. Must be a valid URI using the 'https' scheme.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_id`
- Description: (Required) The client ID. Must match the audience claim of the JWT issued by the identity provider.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_secret`
- Description: (Optional) The optional client secret. Required to enable Authorization Code flow for web sign-in. Structure is [documented below](#nested_oidc_client_secret).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `web_sso_config`
- Description: (Optional) Configuration for web single sign-on for the OIDC provider. Here, web sign-in refers to console sign-in and gcloud sign-in through the browser. Structure is [documented below](#nested_oidc_web_sso_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jwks_json`
- Description: (Optional) OIDC JWKs in JSON String format. For details on definition of a JWK, see https:tools.ietf.org/html/rfc7517. If not set, then we use the `jwks_uri` from the discovery document fetched from the .well-known path for the `issuer_uri`. Currently, RSA and EC asymmetric keys are supported. The JWK must use following format and include only the following fields: ``` { "keys": [ { "kty": "RSA/EC", "alg": "<algorithm>", "use": "sig", "kid": "<key-id>", "n": "", "e": "", "x": "", "y": "", "crv": "" } ] } ``` <a name="nested_oidc_client_secret"></a>The `client_secret` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) The value of the client secret. Structure is [documented below](#nested_oidc_client_secret_value). <a name="nested_oidc_client_secret_value"></a>The `value` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `plain_text`
- Description: (Required) The plain text of the client secret value. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `thumbprint`
- Description: (Output) A thumbprint to represent the current client secret value. <a name="nested_oidc_web_sso_config"></a>The `web_sso_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response_type`
- Description: (Required) The Response Type to request for in the OIDC Authorization Request for web sign-in. The `CODE` Response Type is recommended to avoid the Implicit Flow, for security reasons. * CODE: The `response_type=code` selection uses the Authorization Code Flow for web sign-in. Requires a configured client secret. * ID_TOKEN: The `response_type=id_token` selection uses the Implicit Flow for web sign-in. Possible values are: `CODE`, `ID_TOKEN`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `assertion_claims_behavior`
- Description: (Required) The behavior for how OIDC Claims are included in the `assertion` object used for attribute mapping and attribute condition. * MERGE_USER_INFO_OVER_ID_TOKEN_CLAIMS: Merge the UserInfo Endpoint Claims with ID Token Claims, preferring UserInfo Claim Values for the same Claim Name. This option is available only for the Authorization Code Flow. * ONLY_ID_TOKEN_CLAIMS: Only include ID Token Claims. Possible values are: `MERGE_USER_INFO_OVER_ID_TOKEN_CLAIMS`, `ONLY_ID_TOKEN_CLAIMS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_scopes`
- Description: (Optional) Additional scopes to request for in the OIDC authentication request on top of scopes requested by default. By default, the `openid`, `profile` and `email` scopes that are supported by the identity provider are requested. Each additional scope may be at most 256 characters. A maximum of 10 additional scopes may be configured. <a name="nested_extra_attributes_oauth2_client"></a>The `extra_attributes_oauth2_client` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `issuer_uri`
- Description: (Required) The OIDC identity provider's issuer URI. Must be a valid URI using the `https` scheme. Required to get the OIDC discovery document.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_id`
- Description: (Required) The OAuth 2.0 client ID for retrieving extra attributes from the identity provider. Required to get the Access Token using client credentials grant flow.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_secret`
- Description: (Required) The OAuth 2.0 client secret for retrieving extra attributes from the identity provider. Required to get the Access Token using client credentials grant flow. Structure is [documented below](#nested_extra_attributes_oauth2_client_client_secret).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `attributes_type`
- Description: (Required) Represents the IdP and type of claims that should be fetched. * AZURE_AD_GROUPS_MAIL: Used to get the user's group claims from the Azure AD identity provider using configuration provided in ExtraAttributesOAuth2Client and `mail` property of the `microsoft.graph.group` object is used for claim mapping. See https://learn.microsoft.com/en-us/graph/api/resources/group?view=graph-rest-1.0#properties for more details on `microsoft.graph.group` properties. The attributes obtained from idntity provider are mapped to `assertion.groups`. * AZURE_AD_GROUPS_ID:  Used to get the user's group claims from the Azure AD identity provider using configuration provided in ExtraAttributesOAuth2Client and `id` property of the `microsoft.graph.group` object is used for claim mapping. See https://learn.microsoft.com/en-us/graph/api/resources/group?view=graph-rest-1.0#properties for more details on `microsoft.graph.group` properties. The group IDs obtained from Azure AD are present in `assertion.groups` for OIDC providers and `assertion.attributes.groups` for SAML providers for attribute mapping. Possible values are: `AZURE_AD_GROUPS_MAIL`, `AZURE_AD_GROUPS_ID`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_parameters`
- Description: (Optional) Represents the parameters to control which claims are fetched from an IdP. Structure is [documented below](#nested_extra_attributes_oauth2_client_query_parameters). <a name="nested_extra_attributes_oauth2_client_client_secret"></a>The `client_secret` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) The value of the client secret. Structure is [documented below](#nested_extra_attributes_oauth2_client_client_secret_value). <a name="nested_extra_attributes_oauth2_client_client_secret_value"></a>The `value` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `plain_text`
- Description: (Required) The plain text of the client secret value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `thumbprint`
- Description: (Output) A thumbprint to represent the current client secret value. <a name="nested_extra_attributes_oauth2_client_query_parameters"></a>The `query_parameters` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter`
- Description: (Optional) The filter used to request specific records from IdP. In case of attributes type as AZURE_AD_GROUPS_MAIL and AZURE_AD_GROUPS_ID, it represents the filter used to request specific groups for users from IdP. By default, all of the groups associated with the user are fetched. The groups should be security enabled. See https://learn.microsoft.com/en-us/graph/search-query-parameter for more details.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
