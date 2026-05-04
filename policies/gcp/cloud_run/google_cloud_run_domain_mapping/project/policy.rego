package terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.project
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )

conditions := [
  [
    {
      "situation_description": "Cloud Run domain mapping is deployed in an unapproved GCP project",
      "remedies": [
        "Use an approved GCP project",
        "Update the project field to the correct project ID"
      ]
    },
    {
      "condition": "Project must be an approved GCP project",
      "attribute_path": ["project"],
      "values": ["my-gcp-project"],
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
