package terraform.gcp.security.healthcare.dataset.time_zone
import data.terraform.gcp.security.healthcare.dataset.vars
import data.terraform.gcp.helpers

scenarios_list := [
    # SCENARIO 1
    [
        {
            "situation_description": "Non-compliant time_zone setting.",
            "remedies": ["Use UTC+10:00 as time_zone."]
        },
        {
            "condition": "non-compliant time_zone",
            "attribute_path": ["time_zone"],
            "values": ["UTC+5:00"],  # explicitly blacklist this
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(scenarios_list, vars.variables).message

details := helpers.get_multi_summary(scenarios_list, vars.variables).details