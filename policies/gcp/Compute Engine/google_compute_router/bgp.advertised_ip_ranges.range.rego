package terraform.gcp.security.compute.google_compute_router.bgp_advertised_ip_ranges_range
import data.terraform.helpers
import data.terraform.gcp.security.compute.google_compute_router.vars

conditions := [
    [
    {"situation_description" : "Router advertises an over-broad CIDR to BGP peers, leaking internal reachability",
    "remedies":[ "Advertise only the specific prefixes peers require; avoid 0.0.0.0/0 and whole-RFC1918 blocks (10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16)"]},
    {
        "condition": "Router advertises an over-broad IP range beyond least-privilege need",
        "attribute_path" : ["bgp", 0, "advertised_ip_ranges", 0, "range"],
        "values" : ["0.0.0.0/0", "10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
