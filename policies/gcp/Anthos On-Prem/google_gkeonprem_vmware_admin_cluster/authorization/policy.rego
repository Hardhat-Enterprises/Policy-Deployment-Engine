package terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_admin_cluster.authorization
import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_admin_cluster.vars

 conditions := [
 [
    {"situation_description" : "Enforcing username to be a secured gmail.com account",
    "remedies":[ "Change username to a valid gmail.com account." ],},
    {
        "condition": "Test if the username is a secured gmail.com account",
        "attribute_path" : ["authorization", 0, "viewer_users", 0, "username"],
        "values" : ["user1@gmail.com"],
        "policy_type" : "whitelist" 
    }
    
    ],

    [
    {"situation_description" : "Enforcing the required platform version to be 1.31.0",
    "remedies":[ "Change required platform version to 1.31.0." ],},
    {
        "condition": "Test if the required platform version is 1.31.0",
        "attribute_path" : ["platform_config", 0, "required_platform_version"],
        "values" : ["1.31.0"],
        "policy_type" : "whitelist" 
    }
    
    ]

 ]

 message := helpers.get_multi_summary(conditions, vars.variables).message

 details := helpers.get_multi_summary(conditions, vars.variables).details