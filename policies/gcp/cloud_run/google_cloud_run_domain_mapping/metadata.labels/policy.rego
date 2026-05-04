package terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.metadata.labels
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )

conditions := [
  [
    {
      "situation_description": "Cloud Run domain mapping is missing required environment label or uses an invalid value",
      "remedies": [
        "Add a label 'env' to the resource",
        "Use one of the approved values: prod, dev, test"
      ]
    },
    {
      "condition": "Environment label must be one of the approved values",
      "attribute_path": ["metadata", 0, "labels", "env"],
      "values": ["prod", "dev", "test"],
      "policy_type": "whitelist"
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
