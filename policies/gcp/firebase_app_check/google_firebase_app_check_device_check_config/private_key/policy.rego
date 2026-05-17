package terraform.gcp.security.firebase_app_check.google_firebase_app_check_device_check_config.private_key

import data.terraform.helpers
import data.terraform.gcp.security.firebase_app_check.google_firebase_app_check_device_check_config.vars

conditions := [
  [
    {"situation_description": "Firebase DeviceCheck private_key must be stored in Secret Manager, not left empty or null.",
     "remedies": ["Store the private key in Secret Manager and reference it as 'projects/<project>/secrets/<secret>'."]},
    {
      "condition": "private_key is null or empty.",
      "attribute_path": ["private_key"],
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ]
]

result = helpers.get_multi_summary(conditions, vars.variables)
message = result.message
details = result.details
