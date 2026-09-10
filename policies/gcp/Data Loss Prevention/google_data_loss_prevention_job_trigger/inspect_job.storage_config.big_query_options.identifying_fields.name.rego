package terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.inspect_job_storage_config_big_query_options_identifying_fields_name

    import data.terraform.helpers
    import data.terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.vars

    conditions := [
        [
            {
                "situation_description": "A sensitive BigQuery field is copied into DLP findings as an identifying value.",
                "remedies": [
    "Use only non-sensitive identifiers for identifying_fields.",
    "Do not copy passwords, secrets, tokens, national identifiers, or payment-card fields into findings."
]
            },
            {
                "condition": "identifying fields must not contain baseline sensitive field names",
                "attribute_path": ["inspect_job", 0, "storage_config", 0, "big_query_options", 0, "identifying_fields", 0, "name"],
                "values": [
    "password",
    "secret",
    "token",
    "ssn",
    "social_security_number",
    "credit_card_number"
],
                "policy_type": "blacklist"
            }
        ]
    ]

    result := helpers.get_multi_summary(conditions, vars.variables)

    message := result.message
    details := result.details
