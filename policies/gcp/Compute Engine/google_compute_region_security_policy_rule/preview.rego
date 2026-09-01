package terraform.gcp.security.compute_engine.google_compute_region_security_policy_rule.preview

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy_rule.vars

conditions := [
    [
        {
            "situation_description": "The regional security policy rule is operating in preview mode, so its configured security action is not actively enforced.",
            "remedies": [
                "Set preview to false when the rule is approved for active enforcement.",
                "Validate the expected traffic impact before transitioning the rule from preview to enforcement.",
                "Periodically review preview-mode rules to prevent required security controls from remaining unenforced."
            ]
        },
        {
            "condition": "Require the regional security policy rule to actively enforce its configured action.",
            "attribute_path": ["preview"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
