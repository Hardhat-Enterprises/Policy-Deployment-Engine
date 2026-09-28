package terraform.gcp.security.compute_engine.google_compute_firewall.enable_logging

import data.terraform.gcp.security.compute_engine.google_compute_firewall.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "Firewall logging is disabled, leaving no record of which connections the rule permitted or blocked.",
                "remedies": ["Set enable_logging to true so matched connections are recorded for auditing and incident investigation."],
        },
        {
                "condition": "enable_logging is not true",
                "attribute_path": ["enable_logging"],
                "values": [true],
                "policy_type": "whitelist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
