package terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_admin_cluster.location
import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_admin_cluster.vars
 
 conditions := [
 [
    {"situation_description" : "Enforcing location security",
    "remedies":[ "Change location to approved region"]},
    {
        "condition": "Test if a location is australia_southeast1",
        "attribute_path" : ["location"],
        "values" : ["australia_southeast1", "australia_southeast2"],
        "policy_type" : "whitelist" 
    }
    ],

    [
    {"situation_description" : "Enforcing bare metal version to be latest",
    "remedies":[ "Change bare metal version to latest"]},
    {
        "condition": "Test if bare metal version is 1.13.4",
        "attribute_path" : ["bare_metal_version"],
        "values" : ["1.13.4"],
        "policy_type" : "whitelist" 
    }
    ]

 ]

 message := helpers.get_multi_summary(conditions, vars.variables).message

 details := helpers.get_multi_summary(conditions, vars.variables).details