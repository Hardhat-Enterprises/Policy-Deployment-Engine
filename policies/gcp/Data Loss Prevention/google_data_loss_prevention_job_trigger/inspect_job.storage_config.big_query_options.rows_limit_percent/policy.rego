package terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.inspect_job_storage_config_big_query_options_rows_limit_percent

    import data.terraform.helpers
    import data.terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.vars

    conditions := [
        [
            {
                "situation_description": "The BigQuery inspection scans only a percentage of rows and can leave sensitive records uninspected.",
                "remedies": [
    "Set rows_limit_percent to 0 or 100 for no percentage limit.",
    "Use partial sampling only through a documented exception."
]
            },
            {
                "condition": "BigQuery row percentage must represent full scan coverage",
                "attribute_path": ["inspect_job", 0, "storage_config", 0, "big_query_options", 0, "rows_limit_percent"],
                "values": [
    0,
    100
],
                "policy_type": "whitelist"
            }
        ]
    ]

    result := helpers.get_multi_summary(conditions, vars.variables)

    message := result.message
    details := result.details
