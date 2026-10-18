package terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_admin_cluster.security_config_authorization_admin_users_username
import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_admin_cluster.vars
 
 conditions := [
 [
    {"situation_description" : "Enforcing secured username",
    "remedies":[ "Change username to authorised admin username"]},
    {
        "condition": "Test if username is secured admin username",
        "attribute_path" : ["security_config", 0, "authorization", 0, "admin_users", 0, "username"],
        "values" : ["*@*", [["admin"], ["hashicorptest.com"]]],
        "policy_type" : "pattern whitelist" 
    }
    ]
 ]

 result := helpers.get_multi_summary(conditions, vars.variables)

 message := result.message

 details := result.details
