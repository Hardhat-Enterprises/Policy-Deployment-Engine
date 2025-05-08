package terraform.gcp.security.os_config.patch_deployment.time_window
import data.terraform.gcp.helpers
import data.terraform.gcp.security.os_config.patch_deployment.time_window.vars

# This policy ensures that patch deployments are not scheduled during business hours
# to minimize disruption to business operations

conditions := [
    [
    {"situation_description" : "Patch deployment is scheduled during business hours (8AM-5PM)",
    "remedies":[ "Schedule patch deployments outside of business hours (before 8AM or after 5PM)"]},
    {
        "condition": "Check if time_of_day is scheduled during business hours",
        "attribute_path" : ["recurring_schedule", "time_of_day", "hours"],
        "values" : [0, 7, 18, 23],
        "policy_type" : "range" 
    }
    ],
    [
    {"situation_description" : "Patch deployment must have a time_of_day specified",
    "remedies":[ "Add a time_of_day block to the recurring_schedule configuration"]},
    {
        "condition": "Check if time_of_day is defined",
        "attribute_path" : ["recurring_schedule", "time_of_day"],
        "values" : [null],
        "policy_type" : "blacklist"
    }
    ],
    [
    {"situation_description" : "Patch deployment must specify a time zone",
    "remedies":[ "Add a time_zone block to the recurring_schedule configuration"]},
    {
        "condition": "Check if time_zone is defined",
        "attribute_path" : ["recurring_schedule", "time_zone"],
        "values" : [null],
        "policy_type" : "blacklist"
    }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
details := helpers.get_multi_summary(conditions, vars.variables).details