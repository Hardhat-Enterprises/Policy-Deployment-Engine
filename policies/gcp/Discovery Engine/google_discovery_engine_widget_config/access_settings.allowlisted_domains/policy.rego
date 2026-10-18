package terraform.gcp.security.discovery_engine.google_discovery_engine_widget_config.access_settings_allowlisted_domains

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_widget_config.vars

conditions := [
    [
        {
            "situation_description": "Widget config allowlisted domains contains a wildcard allowing any domain to embed the widget",
            "remedies": [
                "Remove wildcard entries from access_settings.allowlisted_domains and specify approved domains explicitly"
            ]
        },
        {
            "condition": "allowlisted_domains must not contain a wildcard",
            "attribute_path": ["access_settings", 0, "allowlisted_domains"],
            "values": ["*"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
