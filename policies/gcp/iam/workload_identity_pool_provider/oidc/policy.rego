package terraform.gcp.security.iam.workload_identity_pool_provider.oidc
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
            "values" : ["https://sts.windows.net/azure-tenant-id"],
            "policy_type" : "whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "unapproved allowed_audiences", # name/descriptiopn of the scenario
            "remedies": [
                "Unapproved oidc allowed_audiences! Please choose from approved list!"
            ] # fix messages
        },
        {
            "condition" : "c1: unapproved allowed_audiences", # condition name
            "attribute_path" : ["oidc", 0, "allowed_audiences"], # nested path
            "values" : ["https://example.com/gcp-oidc-federation", "example.com/gcp-oidc-federation"],
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
            "attribute_path" : ["oidc", 0, "jwkJson"], # nested path
            "values" : [null],
            "policy_type" : "whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)


message := summary.message


detail := summary.details

