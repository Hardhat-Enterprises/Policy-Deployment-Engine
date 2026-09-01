package terraform.gcp.security.apikeys.google_apikeys_key.restrictions_api_targets_methods

import data.terraform.helpers
import data.terraform.gcp.security.apikeys.google_apikeys_key.vars

conditions := [
    [
    {
        "situation_description" : "API key allows all methods (*) for a target service.",
        "remedies":[
            "Specify only the required methods in api_targets.methods instead of using a wildcard."
        ]
    },
    {
        "condition": "Check that api_targets.methods does not contain a wildcard.",
        # restrictions[0].api_targets[0].methods
        "attribute_path" : ["restrictions", 0, "api_targets", 0, "methods"],
        "values" : ["*"],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
