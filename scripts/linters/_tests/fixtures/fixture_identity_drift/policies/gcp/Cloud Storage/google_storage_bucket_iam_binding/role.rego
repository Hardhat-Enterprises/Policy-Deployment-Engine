package terraform.gcp.security.cloud_storage.google_storage_bucket_iam_binding.role

import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage.google_storage_bucket_iam_binding.vars

conditions := [
    [
        {
            "situation_description": "Binding grants a role that is broader than needed.",
            "remedies": ["Use roles/storage.objectViewer instead of an admin role."]
        },
        {
            "condition": "Role must not be an admin role.",
            "attribute_path": ["role"],
            "values": ["roles/storage.admin"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
