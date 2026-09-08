package terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.inspect_job_inspect_config_custom_info_types_likelihood

    import data.terraform.helpers
    import data.terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.vars

    conditions := [
        [
            {
                "situation_description": "A custom detector assigns findings a likelihood below the normal reporting baseline.",
                "remedies": [
    "Use POSSIBLE, LIKELY, or VERY_LIKELY for the custom information type.",
    "Avoid likelihood settings that can cause custom detections to fall below the reporting threshold."
]
            },
            {
                "condition": "custom detector likelihood must remain at or above the normal reporting baseline",
                "attribute_path": ["inspect_job", 0, "inspect_config", 0, "custom_info_types", 0, "likelihood"],
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
