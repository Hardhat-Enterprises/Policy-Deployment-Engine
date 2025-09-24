## 🛡️ Policy Deployment Engine: `recaptcha_enterprise_key`

This section provides a concise policy evaluation for the `recaptcha_enterprise_key` resource in GCP.

Reference: [Terraform Registry – recaptcha_enterprise_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/recaptcha_enterprise_key)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | Human-readable display name of this key. Modifiable by user. - - - | true | false | None | None | None |
| `android_settings` | Settings for keys that can be used by Android apps. | false | false | None | None | None |
| `ios_settings` | Settings for keys that can be used by iOS apps. | false | false | None | None | None |
| `labels` | See [Creating and managing labels](https://cloud.google.com/recaptcha-enterprise/docs/labels). **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `project` | The project for the resource | false | false | None | None | None |
| `testing_options` | Options for user acceptance testing. | false | false | None | None | None |
| `waf_settings` | Settings specific to keys that can be used for WAF (Web Application Firewall). | false | false | None | None | None |
| `web_settings` | Settings for keys that can be used by websites. | false | false | None | None | None |

### android_settings Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `allow_all_package_names` | If set to true, it means allowed_package_names will not be enforced. | false | false | None | None | None |
| `allowed_package_names` | Android package names of apps allowed to use the key. Example: 'com.companyname.appname' | false | false | None | None | None |

### ios_settings Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `allow_all_bundle_ids` | If set to true, it means allowed_bundle_ids will not be enforced. | false | false | None | None | None |
| `allowed_bundle_ids` | iOS bundle ids of apps allowed to use the key. Example: 'com.companyname.productname.appname' | false | false | None | None | None |

### testing_options Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `testing_challenge` | For challenge-based keys only (CHECKBOX, INVISIBLE), all challenge requests for this site will return nocaptcha if NOCAPTCHA, or an unsolvable challenge if UNSOLVABLE_CHALLENGE. Possible values: TESTING_CHALLENGE_UNSPECIFIED, NOCAPTCHA, UNSOLVABLE_CHALLENGE | false | false | None | None | None |
| `testing_score` | All assessments for this Key will return this score. Must be between 0 (likely not legitimate) and 1 (likely legitimate) inclusive. | false | false | None | None | None |

### waf_settings Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `waf_feature` | Supported WAF features. For more information, see https://cloud.google.com/recaptcha-enterprise/docs/usecase#comparison_of_features. Possible values: CHALLENGE_PAGE, SESSION_TOKEN, ACTION_TOKEN, EXPRESS | true | false | None | None | None |
| `waf_service` | The WAF service that uses this key. Possible values: CA, FASTLY | true | false | None | None | None |

### web_settings Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `allow_all_domains` | If set to true, it means allowed_domains will not be enforced. | false | true | Allowing all domains bypasses origin allowlisting and can expose the key to abuse. Restrict usage to trusted domains via allowed_domains. | false | true |
| `allow_amp_traffic` | If set to true, the key can be used on AMP (Accelerated Mobile Pages) websites. This is supported only for the SCORE integration type. | false | true | Enabling AMP broadens key usage surface; only enable when strictly required and only with SCORE integration. | false (or true only when integration_type is SCORE) | true with integration_type not equal to SCORE |
| `allowed_domains` | Domains or subdomains of websites allowed to use the key. All subdomains of an allowed domain are automatically allowed. A valid domain requires a host and must not include any path, port, query or fragment. Examples: 'example.com' or 'subdomain.example.com' | false | false | None | None | None |
| `challenge_security_preference` | Settings for the frequency and difficulty at which this key triggers captcha challenges. This should only be specified for IntegrationTypes CHECKBOX and INVISIBLE. Possible values: CHALLENGE_SECURITY_PREFERENCE_UNSPECIFIED, USABILITY, BALANCE, SECURITY | false | true | This setting directly controls bot resistance. We prefer stronger or balanced challenges over usability-only. | SECURITY or BALANCE | USABILITY or CHALLENGE_SECURITY_PREFERENCE_UNSPECIFIED |
| `integration_type` | Required. Describes how this key is integrated with the website. Possible values: SCORE, CHECKBOX, INVISIBLE | true | true | The integration model must be explicitly set to a supported type to avoid weak or unintended defaults. | SCORE, CHECKBOX, or INVISIBLE (explicitly set) | null, empty, or any unsupported value |
