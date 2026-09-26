package terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.inspect_job_inspect_config_custom_info_types_exclusion_type

    import data.terraform.helpers
    import data.terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.vars

    conditions := [
        [
            {
                "situation_description": "A custom information type is configured to match data without returning findings.",
                "remedies": [
    "Remove EXCLUSION_TYPE_EXCLUDE so detections from the custom information type are reported.",
    "Use exclusion only through a reviewed exception when suppression is explicitly required."
]
            },
            {
                "condition": "custom information types must not silently suppress their findings",
                "attribute_path": ["inspect_job", 0, "inspect_config", 0, "custom_info_types", 0, "exclusion_type"],
                "values": [
    "EXCLUSION_TYPE_EXCLUDE"
],
                "policy_type": "blacklist"
            }
        ]
    ]

    result := helpers.get_multi_summary(conditions, vars.variables)

    message := result.message
    details := result.details
