## 🛡️ Policy Deployment Engine: `iap_settings`

This section provides a concise policy evaluation for the `iap_settings` resource in GCP.

Reference: [Terraform Registry – iap_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iap_settings)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The resource name of the IAP protected resource. Name can have below resources: * organizations/{organization_id} * folders/{folder_id} * projects/{project_id} * projects/{project_id}/iap_web * projects/{project_id}/iap_web/compute * projects/{project_id}/iap_web/compute-{region} * projects/{project_id}/iap_web/compute/services/{service_id} * projects/{project_id}/iap_web/compute-{region}/services/{service_id} * projects/{project_id}/iap_web/appengine-{app_id} * projects/{project_id}/iap_web/appengine-{app_id}/services/{service_id} * projects/{project_id}/iap_web/appengine-{app_id}/services/{service_id}/version/{version_id} | true | true | This path defines which surface is protected by the settings. A wrong or malformed name applies settings to the wrong scope. | name = "projects/my-gcp-project/iap_web"  or  "projects/my-gcp-project/iap_web/appengine-myapp/services/default" | name = "projects/my-gcp-project" (missing iap_web segment)  or  "projects/my-gcp-project/iap_web/compute/services/" (empty service_id) |
| `access_settings` | Top level wrapper for all access related setting in IAP. Structure is [documented below](#nested_access_settings). | false | false | None | None | None |
| `application_settings` | Top level wrapper for all application related settings in IAP. Structure is [documented below](#nested_application_settings). | false | false | None | None | None |
| `gcip_settings` |  | false | false | None | None | None |
| `cors_settings` |  | false | false | None | None | None |
| `oauth_settings` |  | false | false | None | None | None |
| `reauth_settings` |  | false | false | None | None | None |
| `allowed_domains_settings` |  | false | false | None | None | None |
| `workforce_identity_settings` |  | false | false | None | None | None |
| `oauth2` |  | false | false | None | None | None |
| `csm_settings` |  | false | false | None | None | None |
| `access_denied_page_settings` |  | false | false | None | None | None |
| `attribute_propagation_settings` |  | false | false | None | None | None |

### access_settings Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `gcip_settings` | GCIP claims and endpoint configurations for 3p identity providers. * Enabling gcipSetting significantly changes the way IAP authenticates users. Identity Platform does not support IAM, so IAP will not enforce any IAM policies for requests to your application. Structure is [documented below](#nested_access_settings_gcip_settings). | false | false | None | None | None |
| `cors_settings` | Configuration to allow cross-origin requests via IAP. Structure is [documented below](#nested_access_settings_cors_settings). | false | false | None | None | None |
| `oauth_settings` | Settings to configure IAP's OAuth behavior. Structure is [documented below](#nested_access_settings_oauth_settings). | false | false | None | None | None |
| `reauth_settings` | Settings to configure reauthentication policies in IAP. Structure is [documented below](#nested_access_settings_reauth_settings). | false | false | None | None | None |
| `allowed_domains_settings` | Settings to configure and enable allowed domains. Structure is [documented below](#nested_access_settings_allowed_domains_settings). | false | false | None | None | None |
| `workforce_identity_settings` | Settings to configure the workforce identity federation, including workforce pools and OAuth 2.0 settings. Structure is [documented below](#nested_access_settings_workforce_identity_settings). | false | false | None | None | None |
| `identity_sources` | Identity sources that IAP can use to authenticate the end user. Only one identity source can be configured. The possible values are: * `WORKFORCE_IDENTITY_FEDERATION`: Use external identities set up on Google Cloud Workforce Identity Federation. Each value may be one of: `WORKFORCE_IDENTITY_FEDERATION`. | false | false | None | None | None |

###   allowed_domains_settings Block
  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `domains` | List of trusted domains. | false | true | Restrict sign-in to the corporate domain only. | domains = ["example.com"] | domains = ["*"], ["gmail.com"], ["yahoo.com"] |
  | `enable` | Configuration for customers to opt in for the feature. | false | true | Allowed Domains must be enabled to take effect. | enable = true | enable = false |

### application_settings Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `csm_settings` | Settings to configure IAP's behavior for a service mesh. Structure is [documented below](#nested_application_settings_csm_settings). | false | false | None | None | None |
| `access_denied_page_settings` | Customization for Access Denied page. IAP allows customers to define a custom URI to use as the error page when access is denied to users. If IAP prevents access to this page, the default IAP error page will be displayed instead. Structure is [documented below](#nested_application_settings_access_denied_page_settings). | false | false | None | None | None |
| `cookie_domain` | The Domain value to set for cookies generated by IAP. This value is not validated by the API, but will be ignored at runtime if invalid. | false | true | Scope IAP cookies to the corporate parent domain. | cookie_domain = "example.com" | cookie_domain = "gmail.com" / "vendor.io" / "example.com " (trailing space) |
| `attribute_propagation_settings` | Settings to configure attribute propagation. Structure is [documented below](#nested_application_settings_attribute_propagation_settings). | false | false | None | None | None |

### gcip_settings Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `tenant_ids` | GCIP tenant ids that are linked to the IAP resource. tenantIds could be a string beginning with a number character to indicate authenticating with GCIP tenant flow, or in the format of _ to indicate authenticating with GCIP agent flow. If agent flow is used, tenantIds should only contain one single element, while for tenant flow, tenantIds can contain multiple elements. | false | false | None | None | None |
| `login_page_uri` | Login page URI associated with the GCIP tenants. Typically, all resources within the same project share the same login page, though it could be overridden at the sub resource level. | false | false | None | None | None |

### cors_settings Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `allow_http_options` | Configuration to allow HTTP OPTIONS calls to skip authorization. If undefined, IAP will not apply any special logic to OPTIONS requests. | false | false | None | None | None |

### oauth_settings Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `login_hint` | Domain hint to send as hd=? parameter in OAuth request flow. Enables redirect to primary IDP by skipping Google's login screen. (https://developers.google.com/identity/protocols/OpenIDConnect#hd-param) Note: IAP does not verify that the id token's hd claim matches this value since access behavior is managed by IAM policies. * loginHint setting is not a replacement for access control. Always enforce an appropriate access policy if you want to restrict access to users outside your domain. | false | false | None | None | None |
| `programmatic_clients` | List of client ids allowed to use IAP programmatically. | false | false | None | None | None |

### reauth_settings Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `method` | Reauth method requested. The possible values are: * `LOGIN`: Prompts the user to log in again. * `SECURE_KEY`: User must use their secure key 2nd factor device. * `ENROLLED_SECOND_FACTORS`: User can use any enabled 2nd factor. Possible values are: `LOGIN`, `SECURE_KEY`, `ENROLLED_SECOND_FACTORS`. | true | false | None | None | None |
| `max_age` | Reauth session lifetime, how long before a user has to reauthenticate again. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". | true | false | None | None | None |
| `policy_type` | How IAP determines the effective policy in cases of hierarchical policies. Policies are merged from higher in the hierarchy to lower in the hierarchy. The possible values are: * `MINIMUM`: This policy acts as a minimum to other policies, lower in the hierarchy. Effective policy may only be the same or stricter. * `DEFAULT`: This policy acts as a default if no other reauth policy is set. Possible values are: `MINIMUM`, `DEFAULT`. | true | false | None | None | None |

### allowed_domains_settings Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `domains` | List of trusted domains. | false | true | Restrict sign-in to the corporate domain only. | domains = ["example.com"] | domains = ["*"], ["gmail.com"], ["yahoo.com"] |
| `enable` | Configuration for customers to opt in for the feature. | false | true | Allowed Domains must be enabled to take effect. | enable = true | enable = false |

### workforce_identity_settings Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `workforce_pools` | The workforce pool resources. Only one workforce pool is accepted. | false | false | None | None | None |
| `oauth2` | OAuth 2.0 settings for IAP to perform OIDC flow with workforce identity federation services. Structure is [documented below](#nested_access_settings_workforce_identity_settings_oauth2). | false | false | None | None | None |

### oauth2 Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `client_id` | The OAuth 2.0 client ID registered in the workforce identity federation OAuth 2.0 Server. | false | false | None | None | None |
| `client_secret` | Input only. The OAuth 2.0 client secret created while registering the client ID. **Note**: This property is sensitive and will not be displayed in the plan. | false | false | None | None | None |
| `client_secret_sha256` | (Output) Output only. SHA256 hash value for the client secret. This field is returned by IAP when the settings are retrieved. | false | false | None | None | None |

### csm_settings Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `rctoken_aud` | Audience claim set in the generated RCToken. This value is not validated by IAP. | false | false | None | None | None |

### access_denied_page_settings Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `access_denied_page_uri` | The URI to be redirected to when access is denied. | false | false | None | None | None |
| `generate_troubleshooting_uri` | Whether to generate a troubleshooting URL on access denied events to this application. | false | false | None | None | None |
| `remediation_token_generation_enabled` | Whether to generate remediation token on access denied events to this application. | false | false | None | None | None |

### attribute_propagation_settings Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `output_credentials` | Which output credentials attributes selected by the CEL expression should be propagated in. All attributes will be fully duplicated in each selected output credential. Possible values are: * `HEADER`: Propagate attributes in the headers with "x-goog-iap-attr-" prefix. * `JWT`: Propagate attributes in the JWT of the form: "additional_claims": { "my_attribute": ["value1", "value2"] } * `RCTOKEN`: Propagate attributes in the RCToken of the form: " additional_claims": { "my_attribute": ["value1", "value2"] } Each value may be one of: `HEADER`, `JWT`, `RCTOKEN`. | false | false | None | None | None |
| `expression` | Raw string CEL expression. Must return a list of attributes. A maximum of 45 attributes can be selected. Expressions can select different attribute types from attributes: attributes.saml_attributes, attributes.iap_attributes. | false | false | None | None | None |
| `enable` | Whether the provided attribute propagation settings should be evaluated on user requests. If set to true, attributes returned from the expression will be propagated in the set output credentials. | false | false | None | None | None |
