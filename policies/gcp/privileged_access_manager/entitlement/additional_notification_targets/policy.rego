package terraform.gcp.security.privileged_access_manager.entitlement.additional_notification_targets

import data.terraform.gcp.helpers
import data.terraform.gcp.security.privileged_access_manager.entitlement.vars

conditions := [
    [
        {
            "situation_description": "Entitlement has additional notification targets but no admin email recipients configured",
            "remedies": ["Add admin email recipients to additional_notification_targets configuration"]
        },
        {
            "condition": "Check if admin_email_recipients is null or empty",
            "attribute_path": ["additional_notification_targets", 0, "admin_email_recipients"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details