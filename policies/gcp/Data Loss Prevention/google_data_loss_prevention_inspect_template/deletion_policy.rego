package terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_inspect_template.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_inspect_template.vars

conditions := [
    [
    {"situation_description" : "The inspect template can be destroyed by Terraform, risking loss of the detection control",
    "remedies":[ "Set deletion_policy to PREVENT"]},
    {
        "condition": "Check if deletion_policy is set to PREVENT",
        "attribute_path" : ["deletion_policy"],
        "values" : ["PREVENT"],
        "policy_type" : "whitelist"
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := helpers.get_multi_summary(conditions, vars.variables).details