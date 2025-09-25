package terraform.gcp.security.gdce.cluster.target_version
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gdce.cluster.vars

conditions := [

    [
        {
            "situation_description": "Cluster is running a target version lower than the minimum secure version.",
            "remedies": [
                "Upgrade cluster target_version to 1.5.0 or higher to mitigate known vulnerabilities"
            ]
        },
        {
            "condition": "Target version must be one of the approved secure versions",
            "attribute_path": ["target_version"],
            "values": ["1.5.0", "1.5.1", "1.6.0"], # extend list as new versions are approved
            "policy_type": "whitelist"
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
