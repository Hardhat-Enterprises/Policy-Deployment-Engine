package terraform.gcp.security.iam.workload_identity_pool_provider.github_actions
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.workload_identity_pool_provider.vars

scenarios_list:= [
    # SCENARIO 1
    [
        { 
            "situation_description" : "unapproved oidc uri", # name/descriptiopn of the scenario
            "remedies": [
                "Unapproved oidc uri! Please check uri."
            ] # fix messages
        },
        {
            "condition" : "c1: unapproved oidc uri", # condition name
            "attribute_path" : ["oidc", 0, "issuer_uri"], # nested path
            "values" : ["https://token.actions.githubusercontent.com"],
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
            "values" : ["*[.]*", [["assertion"], ["sub"]]],
            "policy_type" : "pattern whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "unapproved attribute.actor", # name/descriptiopn of the scenario
            "remedies": [
                "Unapproved attribute.actor Please use 'assertion' for given json from provider!"
            ] # fix messages
        },
        {
            "condition" : "c1: unapproved attribute.actor", # condition name
            "attribute_path" : ["attribute_mapping", "attribute.actor"], # nested path
            "values" : ["*[.]*", [["assertion"], ["actor"]]],
            "policy_type" : "pattern whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "unapproved attribute.aud", # name/descriptiopn of the scenario
            "remedies": [
                "Unapproved attribute.aud! Please use 'assertion' for given json from provider!"
            ] # fix messages
        },
        {
            "condition" : "c1: unapproved attribute.aud", # condition name
            "attribute_path" : ["attribute_mapping", "attribute.aud"], # nested path
            "values" : ["*[.]*", [["assertion"], ["aud"]]],
            "policy_type" : "pattern whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "unapproved attribute.repository", # name/descriptiopn of the scenario
            "remedies": [
                "Unapproved attribute.repository! Please use 'assertion' for given json from provider!"
            ] # fix messages
        },
        {
            "condition" : "c1: unapproved attribute.repository", # condition name
            "attribute_path" : ["attribute_mapping", "attribute.repository"], # nested path
            "values" : ["*[.]*", [["assertion"], ["repository"]]],
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
            "values" : ["true"],
            "policy_type" : "blacklist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "jwkJson is present!", # name/descriptiopn of the scenario
            "remedies": [
                "jwkJson is present! There's no need to use it."
            ] # fix messages
        },
        {
            "condition" : "c1: jwkJson is not null", # condition name
            "attribute_path" : ["oidc", 0, "jwkJson"], # nested path
            "values" : [null],
            "policy_type" : "whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)


message := summary.message


detail := summary.details

