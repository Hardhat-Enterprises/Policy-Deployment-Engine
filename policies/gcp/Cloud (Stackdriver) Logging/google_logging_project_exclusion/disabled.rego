package terraform.gcp.security.cloud_stackdriver_logging.google_logging_project_exclusion.disabled

import data.terraform.helpers
import data.terraform.gcp.security.cloud_stackdriver_logging.google_logging_project_exclusion.vars

conditions := [
    [
        {
            "situation_description": "Log exclusion is disabled - not actively filtering logs",
            "remedies": [
                "Set disabled = false to activate the exclusion",
                "Or remove the disabled attribute entirely (default is false)",
                "If the exclusion is no longer needed, consider removing it completely"
            ]
        },
        {
            "condition": "Exclusions must be active (not disabled)",
            "attribute_path": ["disabled"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details