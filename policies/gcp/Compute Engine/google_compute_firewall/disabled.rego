package terraform.gcp.security.compute_engine.google_compute_firewall.disabled

import data.terraform.gcp.security.compute_engine.google_compute_firewall.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "The firewall rule is disabled, so the traffic controls it defines are not applied even though the resource still exists.",
                "remedies": ["Set disabled to false so the rule is enforced, or remove the rule entirely if it is no longer needed."],
        },
        {
                "condition": "disabled is true",
                "attribute_path": ["disabled"],
                "values": [false],
                "policy_type": "whitelist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
