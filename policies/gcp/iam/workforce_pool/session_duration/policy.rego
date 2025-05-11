package terraform.gcp.security.iam.workforce_pool.session_duration
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.workforce_pool.vars

scenarios_list:= [
    # SCENARIO 1
    [
        { 
            "situation_description" : "unapproved session_duration", # name/descriptiopn of the scenario
            "remedies": [
                "session_duration should be between 900s and 43200s!"
            ] # fix messages
        },
        {
            "condition" : "c1: unapproved session_duration", # condition name
            "attribute_path" : ["session_duration"], # nested path
            "values" : [900, 43200],
            "policy_type" : "range" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)


message := summary.message


detail := summary.details

