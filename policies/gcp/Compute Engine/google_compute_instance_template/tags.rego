package terraform.gcp.security.compute_engine.google_compute_instance_template.tags

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The instance template uses a network tag outside the approved set. GCP firewall rules are commonly scoped by target tag, so an unapproved tag can silently attach the instance to firewall rules it was never meant to receive, widening its network exposure.",
            "remedies": [
                "Use only approved network tags in tags (web-server, app-server, db-server).",
                "If a new tag is genuinely needed, add it to the approved set together with a review of the firewall rules that target it."
            ]
        },
        {
            "condition": "Check that every network tag is in the approved set",
            "attribute_path": ["tags"],
            "values": ["web-server", "app-server", "db-server"],
            "policy_type": "element pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
