package terraform.gcp.security.iam.workforce_pool.parent
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.workforce_pool.vars

scenarios_list:= [
    # SCENARIO 1
    [
        { 
            "situation_description" : "unapproved parent", # name/descriptiopn of the scenario
            "remedies": [
                "Please choose from approved parent list!"
            ] # fix messages
        },
        {
            "condition" : "c1: unapproved parent", # condition name
            "attribute_path" : ["parent"], # nested path
            "values" : ["organizations/org"],
            "policy_type" : "whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)


message := summary.message


detail := summary.details

