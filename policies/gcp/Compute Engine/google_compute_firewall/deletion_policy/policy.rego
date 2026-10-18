package terraform.gcp.security.compute_engine.google_compute_firewall.deletion_policy

import data.terraform.gcp.security.compute_engine.google_compute_firewall.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "The firewall rule can be destroyed or abandoned by Terraform, silently removing the traffic controls it enforced.",
                "remedies": ["Set deletion_policy to PREVENT so the rule cannot be removed by a Terraform apply or destroy."],
        },
        {
                "condition": "deletion_policy is not set to PREVENT",
                "attribute_path": ["deletion_policy"],
                "values": ["PREVENT"],
                "policy_type": "whitelist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
