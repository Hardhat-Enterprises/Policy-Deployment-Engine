package terraform.gcp.security.deploy.custom_target_type.custom_actions
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deploy.custom_target_type.vars

conditions := [
    [
        {"situation_description": "Custom Target Type missing custom actions",
         "remedies": ["Custom Target Type must have custom actions defined for security"]},
        {
            "condition": "Custom Target Type has custom actions",
            "attribute_path": ["custom_actions"],
            "values": [[]],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details