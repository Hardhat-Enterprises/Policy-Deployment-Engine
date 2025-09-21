package terraform.gcp.security.gdce.cluster.maintenance_policy
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gdce.cluster.vars

conditions := [

    [
        {
            "situation_description": "Cluster maintenance policy window is not configured.",
            "remedies": [
                "Configure maintenance window to avoid production disruptions",
                "Set recurring window for maintenance"
            ]
        },
        {
            "condition": "Maintenance policy must be present",
            "attribute_path": ["maintenance_policy"],
            "values": [null],
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