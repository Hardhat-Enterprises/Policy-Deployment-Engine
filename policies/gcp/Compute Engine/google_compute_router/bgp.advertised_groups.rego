package terraform.gcp.security.compute.google_compute_router.bgp_advertised_groups
import data.terraform.helpers
import data.terraform.gcp.security.compute.google_compute_router.vars

conditions := [
    [
    {"situation_description" : "Router BGP advertised_groups includes ALL_SUBNETS, re-creating blanket advertisement under CUSTOM mode",
    "remedies":[ "Remove ALL_SUBNETS from bgp.advertised_groups; advertise only the specific prefix groups the peers require"]},
    {
        "condition": "Router advertises the ALL_SUBNETS group, negating least-privilege route advertisement",
        "attribute_path" : ["bgp", 0, "advertised_groups"],
        "values" : ["ALL_SUBNETS"],
        "policy_type" : "element blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
