package terraform.gcp.security.compute_engine.google_compute_cross_site_network.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_cross_site_network.vars

conditions := [
    [
    {"situation_description" : "Terraform is permitted to destroy this cross-site network, which would remove the grouping of Interconnect attachments carrying traffic between the organisation's own sites and Google Cloud.",
    "remedies":[ "Set deletion_policy to PREVENT so the network cannot be removed or orphaned by a routine apply."]},
    {
        "condition": "deletion_policy must be PREVENT to protect cross-site connectivity infrastructure.",
        "attribute_path" : ["deletion_policy"],
        "values" : ["PREVENT"],
        "policy_type" : "whitelist"
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details