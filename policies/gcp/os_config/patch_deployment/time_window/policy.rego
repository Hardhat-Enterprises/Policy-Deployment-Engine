package terraform.gcp.security.os_config.patch_deployment.time_window
import data.terraform.gcp.helpers
import data.terraform.gcp.security.os_config.patch_deployment.vars

# This policy ensures that patch deployments are not scheduled during business hours
# to minimize disruption to business operations

conditions := [
    [
        {
            "situation_description" : "Patch deployment is scheduled during business hours (8AM-5PM)",
            "remedies":[ "Schedule patch deployments outside of business hours (before 8AM or after 5PM)"]
        },
        {
            "condition": "Check if time_of_day is scheduled during business hours",
            "attribute_path" : ["recurring_schedule", 0, "time_of_day", 0, "hours"],
            "values" : [0, 8],
            "policy_type" : "range"
        },
        {
            "condition": "Check if time_of_day is scheduled during business hours",
            "attribute_path" : ["recurring_schedule", 0, "time_of_day", 0, "hours"],
            "values" : [18, 24],
            "policy_type" : "range"
        }
    ],
    [
        # Target for next sem
        #{
        #    "situation_description" : "Patch deployment must have a time_of_day specified",
        #    "remedies":[ "Add a time_of_day block to the recurring_schedule configuration"]
        #},
        #{
        #    "condition": "Check if time_of_day is defined",
        #    "attribute_path" : ["recurring_schedule", 0, "time_of_day", 0],
        #    "values" : [null],
        #    "policy_type" : "blacklist"
        #}
    ],
    [
        {
            "situation_description" : "Patch deployment must specify a time zone",
            "remedies":[ "Add a time_zone block to the recurring_schedule configuration"]
        },
        {
            "condition": "Check if time_zone is defined",
            "attribute_path" : ["recurring_schedule", 0, "time_zone", 0, "id"],
            "values" : ["USA/New York"],
            "policy_type" : "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details