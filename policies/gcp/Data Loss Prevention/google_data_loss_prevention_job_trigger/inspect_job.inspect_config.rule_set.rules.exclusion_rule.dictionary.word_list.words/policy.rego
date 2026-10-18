package terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.inspect_job_inspect_config_rule_set_rules_exclusion_rule_dictionary_word_list_words

    import data.terraform.helpers
    import data.terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.vars

    conditions := [
        [
            {
                "situation_description": "An exclusion dictionary contains broad terms that can suppress large numbers of genuine findings.",
                "remedies": [
    "Keep exclusion dictionary entries specific to the reviewed exception.",
    "Do not use generic terms such as data, user, customer, name, email, or account as suppression terms."
]
            },
            {
                "condition": "exclusion dictionaries must not contain generic broad suppression terms",
                "attribute_path": ["inspect_job", 0, "inspect_config", 0, "rule_set", 0, "rules", 0, "exclusion_rule", 0, "dictionary", 0, "word_list", 0, "words"],
                "values": [
    "data",
    "user",
    "customer",
    "name",
    "email",
    "account"
],
                "policy_type": "element blacklist"
            }
        ]
    ]

    result := helpers.get_multi_summary(conditions, vars.variables)

    message := result.message
    details := result.details
