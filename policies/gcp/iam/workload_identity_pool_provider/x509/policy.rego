package terraform.gcp.security.iam.workload_identity_pool_provider.x509
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.workload_identity_pool_provider.vars

scenarios_list:= [
    # SCENARIO 1
    [
        { 
            "situation_description" : "unapproved intermediate_cas pem_certificate", # name/descriptiopn of the scenario
            "remedies": [
                "unapproved intermediate_cas pem_certificate. Please consider input of the form 'file(..)' instead of hardcoding!"
            ] # fix messages
        },
        {
            "condition" : "c1: unapproved intermediate_cas pem_certificate", # condition name
            "attribute_path" : ["x509", 0, "trust_store", 0, "intermediate_cas", 0, "pem_certificate"], # nested path
            "values" : ["*[(]", [["file"]]],
            "policy_type" : "pattern whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "unapproved trust_anchors pem_certificate", # name/descriptiopn of the scenario
            "remedies": [
                "unapproved trust_anchors pem_certificate. Please consider input of the form 'file(..)' instead of hardcoding!"
            ] # fix messages
        },
        {
            "condition" : "c1: unapproved trust_anchors pem_certificate", # condition name
            "attribute_path" : ["x509", 0, "trust_store", 0, "trust_anchors", 0, "pem_certificate"], # nested path
            "values" : ["*[(]", [["file"]]],
            "policy_type" : "pattern whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)


message := summary.message


detail := summary.details

