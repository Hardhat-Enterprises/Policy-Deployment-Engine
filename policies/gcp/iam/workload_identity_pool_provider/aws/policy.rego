package terraform.gcp.security.iam.workload_identity_pool_provider.aws
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.workload_identity_pool_provider.vars

scenarios_list:= [
    # SCENARIO 1
    [
        { 
            "situation_description" : "unapproved aws account", # name/descriptiopn of the scenario
            "remedies": [
                "Unapproved aws account id! Please choose from approved list!"
            ] # fix messages
        },
        {
            "condition" : "c1: unapproved aws account", # condition name
            "attribute_path" : ["aws", 0, "account_id"], # nested path
            "values" : ["compliant-aws-id", "compliant-aws-id-1", "compliant-aws-id-2"],
            "policy_type" : "whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "unapproved google.subject", # name/descriptiopn of the scenario
            "remedies": [
                "Unapproved google.subject! Please use 'assertion' for given json from provider!"
            ] # fix messages
        },
        {
            "condition" : "c1: unapproved google.subject", # condition name
            "attribute_path" : ["attribute_mapping", "google.subject"], # nested path
            "values" : ["*[.]*", [["assertion"], ["arn"]]],
            "policy_type" : "pattern whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "unapproved attribute.aws_account", # name/descriptiopn of the scenario
            "remedies": [
                "Unapproved attribute.aws_account! Please use 'assertion' for given json from provider!"
            ] # fix messages
        },
        {
            "condition" : "c1: unapproved attribute.aws_account", # condition name
            "attribute_path" : ["attribute_mapping", "attribute.aws_account"], # nested path
            "values" : ["*[.]*", [["assertion"], ["account"]]],
            "policy_type" : "pattern whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "unapproved attribute.environment", # name/descriptiopn of the scenario
            "remedies": [
                "Unapproved attribute.environment! Please use 'assertion' for given json from provider, followed by code!"
            ] # fix messages
        },
        {
            "condition" : "c1: unapproved attribute.environment", # condition name
            "attribute_path" : ["attribute_mapping", "attribute.environment"], # nested path
            "values" : ["*[.]*[.]*[(]", [["assertion"], ["arn"], ["contains"]]],
            "policy_type" : "pattern whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "unapproved attribute_condition", # name/descriptiopn of the scenario
            "remedies": [
                "Unapproved attribute_condition! Should not be 'true'!"
            ] # fix messages
        },
        {
            "condition" : "c1: unapproved attribute_condition", # condition name
            "attribute_path" : ["attribute_condition"], # nested path
            "values" : [true],
            "policy_type" : "blacklist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)


message := summary.message


detail := summary.details

