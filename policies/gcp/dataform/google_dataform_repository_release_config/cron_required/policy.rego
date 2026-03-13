package terraform.gcp.security.dataform.google_dataform_repository_release_config.cron_required

import data.terraform.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository_release_config.vars

conditions := [
  [
    {
      "situation_description": "Release config must define a cron_schedule",
      "remedies": [
        "Set cron_schedule to a valid cron expression (e.g., \"0 2 * * *\") in google_dataform_repository_release_config."
      ]
    },
    {
      "condition": "cron_schedule required",
      "attribute_path": ["cron_schedule"],
      "policy_type": "blacklist",
      "values": [null, ""]
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details