package terraform.gcp.security.dataform.google_dataform_repository_workflow_config.service_account_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository_workflow_config.vars

conditions := [
    [
        {"situation_description" : "Workflow configs must define an invocation_config.service_account",
        "remedies": ["Set invocation_config.service_account to a valid service account email"]},
        {
            "condition": "service_account is required",
            "attribute_path" : ["invocation_config", 0, "service_account"],
            "values" : ["*"],
            "policy_type" : "pattern whitelist"
        }
    ]
    ,
    [
        {"situation_description" : "Fully refreshing incremental tables can be destructive",
        "remedies": ["Set fully_refresh_incremental_tables_enabled to false"]},
        {
            "condition": "Disallow full refresh of incremental tables",
            "attribute_path" : ["invocation_config", 0, "fully_refresh_incremental_tables_enabled"],
            "values" : [true],
            "policy_type" : "blacklist"
        }
    ]
    ,
    [
        {"situation_description" : "Scheduled workflow must pin explicit targets",
        "remedies": ["Define at least one included target (database/schema/name)"]},
        {
            "condition": "cron_schedule set",
            "attribute_path" : ["cron_schedule"],
            "values" : ["*"],
            "policy_type" : "pattern whitelist"
        },
        {
            "condition": "At least one included target",
            "attribute_path" : ["invocation_config", 0, "included_targets", 0, "name"],
            "values" : ["*"],
            "policy_type" : "pattern whitelist"
        }
    ]
    ,
    [
        {"situation_description" : "Transitive dependency/dependent execution is risky",
        "remedies": ["Turn transitive flags off unless explicitly justified"]},
        {
            "condition": "Disallow transitive dependencies",
            "attribute_path" : ["invocation_config", 0, "transitive_dependencies_included"],
            "values" : [true],
            "policy_type" : "blacklist"
        },
        {
            "condition": "Disallow transitive dependents",
            "attribute_path" : ["invocation_config", 0, "transitive_dependents_included"],
            "values" : [true],
            "policy_type" : "blacklist"
        }
    ]
    ,
    [
        {"situation_description" : "Scheduled workflows must specify a time zone",
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
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details



