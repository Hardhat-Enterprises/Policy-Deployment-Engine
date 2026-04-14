package terraform.gcp.security.cloud_storage_for_firebase.google_firebase_storage_bucket.bucket_id
import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage_for_firebase.google_firebase_storage_bucket.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
        {
            "situation_description": "Firebase Storage bucket is using a disallowed bucket identifier",
            "remedies": [
                "Use an approved Firebase Storage bucket name",
                "Avoid test or placeholder bucket identifiers"
            ]
        },
        {
            "condition": "Checks whether bucket_id is a disallowed value",
            "attribute_path": ["bucket_id"],
            "values": ["test_bucket_nc"],
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