package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.invoker_iam_disabled
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.vars

conditions := [
    [
    {"situation_description" : "Cloud Run service disables IAM authentication, making it publicly accessible",
    "remedies":[ "Re-enable IAM authentication by setting invoker_iam_disabled to false"]},
    {
        "condition": "IAM invocation check is disabled",
        "attribute_path" : ["invoker_iam_disabled"],
        "values" : [false],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details