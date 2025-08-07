package terraform.gcp.security.access_approval.google_project_access_approval_settings.project_id
import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_approval.google_project_access_approval_settings.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
    {"situation_description" : "Ensure project id provided",
    "remedies":["Set project_id to PDE"]},
    {
        "condition": "Validating project id",
        "attribute_path" : ["project_id"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["PDE"], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
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