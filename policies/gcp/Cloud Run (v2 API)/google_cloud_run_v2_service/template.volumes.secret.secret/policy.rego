package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.template_volumes_secret_secret
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.vars

conditions := [
    [
    {
        "situation_description": "Only approved Secret Manager secrets should be mounted as volumes",
        "remedies": ["Use secrets only from approved projects"]
    },
    {
        "condition": "Secret used in volume is not from approved list",
        "attribute_path": ["template",0,"volumes",0,"secret",0,"secret"],
        "values": ["projects/*/secrets/*", [["my-project"],["api-key"]]],
        "policy_type": "pattern whitelist"
    }
    ]

]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
