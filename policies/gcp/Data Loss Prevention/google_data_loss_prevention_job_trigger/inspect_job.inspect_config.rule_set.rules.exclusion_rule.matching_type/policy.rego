package terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.inspect_job_inspect_config_rule_set_rules_exclusion_rule_matching_type

    import data.terraform.helpers
    import data.terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.vars

    conditions := [
        [
            {
                "situation_description": "An exclusion rule uses a broad matching mode that can suppress more findings than intended.",
                "remedies": [
    "Use MATCHING_TYPE_FULL_MATCH so exclusions apply only to precise matches.",
    "Avoid partial or inverse exclusion matching unless it is explicitly reviewed."
]
            },
            {
                "condition": "exclusion rules must use the narrow full-match behaviour",
                "attribute_path": ["inspect_job", 0, "inspect_config", 0, "rule_set", 0, "rules", 0, "exclusion_rule", 0, "matching_type"],
                "values": [
    "MATCHING_TYPE_FULL_MATCH"
],
                "policy_type": "whitelist"
            }
        ]
    ]

    result := helpers.get_multi_summary(conditions, vars.variables)

    message := result.message
    details := result.details
