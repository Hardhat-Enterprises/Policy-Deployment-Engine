package terraform.gcp.security.oslogin.google_compute_instance.restrict_service_account_scopes

import data.terraform.gcp.helpers
import data.terraform.gcp.security.oslogin.google_compute_instance.vars


conditions := [
    [
        {
            "situation_description": "Instances with OS Login must not use overly broad service account scopes",
            "remedies": [
                "Replace \"cloud-platform\" scope with more restrictive scopes like \"logging.write\" or \"monitoring.write\"
            ]
        },
        {
            "condition": "Service account scopes must not include cloud-platform",
            "attribute_path": ["service_account", 0, "scopes"],
            "values": ["*cloud-platform*"],
            "policy_type": "pattern blacklist"
        }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details