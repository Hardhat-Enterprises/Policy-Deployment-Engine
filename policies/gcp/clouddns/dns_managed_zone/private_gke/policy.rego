package terraform.gcp.security.clouddns.dns_managed_zone.private_gke 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.clouddns.dns_managed_zone.vars


conditions := [
    [
    {"situation_description" : "gke cluster name",
    "remedies":[ "describes gke cluster name"]},
    {
        "condition": "whitelist for private gke cluster name",
        "attribute_path" : ["private_visibility_config", 0, "gke_cluster_name"], 
        "values" : ["google_container_cluster.pde.id"], 
        "policy_type" : "whitelist" 
    }
    ]
]
   
message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details