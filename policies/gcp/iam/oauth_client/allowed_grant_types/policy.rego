package terraform.gcp.security.iam.oauth_client.allowed_grant_types # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.oauth_client.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL OUT THE VARS FILE FOR THIS RESOURCE (please)

# STEP 2: CREATE SCENARIOS (can be as simple (one condition) or as complex (multiple conditions) as you want)
scenarios_list:= [
    # SCENARIO 1
    [
        { 
            "situation_description" : "non-compliant allowed_grant_types", # name/descriptiopn of the scenario
            "remedies": ["allowed_grant_types should not be set to GRANT_TYPE_UNSPECIFIED"] # fix messages
        },
        {
            "condition" : "c1: allowed_grant_types set to GRANT_TYPE_UNSPECIFIED", # condition name
            "attribute_path" : ["allowed_grant_types"], # nested path
            "values" : ["GRANT_TYPE_UNSPECIFIED"], # value to be compared 
            "policy_type" : "blacklist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    # SCENARIO 1
    [
        { 
            "situation_description" : "allowed_grant_types not in approved list", # name/descriptiopn of the scenario
            "remedies": ["allowed_grant_types be in approved list!"] # fix messages
        },
        {
            "condition" : "c1: allowed_grant_types not in approved list", # condition name
            "attribute_path" : ["allowed_grant_types"], # nested path
            "values" : ["AUTHORIZATION_CODE_GRANT", "REFRESH_TOKEN_GRANT"], # value to be compared 
            "policy_type" : "whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

# use 'opa eval ... "data.terraform.<CSP>.security.<resource>.<attribute>.<...>.message" ...' for just the main non-compliant messages
message := summary.message

# use 'opa eval ... "data.terraform.<CSP>.security.<resource>.<attribute>.<...>.detail" ...' for all condition triggers and their explanations (troubleshooting)
detail := summary.details
