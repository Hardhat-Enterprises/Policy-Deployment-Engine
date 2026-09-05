package terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_admin_cluster.location
import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_admin_cluster.vars
 
 conditions := [
 [
    {"situation_description" : "Enforcing location security",
    "remedies":[ "Change location to approved region"]},
    {
        "condition": "Test if a location is australia-southeast1",
        "attribute_path" : ["location"],
        "values" : ["australia-southeast1", "australia-southeast2"],
        "policy_type" : "whitelist"
    }
    ]
 ]

 result := helpers.get_multi_summary(conditions, vars.variables)

 message := result.message

 details := result.details