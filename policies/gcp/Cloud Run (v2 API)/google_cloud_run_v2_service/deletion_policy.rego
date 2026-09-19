package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.vars

conditions := [
    [
        {
            "situation_description": "Deletion policy is not set to PREVENT, allowing accidental or unauthorized destruction of the Cloud Run service.",
            "remedies": ["Set deletion_policy to PREVENT to guard against accidental deletion of production services."]
        },
        {
            "condition": "deletion_policy must be PREVENT",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details