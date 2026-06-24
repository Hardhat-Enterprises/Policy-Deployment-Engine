package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_worker_pool_iam_member.role
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_worker_pool_iam_member.vars

conditions := [
    [
    {"situation_description": "Only least-privilege Cloud Run roles should be assigned",
     "remedies": ["Change the role to a least-privilege role"]    },
    {
        "condition": "Role is not in the approved",
        "attribute_path": ["role"],
        "values": ["roles/*", [["admin","developer","editor"]]],
        "policy_type": "pattern blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
