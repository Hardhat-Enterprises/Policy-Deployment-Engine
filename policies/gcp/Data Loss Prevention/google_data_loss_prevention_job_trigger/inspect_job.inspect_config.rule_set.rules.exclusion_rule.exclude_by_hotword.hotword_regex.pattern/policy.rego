package terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.inspect_job_inspect_config_rule_set_rules_exclusion_rule_exclude_by_hotword_hotword_regex_pattern

    import data.terraform.helpers
    import data.terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.vars

    conditions := [
        [
            {
                "situation_description": "An exclusion hotword uses an overly broad expression that can suppress findings across unrelated contexts.",
                "remedies": [
    "Use a specific hotword expression tied to the reviewed exclusion context.",
    "Do not use catch-all expressions such as .*, .+, ^.*$, or ^.+$."
]
            },
            {
                "condition": "exclusion hotword patterns must not use catch-all regular expressions",
                "attribute_path": ["inspect_job", 0, "inspect_config", 0, "rule_set", 0, "rules", 0, "exclusion_rule", 0, "exclude_by_hotword", 0, "hotword_regex", 0, "pattern"],
                "values": [
    ".*",
    ".+",
    "^.*$",
    "^.+$"
],
                "policy_type": "blacklist"
            }
        ]
    ]

    result := helpers.get_multi_summary(conditions, vars.variables)

    message := result.message
    details := result.details
