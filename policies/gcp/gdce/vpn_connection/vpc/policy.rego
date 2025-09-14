package terraform.gcp.security.gdce.vpn_connection.vpc
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gdce.vpn_connection.vars

conditions := [
    # VPC security validation - restrict to approved projects/ranges
    [
        {
            "situation_description": "Cluster VPC is overly permissive or outside approved projects.",
            "remedies": ["Use an approved VPC in your project", "Ensure CIDR ranges are RFC1918 and not 0.0.0.0/0"]
        },
        {
            "condition": "VPC must be within approved ranges/projects",
            "attribute_path": ["networking", 0, "cluster_ipv4_cidr_blocks"],
            "values": ["0.0.0.0/0"],  # blacklist overly permissive ranges
            "policy_type": "blacklist"
        }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

summary := {
    "message": message,
    "details": details
}