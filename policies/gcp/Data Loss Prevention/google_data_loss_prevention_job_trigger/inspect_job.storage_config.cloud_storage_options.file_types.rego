package terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.inspect_job_storage_config_cloud_storage_options_file_types

    import data.terraform.helpers
    import data.terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.vars

    conditions := [
        [
            {
                "situation_description": "Cloud Storage inspection is restricted to selected file types, leaving other supported formats outside the scan.",
                "remedies": [
    "Leave file_types empty so all supported file formats are scanned.",
    "Do not restrict inspection to a subset of file types without a reviewed exception."
]
            },
            {
                "condition": "Cloud Storage file type selection must not narrow scan coverage",
                "attribute_path": ["inspect_job", 0, "storage_config", 0, "cloud_storage_options", 0, "file_types"],
                "values": [
    "BINARY_FILE",
    "TEXT_FILE",
    "IMAGE",
    "WORD",
    "PDF",
    "AVRO",
    "CSV",
    "TSV",
    "POWERPOINT",
    "EXCEL"
],
                "policy_type": "element blacklist"
            }
        ]
    ]

    result := helpers.get_multi_summary(conditions, vars.variables)

    message := result.message
    details := result.details
