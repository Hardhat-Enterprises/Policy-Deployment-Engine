package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.binary_authorization_use_default
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.vars

conditions := [
    [
    {"situation_description" : "Binary Authorization is not enabled, allowing unverified container images.",
    "remedies":[ "Enable Binary Authorization using use_default = true"]},
    {
        "condition": "Ensure Binary Authorization is enabled",
        "attribute_path" : ["binary_authorization",0,"use_default"],
        "values" : [true],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
