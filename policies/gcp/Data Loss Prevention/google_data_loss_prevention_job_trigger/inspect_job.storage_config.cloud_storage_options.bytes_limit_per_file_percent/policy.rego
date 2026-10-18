package terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.inspect_job_storage_config_cloud_storage_options_bytes_limit_per_file_percent

    import data.terraform.helpers
    import data.terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.vars

    conditions := [
        [
            {
                "situation_description": "Cloud Storage inspection scans only part of each file and can miss sensitive content in the omitted portion.",
                "remedies": [
    "Set bytes_limit_per_file_percent to 0 or 100 for no percentage limit.",
    "Use partial file inspection only through a documented exception."
]
            },
            {
                "condition": "Cloud Storage byte percentage must represent full-file coverage",
                "attribute_path": ["inspect_job", 0, "storage_config", 0, "cloud_storage_options", 0, "bytes_limit_per_file_percent"],
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
