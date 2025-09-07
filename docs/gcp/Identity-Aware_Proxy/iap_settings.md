## 🛡️ Policy Deployment Engine: `iap_settings`

This section provides a concise policy evaluation for the `iap_settings` resource in GCP.

Reference: [Terraform Registry – iap_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iap_settings)

---

## 1. Argument Reference

### `name`
- Description: (Required) The resource name of the IAP protected resource. Name can have below resources: * organizations/{organization_id} * folders/{folder_id} * projects/{project_id} * projects/{project_id}/iap_web * projects/{project_id}/iap_web/compute * projects/{project_id}/iap_web/compute-{region} * projects/{project_id}/iap_web/compute/services/{service_id} * projects/{project_id}/iap_web/compute-{region}/services/{service_id} * projects/{project_id}/iap_web/appengine-{app_id} * projects/{project_id}/iap_web/appengine-{app_id}/services/{service_id} * projects/{project_id}/iap_web/appengine-{app_id}/services/{service_id}/version/{version_id}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_settings`
- Description: (Optional) Top level wrapper for all access related setting in IAP. Structure is [documented below](#nested_access_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `application_settings`
- Description: (Optional) Top level wrapper for all application related settings in IAP. Structure is [documented below](#nested_application_settings). <a name="nested_access_settings"></a>The `access_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcip_settings`
- Description: (Optional) GCIP claims and endpoint configurations for 3p identity providers. * Enabling gcipSetting significantly changes the way IAP authenticates users. Identity Platform does not support IAM, so IAP will not enforce any IAM policies for requests to your application. Structure is [documented below](#nested_access_settings_gcip_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cors_settings`
- Description: (Optional) Configuration to allow cross-origin requests via IAP. Structure is [documented below](#nested_access_settings_cors_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth_settings`
- Description: (Optional) Settings to configure IAP's OAuth behavior. Structure is [documented below](#nested_access_settings_oauth_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reauth_settings`
- Description: (Optional) Settings to configure reauthentication policies in IAP. Structure is [documented below](#nested_access_settings_reauth_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_domains_settings`
- Description: (Optional) Settings to configure and enable allowed domains. Structure is [documented below](#nested_access_settings_allowed_domains_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `workforce_identity_settings`
- Description: (Optional) Settings to configure the workforce identity federation, including workforce pools and OAuth 2.0 settings. Structure is [documented below](#nested_access_settings_workforce_identity_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `identity_sources`
- Description: (Optional) Identity sources that IAP can use to authenticate the end user. Only one identity source can be configured. The possible values are:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tenant_ids`
- Description: (Optional) GCIP tenant ids that are linked to the IAP resource. tenantIds could be a string beginning with a number character to indicate authenticating with GCIP tenant flow, or in the format of _ to indicate authenticating with GCIP agent flow. If agent flow is used, tenantIds should only contain one single element, while for tenant flow, tenantIds can contain multiple elements.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `login_page_uri`
- Description: (Optional) Login page URI associated with the GCIP tenants. Typically, all resources within the same project share the same login page, though it could be overridden at the sub resource level. <a name="nested_access_settings_cors_settings"></a>The `cors_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_http_options`
- Description: (Optional) Configuration to allow HTTP OPTIONS calls to skip authorization. If undefined, IAP will not apply any special logic to OPTIONS requests. <a name="nested_access_settings_oauth_settings"></a>The `oauth_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `login_hint`
- Description: (Optional) Domain hint to send as hd=? parameter in OAuth request flow. Enables redirect to primary IDP by skipping Google's login screen. (https://developers.google.com/identity/protocols/OpenIDConnect#hd-param) Note: IAP does not verify that the id token's hd claim matches this value since access behavior is managed by IAM policies. * loginHint setting is not a replacement for access control. Always enforce an appropriate access policy if you want to restrict access to users outside your domain.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `programmatic_clients`
- Description: (Optional) List of client ids allowed to use IAP programmatically. <a name="nested_access_settings_reauth_settings"></a>The `reauth_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `method`
- Description: (Required) Reauth method requested. The possible values are:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_age`
- Description: (Required) Reauth session lifetime, how long before a user has to reauthenticate again. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_type`
- Description: (Required) How IAP determines the effective policy in cases of hierarchical policies. Policies are merged from higher in the hierarchy to lower in the hierarchy. The possible values are:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `domains`
- Description: (Optional) List of trusted domains.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable`
- Description: (Optional) Configuration for customers to opt in for the feature. <a name="nested_access_settings_workforce_identity_settings"></a>The `workforce_identity_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `workforce_pools`
- Description: (Optional) The workforce pool resources. Only one workforce pool is accepted.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth2`
- Description: (Optional) OAuth 2.0 settings for IAP to perform OIDC flow with workforce identity federation services. Structure is [documented below](#nested_access_settings_workforce_identity_settings_oauth2). <a name="nested_access_settings_workforce_identity_settings_oauth2"></a>The `oauth2` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_id`
- Description: (Optional) The OAuth 2.0 client ID registered in the workforce identity federation OAuth 2.0 Server.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_secret`
- Description: (Optional) Input only. The OAuth 2.0 client secret created while registering the client ID. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_secret_sha256`
- Description: (Output) Output only. SHA256 hash value for the client secret. This field is returned by IAP when the settings are retrieved. <a name="nested_application_settings"></a>The `application_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `csm_settings`
- Description: (Optional) Settings to configure IAP's behavior for a service mesh. Structure is [documented below](#nested_application_settings_csm_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_denied_page_settings`
- Description: (Optional) Customization for Access Denied page. IAP allows customers to define a custom URI to use as the error page when access is denied to users. If IAP prevents access to this page, the default IAP error page will be displayed instead. Structure is [documented below](#nested_application_settings_access_denied_page_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cookie_domain`
- Description: (Optional) The Domain value to set for cookies generated by IAP. This value is not validated by the API, but will be ignored at runtime if invalid.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `attribute_propagation_settings`
- Description: (Optional) Settings to configure attribute propagation. Structure is [documented below](#nested_application_settings_attribute_propagation_settings). <a name="nested_application_settings_csm_settings"></a>The `csm_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rctoken_aud`
- Description: (Optional) Audience claim set in the generated RCToken. This value is not validated by IAP. <a name="nested_application_settings_access_denied_page_settings"></a>The `access_denied_page_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_denied_page_uri`
- Description: (Optional) The URI to be redirected to when access is denied.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `generate_troubleshooting_uri`
- Description: (Optional) Whether to generate a troubleshooting URL on access denied events to this application.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `remediation_token_generation_enabled`
- Description: (Optional) Whether to generate remediation token on access denied events to this application. <a name="nested_application_settings_attribute_propagation_settings"></a>The `attribute_propagation_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `output_credentials`
- Description: (Optional) Which output credentials attributes selected by the CEL expression should be propagated in. All attributes will be fully duplicated in each selected output credential. Possible values are:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expression`
- Description: (Optional) Raw string CEL expression. Must return a list of attributes. A maximum of 45 attributes can be selected. Expressions can select different attribute types from attributes: attributes.saml_attributes, attributes.iap_attributes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable`
- Description: (Optional) Whether the provided attribute propagation settings should be evaluated on user requests. If set to true, attributes returned from the expression will be propagated in the set output credentials.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
