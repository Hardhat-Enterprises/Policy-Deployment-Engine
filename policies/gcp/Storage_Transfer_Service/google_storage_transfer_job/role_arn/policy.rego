package terraform.gcp.security.Storage_Transfer_Service.google_storage_transfer_job.role_arn

import data.terraform.helpers
import data.terraform.gcp.security.Storage_Transfer_Service.google_storage_transfer_job.vars

conditions := [
    [
        {
            "situation_description": "Storage Transfer job uses an unapproved AWS IAM role ARN.",
            "remedies": [
                "Set transfer_spec.aws_s3_data_source.role_arn to an approved IAM role ARN.",
                "Avoid using unapproved AWS IAM roles for Storage Transfer jobs."
            ]
        },
       {
            "condition": "Storage Transfer job must not use an unapproved AWS IAM role ARN.",
            "attribute_path": ["transfer_spec", 0, "aws_s3_data_source", 0, "role_arn"],
            "values": ["arn:aws:iam::123456789012:role/unsafe-role"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details