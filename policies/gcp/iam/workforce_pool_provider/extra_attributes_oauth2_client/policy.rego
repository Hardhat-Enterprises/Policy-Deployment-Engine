package terraform.gcp.security.iam.workforce_pool_provider.extra_attributes_oauth2_client
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
            "attribute_path" : ["extra_attributes_oauth2_client", 0, "client_id"], # nested path
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
            "attribute_path" : ["extra_attributes_oauth2_client", 0, "client_secret", 0, "value", 0, "plain_text"], # nested path
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
            "attribute_path" : ["extra_attributes_oauth2_client", 0, "issuer_uri"], # nested path
            "values" : ["*://*/", [["https"], ["login.microsoftonline.com"]]],
            "policy_type" : "pattern whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "unapproved query_parameters", # name/descriptiopn of the scenario
            "remedies": [
                "Unapproved query_parameters filter! Choose an approved one."
            ] # fix messages
        },
        {
            "condition" : "c1: unapproved query_parameters", # condition name
            "attribute_path" : ["extra_attributes_oauth2_client", 0, "query_parameters", 0, "filter"], # nested path
            "values" : ["mail:gcp"],
            "policy_type" : "whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "unsafe attribute_condition", # name/descriptiopn of the scenario
            "remedies": [
                "Unsafe attribute_condition! Please provide another in Common Expression Language!"
            ] # fix messages
        },
        {
            "condition" : "c1: unapproved query_parameters", # condition name
            "attribute_path" : ["attribute_condition"], # nested path
            "values" : ["true"],
            "policy_type" : "blacklist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)


message := summary.message


detail := summary.details

