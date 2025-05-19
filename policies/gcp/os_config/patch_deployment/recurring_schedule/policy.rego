package terraform.gcp.security.os_config.patch_deployment.recurring_schedule
import data.terraform.gcp.helpers
import data.terraform.gcp.security.os_config.patch_deployment.vars

# This policy ensures that patch deployments have a properly configured recurring schedule
# to ensure regular and timely patching of systems

conditions := [
    [
        # Target for next sem
        #{
        #    "situation_description" : "Patch deployment does not have a recurring schedule configured",
        #    "remedies":[ "Configure a recurring schedule for the patch deployment to ensure regular patching"]
        #},
        #{
        #    "condition": "Check if recurring_schedule is defined",
        #    "attribute_path" : ["recurring_schedule"],
        #    "values" : [null],
        #    "policy_type" : "blacklist"
        #}
    ],
    [
        {
            "situation_description" : "Patch deployment frequency is set to more than 7 days",
            "remedies":[ "Configure the patch deployment to run at least weekly (once every 7 days or less)"]
        },
        {
            "condition": "Check if weekly_recurrence is configured with a frequency of 7 days or less",
            "attribute_path" : ["recurring_schedule", 0, "weekly", 0, "day_of_week"],
            "values" : ["MONDAY"],
            "policy_type" : "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details