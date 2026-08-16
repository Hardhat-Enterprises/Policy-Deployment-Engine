package terraform.gcp.security.cloud_stackdriver_logging.google_logging_folder_settings.disable_default_sink

import data.terraform.helpers
import data.terraform.gcp.security.cloud_stackdriver_logging.google_logging_folder_settings.vars

conditions := [
    [
        {
            "situation_description": "Folder logging settings disable the _Default sink for newly created resources, which can silently cause logs to go unstored if no other sink is explicitly configured",
            "remedies": [
                "Set disable_default_sink to false unless an aggregated sink is already configured for this hierarchy",
                "If disabling intentionally, confirm an alternative sink captures the logs that would have gone to _Default"
            ]
        },
        {
            "condition": "Folder logging must not disable the default sink",
            "attribute_path": ["disable_default_sink"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details