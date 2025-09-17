package terraform.gcp.security.dataproc.autoscaling_policy.cost_and_availability_checks

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataproc.autoscaling_policy.vars

conditions := [
    [
        {"situation_description" : "The maximum number of primary workers is too high, creating a risk of excessive costs.",
         "remedies": [ "Set 'worker_config.max_instances' to 100 or less to control potential spending."]},
        {
            "condition": "Checks if the maximum number of primary worker instances is greater than 100.",
            "attribute_path" : ["worker_config", 0, "max_instances"],
            "values" : [null, 100],
            "policy_type" : "range"
        }
    ],
    [
        {"situation_description" : "The minimum number of primary workers is set below 2, risking poor performance.",
         "remedies": [ "Set 'worker_config.min_instances' to 2 or more to ensure a baseline level of availability."]},
        {
            "condition": "Checks if the minimum number of primary worker instances is less than 2.",
            "attribute_path" : ["worker_config", 0, "min_instances"],
            "values" : [2, null],
            "policy_type" : "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details