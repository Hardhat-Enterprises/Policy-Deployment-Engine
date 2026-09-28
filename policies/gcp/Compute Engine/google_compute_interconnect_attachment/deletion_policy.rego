package terraform.gcp.security.compute_engine.google_compute_interconnect_attachment.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_interconnect_attachment.vars

conditions := [
    [
    {"situation_description" : "Terraform can destroy this attachment, creating a direct risk of service disruption and loss of secure connectivity.",
    "remedies":[ "Set deletion_policy to PREVENT to enforce secure lifecycle protection against accidental or malicious deletion."]},
    {
        "condition": "deletion_policy must be PREVENT to protect critical connectivity infrastructure.",
        "attribute_path" : ["deletion_policy"],
        "values" : ["PREVENT"],
        "policy_type" : "whitelist"
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details