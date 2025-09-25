package terraform.gcp.security.gdce.cluster.cidr_blocks
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gdce.cluster.vars

conditions := [
    # 1. Overly permissive CIDR ranges
    [
        {
            "situation_description": "Cluster has overly permissive networking CIDR blocks.",
            "remedies": ["Use restricted CIDR ranges for cluster and services, e.g., 10.0.0.0/16"]
        },
        {
            "condition": "Cluster networking CIDR blocks should not allow 0.0.0.0/0",
            "attribute_path": ["networking", 0, "cluster_ipv4_cidr_blocks"],
            "values": ["0.0.0.0/0"],
            "policy_type": "blacklist"
        }
    ],

]

# ------------------------------------------------------------
# Compliance messages
# ------------------------------------------------------------
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

# Add this summary rule
summary := {
    "message": message,
    "details": details
}