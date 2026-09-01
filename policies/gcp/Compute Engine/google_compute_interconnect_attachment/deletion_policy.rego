package terraform.gcp.security.compute_engine.google_compute_interconnect_attachment.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_interconnect_attachment.vars

conditions := [
    [
    {"situation_description" : "Attachment can be destroyed by Terraform, risking loss of connectivity.",
    "remedies":[ "Set deletion_policy to PREVENT."]},
    {
        "condition": "deletion_policy must be PREVENT.",
        "attribute_path" : ["deletion_policy"],
        "values" : ["PREVENT"],
        "policy_type" : "whitelist"
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details