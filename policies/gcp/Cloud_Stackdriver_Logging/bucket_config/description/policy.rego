package terraform.gcp.security.Cloud_Stackdriver_Logging.bucket_config.description

import data.terraform.gcp.helpers
import data.terraform.gcp.security.logging.vars

conditions := [
     # billing_account_bucket_config 
    # Logging bucket description requirement
   # In your bucket_config.rego, update the blacklist condition:
[
    {
        "situation_description": "Logging bucket missing description.",
        "remedies": ["Add a descriptive description to all logging buckets for better audit trail"]
    },
    {
        "condition": "Bucket should have a description",
        "attribute_path": ["description"],
        "values": ["", null],  # Catch both empty string and null
        "policy_type": "blacklist"
    }
]

]

# ------------------------------------------------------------
# Compliance messages
# ------------------------------------------------------------
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

# Add this summary rule
summary := {
    "message": message,
    "details": details
}