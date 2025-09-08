package terraform.gcp.security.dataform.google_dataform_repository_release_config.cron_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository_release_config.vars

conditions := [
    [
        {"situation_description" : "Release configs must define a cron schedule",
        "remedies": ["Set cron_schedule to a valid cron string (e.g., '0 2 * * *')"]},
        {
            "condition": "cron_schedule must be set to 0 2 * * *",
            "attribute_path" : ["cron_schedule"],
            "values" : ["0 2 * * *"],
            "policy_type" : "whitelist"
        }
    ]
    ,
    [
        {"situation_description" : "Default BigQuery location must be approved",
        "remedies": ["Set code_compilation_config.default_location to an approved region"]},
        {
            "condition": "Allowlist default_location",
            "attribute_path" : ["code_compilation_config", 0, "default_location"],
            "values" : ["US", "EU", "AU"],
            "policy_type" : "whitelist"
        }
    ]
    ,
    [
        {"situation_description" : "Scheduled releases must specify a time zone",
        "remedies": ["Add time_zone (e.g., Australia/Melbourne) when cron is configured"]},
        {
            "condition": "cron_schedule set",
            "attribute_path" : ["cron_schedule"],
            "values" : ["*"],
            "policy_type" : "pattern whitelist"
        },
        {
            "condition": "time_zone required when cron is set",
            "attribute_path" : ["time_zone"],
            "values" : ["*"],
            "policy_type" : "pattern whitelist"
        }
    ]
    ,
    [
        {"situation_description" : "Compilation config present but default_schema missing",
        "remedies": ["Set code_compilation_config.default_schema to a valid BigQuery dataset ID"]},
        {
            "condition": "Require default_schema",
            "attribute_path" : ["code_compilation_config", 0, "default_schema"],
            "values" : ["*"],
            "policy_type" : "pattern whitelist"
        }
    ]
    ,
    [
        {"situation_description" : "Suffix/prefix must follow naming convention",
        "remedies": ["Align naming to org standards"]},
        {
            "condition": "database_suffix must end with -df",
            "attribute_path" : ["code_compilation_config", 0, "database_suffix"],
            "values" : ["*-df"],
            "policy_type" : "pattern whitelist"
        },
        {
            "condition": "schema_suffix must end with -df",
            "attribute_path" : ["code_compilation_config", 0, "schema_suffix"],
            "values" : ["*-df"],
            "policy_type" : "pattern whitelist"
        },
        {
            "condition": "table_prefix must start with df_",
            "attribute_path" : ["code_compilation_config", 0, "table_prefix"],
            "values" : ["df_*"] ,
            "policy_type" : "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details



