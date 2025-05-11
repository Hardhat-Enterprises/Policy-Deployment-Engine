package terraform.gcp.security.iam.access_boundary_policy.display_name # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.access_boundary_policy.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL OUT THE VARS FILE FOR THIS RESOURCE (please)

# STEP 2: CREATE SCENARIOS (can be as simple (one condition) or as complex (multiple conditions) as you want)
scenarios_list:= [
    # SCENARIO 1
    [
        { 
            "situation_description" : "empty display_name", # name/description of the scenario
            "remedies": ["'display_name' should not be empty"] # fix messages
        },
        {
            "condition" : "c1: empty display_name", # condition name
            "attribute_path" : ["display_name"], # nested path
            "values" : [""], # value to be compared
            "policy_type" : "blacklist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        }
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

# use 'opa eval ... "data.terraform.<CSP>.security.<resource>.<attribute>.<...>.message" ...' for just the main non-compliant messages
message := summary.message

# use 'opa eval ... "data.terraform.<CSP>.security.<resource>.<attribute>.<...>.detail" ...' for all condition triggers and their explanations (troubleshooting)
detail := summary.details
