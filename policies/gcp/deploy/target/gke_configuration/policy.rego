package terraform.gcp.security.deploy.target.gke_configuration
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deploy.target.vars

conditions := [
    [
    {"situation_description" : "GKE target doesn't use internal IP",
    "remedies":[ "GKE target must use internal IP for enhanced security"]},
    {
        "condition": "GKE target doesn't use internal IP",
        "attribute_path" : ["gke", 0, "internal_ip"],
        "values" : [true],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details