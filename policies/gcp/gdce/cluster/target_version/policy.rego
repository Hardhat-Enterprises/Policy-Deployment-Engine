package terraform.gcp.security.gdce.cluster.target_version
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gdce.cluster.vars

conditions := [

    # Minimum Target Version Check
    [
        {
            "situation_description": "Cluster is running a target version lower than the minimum secure version.",
            "remedies": ["Upgrade cluster target_version to 1.5.0 or higher to mitigate known vulnerabilities"]
        },
        {
            "condition": "Target version must be at least 1.5.0",
            "attribute_path": ["target_version"],
            "values": ["1.5.0"],  # Minimum acceptable version
            "policy_type": "range", # ✅ Use range to check minimum version
            "comparison": "gte"     # greater than or equal
        }
    ],
]

# ------------------------------------------------------------
# Compliance messages
# ------------------------------------------------------------
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

summary := {
    "message": message,
    "details": details
}
