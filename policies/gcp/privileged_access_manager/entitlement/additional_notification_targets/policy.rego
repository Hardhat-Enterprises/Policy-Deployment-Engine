package terraform.gcp.security.privileged_access_manager.entitlement.additional_notification_targets

import data.terraform.gcp.helpers
import data.terraform.gcp.security.privileged_access_manager.entitlement.vars

conditions := [
    [
        {
            "situation_description": "Entitlement does not have additional notification targets configured",
            "remedies": ["Add an additional_notification_targets block with appropriate email recipients for admin and requester notifications"]
        },
        {
            "condition": "Check if additional_notification_targets is present and not empty",
            "attribute_path": ["additional_notification_targets"],
            "values": [null, {}],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details