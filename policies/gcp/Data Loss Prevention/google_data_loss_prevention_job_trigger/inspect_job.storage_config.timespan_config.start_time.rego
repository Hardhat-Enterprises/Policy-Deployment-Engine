package terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.inspect_job_storage_config_timespan_config_start_time

    import data.terraform.helpers
    import data.terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.vars

    conditions := [
        [
            {
                "situation_description": "A fixed start time permanently excludes older data from DLP inspection.",
                "remedies": [
    "Leave start_time unset so historical data remains within scan coverage.",
    "Use a lower time boundary only through a documented exception."
]
            },
            {
                "condition": "DLP inspection must not exclude historical data with a fixed lower time boundary",
                "attribute_path": ["inspect_job", 0, "storage_config", 0, "timespan_config", 0, "start_time"],
                "values": [
    null,
    ""
],
                "policy_type": "whitelist"
            }
        ]
    ]

    result := helpers.get_multi_summary(conditions, vars.variables)

    message := result.message
    details := result.details
