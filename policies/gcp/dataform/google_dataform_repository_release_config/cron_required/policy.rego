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
            "policy_type" : "whitelist",
            "values" : ["0 2 * * *"]
        }
    ]
    ,
    [
        {"situation_description" : "Default BigQuery location must be approved",
        "remedies": ["Set code_compilation_config.default_location to an approved region"]},
        {
            "condition": "code_compilation_config must exist",
            "attribute_path" : ["code_compilation_config", 0],
            "policy_type" : "pattern whitelist",
            "values" : ["*"]
        },
        {
            "condition": "Allowlist default_location",
            "attribute_path" : ["default_location"],
            "policy_type" : "whitelist",
            "values" : ["US", "EU", "AU"]
        }
    ]
    ,
    [
        {"situation_description" : "Scheduled releases must specify a time zone",
        "remedies": ["Add time_zone (e.g., Australia/Melbourne) when cron is configured"]},
        {
            "condition": "cron_schedule set",
            "attribute_path" : ["cron_schedule"],
            "policy_type" : "pattern whitelist",
            "values" : ["*"]
        },
        {
            "condition": "time_zone required when cron is set",
            "attribute_path" : ["time_zone"],
            "policy_type" : "pattern whitelist",
            "values" : ["*"]
        }
    ]
    ,
    [
        {"situation_description" : "Compilation config present but default_schema missing",
        "remedies": ["Set code_compilation_config.default_schema to a valid BigQuery dataset ID"]},
        {
            "condition": "code_compilation_config must exist",
            "attribute_path" : ["code_compilation_config", 0],
            "policy_type" : "pattern whitelist",
            "values" : ["*"]
        },
        {
            "condition": "Require default_schema",
            "attribute_path" : ["default_schema"],
            "policy_type" : "pattern whitelist",
            "values" : ["*"]
        }
    ]
    ,
    [
        {"situation_description" : "Suffix/prefix must follow naming convention",
        "remedies": ["Align naming to org standards"]},
        {
            "condition": "code_compilation_config must exist",
            "attribute_path" : ["code_compilation_config", 0],
            "policy_type" : "pattern whitelist",
            "values" : ["*"]
        },
        {
            "condition": "database_suffix must end with -df",
            "attribute_path" : ["database_suffix"],
            "policy_type" : "pattern whitelist",
            "values" : ["*-df"]
        },
        {
            "condition": "schema_suffix must end with -df",
            "attribute_path" : ["schema_suffix"],
            "policy_type" : "pattern whitelist",
            "values" : ["*-df"]
        },
        {
            "condition": "table_prefix must start with df_",
            "attribute_path" : ["table_prefix"],
            "policy_type" : "pattern whitelist",
            "values" : ["df_*"]
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details



