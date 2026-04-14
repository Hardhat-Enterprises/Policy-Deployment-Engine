package terraform.gcp.security.cloud_storage_for_firebase.google_firebase_storage_bucket.project
import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage_for_firebase.google_firebase_storage_bucket.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
        {
            "situation_description": "Firebase Storage bucket is deployed in an unapproved project",
            "remedies": [
                "Use the approved Google Cloud project number",
                "Avoid placeholder or invalid project identifiers"
            ]
        },
        {
            "condition": "Checks whether project uses the approved project number",
            "attribute_path": ["project"],
            "values": ["83797152308"],
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