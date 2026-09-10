package terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.inspect_job_inspect_config_rule_set_rules_hotword_rule_likelihood_adjustment_fixed_likelihood

    import data.terraform.helpers
    import data.terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.vars

    conditions := [
        [
            {
                "situation_description": "A hotword rule fixes finding confidence to a value that can suppress otherwise reportable findings.",
                "remedies": [
    "Use POSSIBLE, LIKELY, or VERY_LIKELY when fixing finding likelihood.",
    "Do not downgrade matching findings to VERY_UNLIKELY or UNLIKELY."
]
            },
            {
                "condition": "fixed likelihood adjustments must not lower findings below the normal reporting baseline",
                "attribute_path": ["inspect_job", 0, "inspect_config", 0, "rule_set", 0, "rules", 0, "hotword_rule", 0, "likelihood_adjustment", 0, "fixed_likelihood"],
                "values": [
    "POSSIBLE",
    "LIKELY",
    "VERY_LIKELY"
],
                "policy_type": "whitelist"
            }
        ]
    ]

    result := helpers.get_multi_summary(conditions, vars.variables)

    message := result.message
    details := result.details
