## 🛡️ Policy Deployment Engine: `recaptcha_enterprise_key`

This section provides a concise policy evaluation for the `recaptcha_enterprise_key` resource in GCP.

Reference: [Terraform Registry – recaptcha_enterprise_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/recaptcha_enterprise_key)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) Human-readable display name of this key. Modifiable by user. - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `android_settings`
- Description: (Optional) Settings for keys that can be used by Android apps.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ios_settings`
- Description: (Optional) Settings for keys that can be used by iOS apps.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) See [Creating and managing labels](https://cloud.google.com/recaptcha-enterprise/docs/labels). **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: (Optional) The project for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `testing_options`
- Description: (Optional) Options for user acceptance testing.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `waf_settings`
- Description: (Optional) Settings specific to keys that can be used for WAF (Web Application Firewall).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `web_settings`
- Description: (Optional) Settings for keys that can be used by websites.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `android_settings` Block

### `allow_all_package_names`
- Description: (Optional) If set to true, it means allowed_package_names will not be enforced.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_package_names`
- Description: (Optional) Android package names of apps allowed to use the key. Example: 'com.companyname.appname'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `ios_settings` Block

### `allow_all_bundle_ids`
- Description: (Optional) If set to true, it means allowed_bundle_ids will not be enforced.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_bundle_ids`
- Description: (Optional) iOS bundle ids of apps allowed to use the key. Example: 'com.companyname.productname.appname'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `testing_options` Block

### `testing_challenge`
- Description: (Optional) For challenge-based keys only (CHECKBOX, INVISIBLE), all challenge requests for this site will return nocaptcha if NOCAPTCHA, or an unsolvable challenge if UNSOLVABLE_CHALLENGE. Possible values: TESTING_CHALLENGE_UNSPECIFIED, NOCAPTCHA, UNSOLVABLE_CHALLENGE
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `testing_score`
- Description: (Optional) All assessments for this Key will return this score. Must be between 0 (likely not legitimate) and 1 (likely legitimate) inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `waf_settings` Block

### `waf_feature`
- Description: (Required) Supported WAF features. For more information, see https://cloud.google.com/recaptcha-enterprise/docs/usecase#comparison_of_features. Possible values: CHALLENGE_PAGE, SESSION_TOKEN, ACTION_TOKEN, EXPRESS
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `waf_service`
- Description: (Required) The WAF service that uses this key. Possible values: CA, FASTLY
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `web_settings` Block

### `allow_all_domains`
- Description: (Optional) If set to true, it means allowed_domains will not be enforced.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_amp_traffic`
- Description: (Optional) If set to true, the key can be used on AMP (Accelerated Mobile Pages) websites. This is supported only for the SCORE integration type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_domains`
- Description: (Optional) Domains or subdomains of websites allowed to use the key. All subdomains of an allowed domain are automatically allowed. A valid domain requires a host and must not include any path, port, query or fragment. Examples: 'example.com' or 'subdomain.example.com'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `challenge_security_preference`
- Description: (Optional) Settings for the frequency and difficulty at which this key triggers captcha challenges. This should only be specified for IntegrationTypes CHECKBOX and INVISIBLE. Possible values: CHALLENGE_SECURITY_PREFERENCE_UNSPECIFIED, USABILITY, BALANCE, SECURITY
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `integration_type`
- Description: (Required) Required. Describes how this key is integrated with the website. Possible values: SCORE, CHECKBOX, INVISIBLE
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
