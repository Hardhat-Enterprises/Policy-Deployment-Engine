package terraform.gcp.security.compute.google_compute_router.encrypted_interconnect_router
import data.terraform.helpers
import data.terraform.gcp.security.compute.google_compute_router.vars

conditions := [
    [
    {"situation_description" : "Router is not dedicated for encrypted Interconnect VLAN attachments",
    "remedies":[ "Set encrypted_interconnect_router = true so the router enforces encryption in transit for Interconnect traffic"]},
    {
        "condition": "Router does not enforce encryption for Interconnect VLAN attachments",
        "attribute_path" : ["encrypted_interconnect_router"],
        "values" : [true],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
