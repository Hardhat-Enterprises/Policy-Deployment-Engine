package terraform.gcp.security.Storage_Transfer_Service.google_storage_transfer_job.role_arn

import data.terraform.helpers
import data.terraform.gcp.security.Storage_Transfer_Service.google_storage_transfer_job.vars

conditions := [
    [
        {
            "situation_description": "Storage Transfer job uses an AWS S3 source without an approved IAM role ARN.",
            "remedies": [
                "Set transfer_spec.aws_s3_data_source.role_arn.",
                "Use AWS IAM role federation instead of long-lived AWS access keys."
            ]
        },
        {
            "condition": "Storage Transfer job must use an approved AWS IAM role ARN.",
            "attribute_path": ["transfer_spec", 0, "aws_s3_data_source", 0, "role_arn"],
            "values": vars.variables.approved_role_arns,
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details