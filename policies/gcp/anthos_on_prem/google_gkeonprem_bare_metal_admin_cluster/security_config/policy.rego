package terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_admin_cluster.security_config
import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_admin_cluster.vars
 
 conditions := [
 [
    {"situation_description" : "Enforcing secured username",
    "remedies":[ "Change username to authorised admin username"]},
    {
        "condition": "Test if a location is us-west1",
        "attribute_path" : ["security_config","authorization","admin_users","username"],
        "values" : ["admin@hashicorptest.com"],
        "policy_type" : "whitelist" 
    }
    ]
 ]

 message := helpers.get_multi_summary(conditions, vars.variables).message

 details := helpers.get_multi_summary(conditions, vars.variables).details