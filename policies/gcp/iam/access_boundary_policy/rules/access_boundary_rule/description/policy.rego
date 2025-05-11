package terraform.gcp.security.iam.access_boundary_policy.rules.description # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.access_boundary_policy.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL OUT THE VARS FILE FOR THIS RESOURCE (please)

# STEP 2: CREATE SCENARIOS (can be as simple (one condition) or as complex (multiple conditions) as you want)
scenarios_list:= [
    # SCENARIO 1
    [
        { 
            "situation_description" : "empty rules.description", # name/description of the scenario
            "remedies": ["rules.descriptions should not be empty"] # fix messages
        },
        {
            "condition" : "c1: empty rules.description", # condition name
            "attribute_path" : ["rules", 0, "description"], # nested path
            "values" : [""], # value to be compared 
            "policy_type" : "blacklist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
        {
            "condition" : "c2: this resource is abp-c", # condition name
            "attribute_path" : ["name"], # nested path
            "values" : ["abp-c"], # value to be compared
            "policy_type" : "blacklist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        }
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

# use 'opa eval ... "data.terraform.<CSP>.security.<resource>.<attribute>.<...>.message" ...' for just the main non-compliant messages
message := summary.message

# use 'opa eval ... "data.terraform.<CSP>.security.<resource>.<attribute>.<...>.detail" ...' for all condition triggers and their explanations (troubleshooting)
detail := summary.details
