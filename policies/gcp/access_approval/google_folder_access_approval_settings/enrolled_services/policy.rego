package terraform.gcp.security.access_approval.google_folder_access_approval_settings.enrolled_services
import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_approval.google_folder_access_approval_settings.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
    {"situation_description" : "Ensure all the access is provided to cloud product",
    "remedies":["Set cloud_product to all"]},
    {
        "condition": "Validating entrolled services",
        "attribute_path" : ["enrolled_services",0,"cloud_product"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["all"], # Values to compare against
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