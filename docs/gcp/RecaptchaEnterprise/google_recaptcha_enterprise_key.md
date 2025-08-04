## 🛡️ Policy Deployment Engine: `google_recaptcha_enterprise_key`

This section provides a concise policy evaluation for the `google_recaptcha_enterprise_key` resource in GCP, focused on argument references and whether each requires a policy condition.

Reference: [Terraform Registry – google_recaptcha_enterprise_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/recaptcha_enterprise_key#argument-reference)

---

### Policy Condition Key

- ✅ = Required due to security concern
- ❌ = Not required; no direct security concern
- 🟡 = Required but handled via **global policy rules**

---

## 1. Argument Reference and Policy Conditions

| **Argument**         | **Required** | **Description**                                 | **Policy Condition?** | **Decision / Rationale**                                      |
|----------------------|--------------|-------------------------------------------------|------------------------|----------------------------------------------------------------|
| `display_name`       | ✅           | Human-readable display name of this key.        | 🟡                     | Naming is enforced via a global policies.                   |
| `android_settings`   | ❌           | Settings for keys used by Android apps.         | ✅                     | Must restrict blanket allow settings and enforce whitelisting. |
| `ios_settings`       | ❌           | Settings for keys used by iOS apps.             | ✅                     | Whitelisting required for app identification.                  |
| `labels`             | ❌           | Key-value labels.                               | ❌                     | Useful for org practices but not security-related.             |
| `project`            | ❌           | Associated GCP project.                         | ❌                     | IAM and project control should be handled elsewhere.           |
| `testing_options`    | ❌           | Options for UAT/testing scenarios.              | ❌                     | Intended for non-prod; no policy required.                     |
| `waf_settings`       | ❌           | WAF configuration details.                      | ✅                     | Enforce minimum WAF configuration in production.               |
| `web_settings`       | ❌           | Settings for website usage.                     | ✅                     | Important to restrict domain access and enforce challenge level.|

---

### `android_settings` Block

| Argument                   | Description                         | Policy Condition? | Decision                                      |
|----------------------------|-------------------------------------|-------------------|-----------------------------------------------|
| `allow_all_package_names` | Allow all apps if true.             | ✅                | Should be false in secure environments.       |
| `allowed_package_names`   | Whitelisted Android apps.           | ✅                | Must match known/approved app packages.       |

---

### `ios_settings` Block

| Argument                 | Description                         | Policy Condition? | Decision                                      |
|--------------------------|-------------------------------------|-------------------|-----------------------------------------------|
| `allow_all_bundle_ids`  | Allow all iOS apps if true.         | ✅                | Should be false to ensure app identity.       |
| `allowed_bundle_ids`    | Whitelisted iOS app bundle IDs.     | ✅                | Must match pre-approved apps.                 |

---

### `testing_options` Block

| Argument           | Description                    | Policy Condition? | Decision                              |
|--------------------|--------------------------------|-------------------|---------------------------------------|
| `testing_challenge`| Simulated challenge mode.      | ❌                | Testing only; policy not required.   |
| `testing_score`    | Simulated trust score.         | ❌                | No impact on production behavior.    |

---

### `waf_settings` Block

| Argument       | Description                       | Policy Condition? | Decision                                           |
|----------------|-----------------------------------|-------------------|----------------------------------------------------|
| `waf_feature`  | WAF feature in use.               | ✅                | Should align with baseline security expectations.  |
| `waf_service`  | Provider using this key.          | ✅                | Limit to approved third-party WAFs (e.g. CA).      |

---

### `web_settings` Block

| Argument                        | Description                                   | Policy Condition? | Decision                                                |
|---------------------------------|-----------------------------------------------|-------------------|---------------------------------------------------------|
| `allow_all_domains`            | Allow all domains if true.                   | ✅                | Must be restricted unless explicitly required.          |
| `allow_amp_traffic`           | Enable AMP support.                          | ❌                | Low-risk feature; no blanket policy.                    |
| `allowed_domains`              | Whitelisted domains.                         | ✅                | Must be verified and pre-approved.                      |
| `challenge_security_preference`| Captcha challenge level.                     | ✅                | Should be based on business risk tolerance.             |
| `integration_type`             | Integration mode (e.g., SCORE, CHECKBOX).    | ✅                | Enforce only supported types in production.             |
