package terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.inspect_job_storage_config_big_query_options_excluded_fields_name

    import data.terraform.helpers
    import data.terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.vars

    conditions := [
        [
            {
                "situation_description": "A BigQuery field is excluded from DLP inspection, creating a persistent coverage blind spot.",
                "remedies": [
    "Remove excluded_fields so the entire table schema is inspected by default.",
    "Treat any excluded column as a reviewed exception."
]
            },
            {
                "condition": "BigQuery inspection must not exclude fields by default",
                "attribute_path": ["inspect_job", 0, "storage_config", 0, "big_query_options", 0, "excluded_fields", 0, "name"],
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
