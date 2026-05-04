package terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.metadata.annotations
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )

conditions := [
  [
    {
      "situation_description": "Cloud Run domain mapping annotation does not contain a valid security ticket reference",
      "remedies": [
        "Add a valid ticket annotation to the resource",
        "Use the approved ticket format such as SEC-123"
      ]
    },
    {
       "condition": "Ticket annotation must follow the approved security ticket format",
       "attribute_path": ["metadata", 0, "annotations", "ticket"],
       "values": ["SEC-*", [["123", "456", "789"]]],
       "policy_type": "pattern whitelist"
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
