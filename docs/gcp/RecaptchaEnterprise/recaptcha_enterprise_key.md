## 🛡️ Policy Deployment Engine: `recaptcha_enterprise_key`

This section provides a concise policy evaluation for the `recaptcha_enterprise_key` resource in GCP.

Reference: [Terraform Registry – recaptcha_enterprise_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/recaptcha_enterprise_key)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | Human-readable display name of this key. Modifiable by user. - - - | true | None | None |
| `labels` | See [Creating and managing labels](https://cloud.google.com/recaptcha-enterprise/docs/labels). **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | The project for the resource | false | None | None |

### android_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `allow_all_package_names` | If set to true, it means allowed_package_names will not be enforced. | false | None | None |
| `allowed_package_names` | Android package names of apps allowed to use the key. Example: 'com.companyname.appname' | false | None | None |

### ios_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `allow_all_bundle_ids` | If set to true, it means allowed_bundle_ids will not be enforced. | false | None | None |
| `allowed_bundle_ids` | iOS bundle ids of apps allowed to use the key. Example: 'com.companyname.productname.appname' | false | None | None |

### testing_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `testing_challenge` | For challenge-based keys only (CHECKBOX, INVISIBLE), all challenge requests for this site will return nocaptcha if NOCAPTCHA, or an unsolvable challenge if UNSOLVABLE_CHALLENGE. Possible values: TESTING_CHALLENGE_UNSPECIFIED, NOCAPTCHA, UNSOLVABLE_CHALLENGE | false | None | None |
| `testing_score` | All assessments for this Key will return this score. Must be between 0 (likely not legitimate) and 1 (likely legitimate) inclusive. | false | None | None |

### waf_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `waf_feature` | Supported WAF features. For more information, see https://cloud.google.com/recaptcha-enterprise/docs/usecase#comparison_of_features. Possible values: CHALLENGE_PAGE, SESSION_TOKEN, ACTION_TOKEN, EXPRESS | true | None | None |
| `waf_service` | The WAF service that uses this key. Possible values: CA, FASTLY | true | None | None |

### web_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `allow_all_domains` | If set to true, it means allowed_domains will not be enforced. | false | None | None |
| `allow_amp_traffic` | If set to true, the key can be used on AMP (Accelerated Mobile Pages) websites. This is supported only for the SCORE integration type. | false | None | None |
| `allowed_domains` | Domains or subdomains of websites allowed to use the key. All subdomains of an allowed domain are automatically allowed. A valid domain requires a host and must not include any path, port, query or fragment. Examples: 'example.com' or 'subdomain.example.com' | false | None | None |
| `challenge_security_preference` | Settings for the frequency and difficulty at which this key triggers captcha challenges. This should only be specified for IntegrationTypes CHECKBOX and INVISIBLE. Possible values: CHALLENGE_SECURITY_PREFERENCE_UNSPECIFIED, USABILITY, BALANCE, SECURITY | false | None | None |
| `integration_type` | Required. Describes how this key is integrated with the website. Possible values: SCORE, CHECKBOX, INVISIBLE | true | None | None |
