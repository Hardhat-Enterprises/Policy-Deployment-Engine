package terraform.gcp.security.discovery_engine.google_discovery_engine_sitemap.uri

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_sitemap.vars

conditions := [
    [
        {
            "situation_description": "Sitemap URI must use HTTPS to prevent indexing of unauthorised content",
            "remedies": [
                "Set uri to a valid https:// URL e.g. https://www.example.com/sitemap.xml"
            ]
        },
        {
            "condition": "uri scheme must not be insecure",
            "attribute_path": ["uri"],
            "values": ["*://*", [["http", "ftp", "ssh", "telnet", "smtp"]]],
            "policy_type": "pattern blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
