package terraform.gcp.security.discovery_engine.google_discovery_engine_widget_config.ui_settings_generative_answer_config_ignore_adversarial_query

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_widget_config.vars

conditions := [
    [
        {
            "situation_description": "Widget config does not filter adversarial queries",
            "remedies": [
                "Set ui_settings.generative_answer_config.ignore_adversarial_query to true"
            ]
        },
        {
            "condition": "ignore_adversarial_query must be true",
            "attribute_path": ["ui_settings", 0, "generative_answer_config", 0, "ignore_adversarial_query"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
