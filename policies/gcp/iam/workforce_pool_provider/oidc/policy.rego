package terraform.gcp.security.iam.workforce_pool_provider.oidc
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.workforce_pool_provider.vars

scenarios_list:= [
    # SCENARIO 1
    [
        { 
            "situation_description" : "unapproved client_id", # name/descriptiopn of the scenario
            "remedies": [
                "Please choose from approved client_id list!"
            ] # fix messages
        },
        {
            "condition" : "c1: unapproved client_id", # condition name
            "attribute_path" : ["oidc", 0, "client_id"], # nested path
            "values" : ["client-id"],
            "policy_type" : "whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "client_secret is plaintext", # name/descriptiopn of the scenario
            "remedies": [
                "client_secret is plaintext! You should consider something like 'var.xxx' or something similar"
            ] # fix messages
        },
        {
            "condition" : "c1: client_secret is plaintext", # condition name
            "attribute_path" : ["oidc", 0, "client_secret", 0, "value", 0, "plain_text"], # nested path
            "values" : ["*[.]", [["var", "env"]]],
            "policy_type" : "pattern whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "unapproved issuer uri", # name/descriptiopn of the scenario
            "remedies": [
                "Unapproved issuer! Choose an approved one."
            ] # fix messages
        },
        {
            "condition" : "c1: unapproved issuer", # condition name
            "attribute_path" : ["oidc", 0, "issuer_uri"], # nested path
            "values" : ["*://*/", [["https"], ["login.microsoftonline.com"]]],
            "policy_type" : "pattern whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "unsafe web_sso_config.response_type", # name/descriptiopn of the scenario
            "remedies": [
                "Unsafe web_sso_config.response_type! Please use 'CODE' instead!"
            ] # fix messages
        },
        {
            "condition" : "c1: unsafe web_sso_config.response_type", # condition name
            "attribute_path" : ["oidc", 0, "web_sso_config", 0, "response_type"], # nested path
            "values" : ["CODE"],
            "policy_type" : "whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "unsafe web_sso_config.assertion_claims_behavior", # name/descriptiopn of the scenario
            "remedies": [
                "Unsafe web_sso_config.assertion_claims_behavior! Please use 'MERGE_USER_INFO_OVER_ID_TOKEN_CLAIMS' instead!"
            ] # fix messages
        },
        {
            "condition" : "c1: unsafe web_sso_config.response_type", # condition name
            "attribute_path" : ["oidc", 0, "web_sso_config", 0, "assertion_claims_behavior"], # nested path
            "values" : ["MERGE_USER_INFO_OVER_ID_TOKEN_CLAIMS"],
            "policy_type" : "whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "unsafe web_sso_config.additional_scopes", # name/descriptiopn of the scenario
            "remedies": [
                "Unsafe web_sso_config.additional_scopes! Please choose from approved list of scopes instead!"
            ] # fix messages
        },
        {
            "condition" : "c1: unsafe web_sso_config.response_type", # condition name
            "attribute_path" : ["oidc", 0, "web_sso_config", 0, "additional_scopes"], # nested path
            "values" : ["groups", "roles", "openid", "email", "profile"],
            "policy_type" : "whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
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
            "attribute_path" : ["oidc", 0, "web_sso_config", 0, "jwkJson"], # nested path
            "values" : [null],
            "policy_type" : "whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)


message := summary.message


detail := summary.details

