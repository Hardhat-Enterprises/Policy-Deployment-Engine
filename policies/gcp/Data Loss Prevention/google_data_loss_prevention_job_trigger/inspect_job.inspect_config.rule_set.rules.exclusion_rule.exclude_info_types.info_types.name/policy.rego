package terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.inspect_job_inspect_config_rule_set_rules_exclusion_rule_exclude_info_types_info_types_name

    import data.terraform.helpers
    import data.terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.vars

    conditions := [
        [
            {
                "situation_description": "An exclusion rule suppresses findings produced by a baseline high-sensitivity detector.",
                "remedies": [
    "Do not exclude baseline high-sensitivity information types from scan results.",
    "Use a documented exception before suppressing findings from a protected detector."
]
            },
            {
                "condition": "baseline high-sensitivity information types must not be used to suppress findings",
                "attribute_path": ["inspect_job", 0, "inspect_config", 0, "rule_set", 0, "rules", 0, "exclusion_rule", 0, "exclude_info_types", 0, "info_types", 0, "name"],
                "values": [
    "CREDIT_CARD_NUMBER",
    "US_SOCIAL_SECURITY_NUMBER",
    "US_INDIVIDUAL_TAXPAYER_IDENTIFICATION_NUMBER"
],
                "policy_type": "blacklist"
            }
        ]
    ]

    result := helpers.get_multi_summary(conditions, vars.variables)

    message := result.message
    details := result.details
