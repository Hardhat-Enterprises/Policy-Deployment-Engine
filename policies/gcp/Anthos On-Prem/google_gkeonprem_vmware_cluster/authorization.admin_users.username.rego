package terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_cluster.authorization_admin_users_username
import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_cluster.vars

 conditions := [
    [
    {"situation_description" : "Enforcing username to be the valid format",
    "remedies":[ "Change username to testuser@gmail.com." ],},
    {
        "condition": "Test if the username is the valid format",
        "attribute_path" : ["authorization", 0, "admin_users", 0, "username"],
        "values" : ["testuser@gmail.com"],
        "policy_type" : "whitelist" 
    }

 ]
]

 message := helpers.get_multi_summary(conditions, vars.variables).message

 details := helpers.get_multi_summary(conditions, vars.variables).details
