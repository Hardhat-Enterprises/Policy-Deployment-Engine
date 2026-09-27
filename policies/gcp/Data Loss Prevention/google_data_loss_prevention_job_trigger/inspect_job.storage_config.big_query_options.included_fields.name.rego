package terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.inspect_job_storage_config_big_query_options_included_fields_name

    import data.terraform.helpers
    import data.terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.vars

    conditions := [
        [
            {
                "situation_description": "BigQuery inspection is restricted to an explicit field list, leaving all other columns unscanned.",
                "remedies": [
    "Remove included_fields so the whole table is scanned by default.",
    "Use field-limited scanning only through a documented exception."
]
            },
            {
                "condition": "BigQuery inspection must not be restricted to an inclusion list by default",
                "attribute_path": ["inspect_job", 0, "storage_config", 0, "big_query_options", 0, "included_fields", 0, "name"],
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
