package terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.spec.force_override
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )

conditions := [
  [
    {
      "situation_description": "Cloud Run domain mapping uses force_override which may override existing mappings",
      "remedies": [
        "Remove force_override unless absolutely necessary",
        "Avoid setting force_override to true to prevent accidental overrides"
      ]
    },
    {
      "condition": "force_override must not be true",
      "attribute_path": ["spec", 0, "force_override"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ]
]

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"
details := helpers.get_multi_summary(conditions, vars.variables).details
