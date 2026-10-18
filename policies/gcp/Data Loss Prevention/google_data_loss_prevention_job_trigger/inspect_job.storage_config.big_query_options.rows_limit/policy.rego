package terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.inspect_job_storage_config_big_query_options_rows_limit

    import data.terraform.helpers
    import data.terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.vars

    conditions := [
        [
            {
                "situation_description": "The BigQuery inspection is capped at a fixed row count, leaving the remainder unscanned.",
                "remedies": [
    "Set rows_limit to 0 so all rows are scanned.",
    "Use row sampling only through a documented exception."
]
            },
            {
                "condition": "BigQuery row scanning must not use a fixed coverage limit",
                "attribute_path": ["inspect_job", 0, "storage_config", 0, "big_query_options", 0, "rows_limit"],
                "values": [
    0
],
                "policy_type": "whitelist"
            }
        ]
    ]

    result := helpers.get_multi_summary(conditions, vars.variables)

    message := result.message
    details := result.details
