package terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_admin_cluster.authorization_viewer_users_username
import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_admin_cluster.vars

 conditions := [
    [
    {"situation_description" : "Enforcing username to be a secured gmail.com account",
    "remedies":[ "Change username to a valid gmail.com account." ],},
    {
        "condition": "Test if the username is a secured gmail.com account",
        "attribute_path" : ["authorization", 0, "viewer_users", 0, "username"],
        "values" : ["*@*", [["user1"], ["gmail.com"]]],
        "policy_type" : "pattern whitelist" 
    }
    
    ]
]

 result := helpers.get_multi_summary(conditions, vars.variables)

 message := result.message

 details := result.details
