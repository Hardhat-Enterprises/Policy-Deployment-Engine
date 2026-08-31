package terraform.gcp.security.api_hub.google_apihub_api_hub_instance.config_cmek_key_name

import data.terraform.helpers
import data.terraform.gcp.security.api_hub.google_apihub_api_hub_instance.vars

# policy_lint reports hard-coded-value on the value below, and the finding stands.
# A pattern whitelist only judges values that MATCH its target: one that does not
# match the shape is never flagged at all. This argument's non-compliant example
# is "NULL" and "my_key_random_key", so converting would make the fixture pass for the wrong
# reason. Either _helpers needs a pattern whitelist that fails a non-matching
# value, or the fixture needs a wrongly-scoped (not malformed) example.
conditions := [
    [
    {"situation_description" : "Resource cmek_key_name is not compliant.",
    "remedies":[ "Set cmek_key_name to org-approved key"]},
    {
        "condition": "Check if key name is allowed",
        "attribute_path" : ["config",0,"cmek_key_name"], 
        "values" : ["projects/PDE/locations/us-central1/keyRings/apihub/cryptoKeys/apihub-key"], 
        "policy_type" : "whitelist" 
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message


details := summary.details
