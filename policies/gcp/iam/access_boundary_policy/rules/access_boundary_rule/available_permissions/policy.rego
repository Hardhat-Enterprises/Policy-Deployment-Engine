package terraform.gcp.security.iam.access_boundary_policy.rules.access_boundary_rule.available_permissions # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.access_boundary_policy.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL OUT THE VARS FILE FOR THIS RESOURCE (please)

# STEP 2: CREATE SCENARIOS (can be as simple (one condition) or as complex (multiple conditions) as you want)
scenarios_list:= [
    # SCENARIO 1
    [
        { 
            "situation_description" : "not in approved list of conditions", # name/description of the scenario
            "remedies": ["rules.access_boundary_rule.available_permissions should be from approved list"] # fix messages
        },
        {
            "condition" : "c1: empty rules.access_boundary_rule.available_condition.description", # condition name
            "attribute_path" : ["rules", 0, "access_boundary_rule", 0, "available_permissions"], # nested path
            "values" : ["write", "read"], # value to be compared 
            "policy_type" : "whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

# use 'opa eval ... "data.terraform.<CSP>.security.<resource>.<attribute>.<...>.message" ...' for just the main non-compliant messages
message := summary.message

# use 'opa eval ... "data.terraform.<CSP>.security.<resource>.<attribute>.<...>.detail" ...' for all condition triggers and their explanations (troubleshooting)
detail := summary.details
