package terraform.gcp.security.developer_connect.google_developer_connect_account_connector.account_connector_id
import data.terraform.gcp.helpers
import data.terraform.gcp.security.developer_connect.google_developer_connect_account_connector.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
    {"situation_description" : "Account connector ID must be ac-<env>",
    "remedies":["Rename like: ac-dev / ac-stg / ac-prod"]
    },
    {
        "condition": "Name not in approved format or env",
        "attribute_path" : ["account_connector_id"],
        "values" : ["ac-*", [["dev","stg","prod"]]],
        "policy_type" : "pattern whitelist"
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