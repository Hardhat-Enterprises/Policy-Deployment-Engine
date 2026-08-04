package terraform.gcp.security.compute.google_compute_router.bgp_advertise_mode
import data.terraform.helpers
import data.terraform.gcp.security.compute.google_compute_router.vars

conditions := [
    [
    {"situation_description" : "Router BGP advertise_mode is DEFAULT, auto-advertising all subnets to peers",
    "remedies":[ "Set bgp.advertise_mode = CUSTOM so route advertisement is explicit and least-privilege"]},
    {
        "condition": "Router BGP advertisement is not restricted to explicit custom routes",
        "attribute_path" : ["bgp", 0, "advertise_mode"],
        "values" : ["CUSTOM"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details