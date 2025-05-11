package terraform.gcp.security.iam.workforce_pool.disabled
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.workforce_pool.vars

scenarios_list:= [
    # SCENARIO 1
    [
        { 
            "situation_description" : "disabled", # name/descriptiopn of the scenario
            "remedies": [
                "WorkforcePool is disabled?"
            ] # fix messages
        },
        {
            "condition" : "c1: disabled", # condition name
            "attribute_path" : ["disabled"], # nested path
            "values" : [false],
            "policy_type" : "whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)


message := summary.message


detail := summary.details

