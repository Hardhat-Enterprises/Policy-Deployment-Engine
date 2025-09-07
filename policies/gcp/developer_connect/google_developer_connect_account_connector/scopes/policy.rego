package terraform.gcp.security.developer_connect.google_developer_connect_account_connector.scopes
import data.terraform.gcp.helpers
import data.terraform.gcp.security.developer_connect.google_developer_connect_account_connector.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
    {"situation_description" : "Scopes must be least-privilege",
    "remedies":["Use only the repo scope"]
    },
    {
        "condition": "Forbidden scopes present",
        "attribute_path" : ["provider_oauth_config", 0, "scopes", 0],
        "values" : ["admin:org","delete_repo","*"],
        "policy_type" : "blacklist"
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