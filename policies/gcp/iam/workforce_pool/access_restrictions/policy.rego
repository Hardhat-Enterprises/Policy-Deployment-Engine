package terraform.gcp.security.iam.workforce_pool.access_restrictions
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.workforce_pool.vars

scenarios_list:= [
    # SCENARIO 1
    [
        { 
            "situation_description" : "unsupported service domain", # name/descriptiopn of the scenario
            "remedies": [
                "Please choose from an approved domain to give access to!"
            ] # fix messages
        },
        {
            "condition" : "c1: unapproved domain", # condition name
            "attribute_path" : ["access_restrictions", 0, "allowed_services", 0, "domain"], # nested path
            "values" : ["org.domain.xyz", "org.domain.x"],
            "policy_type" : "whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "disable_programmatic_signin ENABLED (bad)", # name/descriptiopn of the scenario
            "remedies": [
                "Please disable 'disable_programmatic_signin' (keep value as false)!"
            ] # fix messages
        },
        {
            "condition" : "c1: unapproved domain", # condition name
            "attribute_path" : ["access_restrictions", 0, "disable_programmatic_signin"], # nested path
            "values" : [false],
            "policy_type" : "whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)


message := summary.message


detail := summary.details

