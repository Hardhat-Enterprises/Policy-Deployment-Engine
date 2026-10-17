package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.template_vpc_access_egress
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.vars

conditions := [
    [
    {"situation_description" : "All traffic egress is allowed",
    "remedies":[ "Restrict egress to PRIVATE_RANGES_ONLY"]},
    {
        "condition": "Egress should not allow all traffic",
        "attribute_path" : ["template",0,"vpc_access",0,"egress"],
        "values" : ["ALL_TRAFFIC"],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
