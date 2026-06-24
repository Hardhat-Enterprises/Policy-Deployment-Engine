package terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_cluster.security_config_authorization_admin_users_username
import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_cluster.vars
 
 conditions := [
    [
    {"situation_description" : "Enforcing username to be secured admin account",
    "remedies":[ "Change username to admin@hashicorptest.com" ],},
    {
        "condition": "Test if the username is admin@hashicorptest.com",
        "attribute_path" : ["security_config", 0, "authorization", 0, "admin_users", 0, "username"],
        "values" : ["admin@hashicorptest.com"],
        "policy_type" : "whitelist" 
    } 

    ]
]

 message := helpers.get_multi_summary(conditions, vars.variables).message

 details := helpers.get_multi_summary(conditions, vars.variables).details
