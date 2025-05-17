package terraform.gcp.security.healthcare.dataset.time_zone
import data.terraform.gcp.security.healthcare.dataset.vars
import data.terraform.gcp.helpers

conditions := [
    [
        {
            "situation_description": "Non-compliant 'time_zone' setting.",
            "remedies": [
                "Set 'time_zone' to the approved value: 'UTC+10:00' to ensure consistency across systems and avoid scheduling or rotation issues."
            ]
        },
        {
            "condition": "non-approved time_zone value",
            "attribute_path": ["time_zone"],
            "values": ["UTC+10:00"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details