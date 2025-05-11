package terraform.gcp.security.iam.oauth_client.allowed_redirect_uris # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.oauth_client.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL OUT THE VARS FILE FOR THIS RESOURCE (please)

# STEP 2: CREATE SCENARIOS (can be as simple (one condition) or as complex (multiple conditions) as you want)
scenarios_list:= [
    # SCENARIO 1
    [
        { 
            "situation_description" : "non-compliant allowed_redirect_uris", # name/descriptiopn of the scenario
            "remedies": ["allowed_redirect_uris should be in approved list!"] # fix messages
        },
        {
            "condition" : "c1: allowed_redirect_uris not in approved list", # condition name
            "attribute_path" : ["allowed_redirect_uris"], # nested path
            "values" : ["https://www.compliant.com", "https://www.org.com", "https://www.compliant-2.com"], # value to be compared 
            "policy_type" : "whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

# use 'opa eval ... "data.terraform.<CSP>.security.<resource>.<attribute>.<...>.message" ...' for just the main non-compliant messages
message := summary.message

# use 'opa eval ... "data.terraform.<CSP>.security.<resource>.<attribute>.<...>.detail" ...' for all condition triggers and their explanations (troubleshooting)
detail := summary.details
