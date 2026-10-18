package terraform.gcp.security.firebase_app_check.google_firebase_app_check_recaptcha_v3_config.site_secret

import data.terraform.helpers
import data.terraform.gcp.security.firebase_app_check.google_firebase_app_check_recaptcha_v3_config.vars

conditions := [
  [
    {"situation_description": "Firebase reCAPTCHA v3 site_secret must be stored in Secret Manager, not left empty or null.",
     "remedies": ["Store the site secret in Secret Manager and reference it as 'projects/<project>/secrets/<secret>'."]},
    {
      "condition": "site_secret is null or empty.",
      "attribute_path": ["site_secret"],
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ]
]

result = helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
