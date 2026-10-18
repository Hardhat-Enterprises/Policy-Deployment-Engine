package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_job_iam_member.member
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_job_iam_member.vars

conditions := [
    [
    {"situation_description" : "Public access should not be allowed",
    "remedies":[ "Change it to members from the approve list"]},
    {
        "condition": "Member allows public access",
        "attribute_path" : ["member"],
        "values" : ["allUsers","allAuthenticatedUsers"], 
        "policy_type" : "blacklist" 
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
