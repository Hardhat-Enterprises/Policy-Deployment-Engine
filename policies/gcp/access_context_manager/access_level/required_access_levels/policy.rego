package terraform.gcp.security.access_context_manager.access_level.required_access_levels # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_context_manager.access_level.vars

# Defining the condition for the required access levels
conditions := [
    [
        {
            "situation_description" : "Missing required access level",
            "remedies": [
                "Ensure the required access level is defined correctly."
            ]
        },
        {
            "condition": "Ensure required access levels are correctly set",
            "attribute_path" : ["required_access_levels"], # Path to required_access_levels
            "values" : ["LEVEL_1", "LEVEL_2"], # Example required access levels
            "policy_type" : "whitelist" # Enforcing required access levels
        }
    ]
]

# General policy compliance message
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance summary for debugging
details := helpers.get_multi_summary(conditions, vars.variables).details