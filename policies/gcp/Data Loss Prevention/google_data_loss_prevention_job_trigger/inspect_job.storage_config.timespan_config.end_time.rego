package terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.inspect_job_storage_config_timespan_config_end_time

    import data.terraform.helpers
    import data.terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.vars

    conditions := [
        [
            {
                "situation_description": "A fixed end time prevents scheduled DLP scans from inspecting data created after that timestamp.",
                "remedies": [
    "Leave end_time unset so recurring scans continue through current data.",
    "Use an upper time bound only through a documented exception."
]
            },
            {
                "condition": "scheduled DLP inspection must not use a fixed upper time boundary",
                "attribute_path": ["inspect_job", 0, "storage_config", 0, "timespan_config", 0, "end_time"],
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
