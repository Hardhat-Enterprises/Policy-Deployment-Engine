package terraform.gcp.security.oslogin.google_compute_instance.restrict_service_account_scopes

import data.terraform.gcp.helpers
import data.terraform.gcp.security.oslogin.google_compute_instance.vars


conditions := [
    [
        {
            "situation_description": "Instances with OS Login must not use overly broad service account scopes",
            "remedies": [
                "Remove cloud-platform scope",
                "Use minimal scopes such as logging.write or monitoring.write"
            ]
        },
        {
            "condition": "Service account scopes must not include cloud-platform",
            "attribute_path": ["service_account", 0, "scopes", 0],
            "values": ["https://www.googleapis.com/auth/cloud-platform"],
            "policy_type": "blacklist"
        }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details