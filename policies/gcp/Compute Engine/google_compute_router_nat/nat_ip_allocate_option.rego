package terraform.gcp.security.compute_engine.google_compute_router_nat.nat_ip_allocate_option 
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_router_nat.vars

conditions := [
    [
    {"situation_description" : "NAT IPs are allocated manually rather than automatically assigned from an approved pool, risking NAT IP misconfigurations",
    "remedies":[ "Set nat_ip_allocate_option to AUTO_ONLY to enable automatic NAT IP allocation"]},
    {
        "condition": "nat_ip_allocate_option must be set to AUTO_ONLY",
        "attribute_path" : ["nat_ip_allocate_option"], 
        "values" : ["AUTO_ONLY"], 
        "policy_type" : "whitelist" 
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details