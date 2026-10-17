package terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.inspect_job_inspect_config_rule_set_rules_hotword_rule_likelihood_adjustment_relative_likelihood

    import data.terraform.helpers
    import data.terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.vars

    conditions := [
        [
            {
                "situation_description": "A hotword rule decreases finding likelihood and can cause genuine matches to be filtered from results.",
                "remedies": [
    "Use a non-negative relative likelihood adjustment.",
    "Use likelihood adjustments to maintain or increase confidence rather than hide findings."
]
            },
            {
                "condition": "relative likelihood adjustment must not decrease finding confidence",
                "attribute_path": ["inspect_job", 0, "inspect_config", 0, "rule_set", 0, "rules", 0, "hotword_rule", 0, "likelihood_adjustment", 0, "relative_likelihood"],
                "values": [
    0,
    4
],
                "policy_type": "range"
            }
        ]
    ]

    result := helpers.get_multi_summary(conditions, vars.variables)

    message := result.message
    details := result.details
