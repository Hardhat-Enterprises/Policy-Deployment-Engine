package terraform.gcp.security.access_approval.google_folder_access_approval_settings.enrollment_level
import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_approval.google_folder_access_approval_settings.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
    {"situation_description" : "Ensure default value is already assigned to the enrollment level ",
    "remedies":["Set enrollment_level to BLOCK_ALL"]},
    {
        "condition": "Validating enrollment level",
        "attribute_path" : ["enrolled_services",0,"enrollment_level"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["BLOCK_ALL"], # Values to compare against
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