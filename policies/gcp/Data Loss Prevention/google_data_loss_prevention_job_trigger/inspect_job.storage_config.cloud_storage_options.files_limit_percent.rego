package terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.inspect_job_storage_config_cloud_storage_options_files_limit_percent

    import data.terraform.helpers
    import data.terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.vars

    conditions := [
        [
            {
                "situation_description": "Cloud Storage inspection scans only a percentage of files and can completely omit sensitive files.",
                "remedies": [
    "Set files_limit_percent to 0 or 100 for no file-count limit.",
    "Use file sampling only through a documented exception."
]
            },
            {
                "condition": "Cloud Storage file percentage must represent full scan coverage",
                "attribute_path": ["inspect_job", 0, "storage_config", 0, "cloud_storage_options", 0, "files_limit_percent"],
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
