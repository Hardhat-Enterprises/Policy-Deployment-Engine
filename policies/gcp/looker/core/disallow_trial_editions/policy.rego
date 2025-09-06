package terraform.gcp.security.looker.core.disallow_trial_editions
import data.terraform.gcp.helpers
import data.terraform.gcp.security.looker.core.vars

conditions := [
  [
    {
      "situation_description": "Trial editions are not allowed in production environments",
      "remedies": [
        "Use production platform edition instead of trial",
        "Set platform_edition to LOOKER_CORE_STANDARD_ANNUAL or similar production SKU",
        "Avoid LOOKER_CORE_TRIAL* or TRIAL_* values"
      ]
    },
    {
      "condition": "Disallow trial editions (blacklist: platformEdition must not be trial SKUs)",
      "attribute_path": ["platform_edition"],
      "values": ["LOOKER_CORE_TRIAL", "TRIAL_ANNUAL", "TRIAL_MONTHLY"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
