package terraform.gcp.security.integration_connectors.google_integration_connectors_connection.port
import data.terraform.gcp.helpers
import data.terraform.gcp.security.integration_connectors.google_integration_connectors_connection.vars
 
 conditions := [
 [
    {"situation_description" : "Enforcing port security",
    "remedies":[ "Change port to 443"]},
    {
        "condition": "Test if a port number is not 433",
        "attribute_path" : ["destination_config","0", "destination","0", "port"],
        "values" : ["443"],
        "policy_type" : "whitelist" 
    }
    ]
 ]

 message := helpers.get_multi_summary(conditions, vars.variables).message

 details := helpers.get_multi_summary(conditions, vars.variables).details
