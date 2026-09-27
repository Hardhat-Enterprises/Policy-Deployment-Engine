package terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.inspect_job_storage_config_cloud_storage_options_bytes_limit_per_file

    import data.terraform.helpers
    import data.terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.vars

    conditions := [
        [
            {
                "situation_description": "Cloud Storage inspection limits the number of bytes read from each file, leaving file content uninspected.",
                "remedies": [
    "Leave bytes_limit_per_file unset for full-file inspection.",
    "Use byte-limited scanning only through a documented exception."
]
            },
            {
                "condition": "Cloud Storage files must be scanned without a fixed byte cap",
                "attribute_path": ["inspect_job", 0, "storage_config", 0, "cloud_storage_options", 0, "bytes_limit_per_file"],
                "values": [
    null,
    0
],
                "policy_type": "whitelist"
            }
        ]
    ]

    result := helpers.get_multi_summary(conditions, vars.variables)

    message := result.message
    details := result.details
