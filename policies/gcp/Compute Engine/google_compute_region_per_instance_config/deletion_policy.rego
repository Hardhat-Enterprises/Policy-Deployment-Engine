package terraform.gcp.security.compute_engine.google_compute_region_per_instance_config.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_per_instance_config.vars

conditions := [
    [
        {
            "situation_description": "Deletion_policy is configured to either DESTROY or ABANDON",
            "remedies": [
                "Set deletion_policy to PREVENT"
            ]
        },
        {
            "condition": "deletion_policy must be configured to PREVENT",
            "attribute_path": ["deletion_policy"],
            "values": [ "PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details