package terraform.gcp.security.compute_engine.google_compute_service_attachment.deletion_policy 
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_service_attachment.vars

conditions := [
    [
        {
            "situation_description": "deletion_policy is set to either DELETE or ABANDON",
            "remedies": [
                "Set deletion_policy to PREVENT"
            ]
        },
        {
            "condition": "deletion_policy must be set to prevent",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details