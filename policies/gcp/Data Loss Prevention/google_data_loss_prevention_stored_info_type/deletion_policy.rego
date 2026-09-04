package terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_stored_info_type.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_stored_info_type.vars

conditions := [
    [
        {
            "situation_description": "The stored info type can be destroyed by Terraform, risking loss of the detection control",
            "remedies": ["Set deletion_policy to PREVENT"]
        },
        {
            "condition": "deletion_policy is not set to PREVENT",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details