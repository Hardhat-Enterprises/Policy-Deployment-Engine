package terraform.gcp.security.dataplex.google_dataplex_task.execution_spec_service_account

import data.terraform.helpers
import data.terraform.gcp.security.dataplex.google_dataplex_task.vars

conditions := [
    [
        {
            "situation_description": "Task runs as a Google-managed default service account, so the job inherits far broader project access than it needs",
            "remedies": [
                "Set execution_spec.service_account to a dedicated, user-managed service account",
                "Use the form NAME@PROJECT.iam.gserviceaccount.com",
                "Grant that account only the roles the task itself requires"
            ]
        },
        {
            "condition": "execution_spec service_account must not be a Google-managed default service account",
            "attribute_path": ["execution_spec", 0, "service_account"],
            "values": ["@*", [["developer.gserviceaccount.com", "appspot.gserviceaccount.com"]]],
            "policy_type": "pattern blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details