package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_job_iam_member.location
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_job_iam_member.vars

conditions := [
    [
        {
            "situation_description": "Location must be in an Australian location",
            "remedies": ["Change the location to an Australian region"]
        },
        {
            "condition": "Region is not in Australia",
            "attribute_path": ["location"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
