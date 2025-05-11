package terraform.gcp.security.iam.workload_identity_pool.disabled
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.workload_identity_pool.vars

scenarios_list:= [
    # SCENARIO 1
    [
        { 
            "situation_description" : "is disabled", # name/descriptiopn of the scenario
            "remedies": [
                "workload_identity_pool is disabled?"
            ] # fix messages
        },
        {
            "condition" : "c1: is disabled", # condition name
            "attribute_path" : ["disabled"], # nested path
            "values" : [false],
            "policy_type" : "whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)


message := summary.message


detail := summary.details

