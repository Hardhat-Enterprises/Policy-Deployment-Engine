package terraform.gcp.security.Storage_Transfer_Service.google_storage_transfer_job.role_arn

import data.terraform.helpers
import data.terraform.gcp.security.Storage_Transfer_Service.google_storage_transfer_job.vars

conditions := [
    [
        {
            "situation_description": "Storage Transfer job uses an unapproved AWS IAM role ARN.",
            "remedies": [
                "Use an approved AWS IAM role ARN for Storage Transfer jobs.",
                "Use a dedicated approved IAM role instead of an unapproved role."
            ]
        },
        {
            "condition": "Storage Transfer job must use an approved AWS IAM role ARN.",
            "attribute_path": ["transfer_spec", 0, "aws_s3_data_source", 0, "role_arn"],
            "values": ["arn:aws:iam::123456789012:role/approved-storage-transfer-role"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details