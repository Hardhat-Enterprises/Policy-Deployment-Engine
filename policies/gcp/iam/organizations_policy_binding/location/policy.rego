package terraform.gcp.security.iam.organizations_policy_binding.location # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.organizations_policy_binding.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL OUT THE VARS FILE FOR THIS RESOURCE (please)

# STEP 2: CREATE SCENARIOS (can be as simple (one condition) or as complex (multiple conditions) as you want)
scenarios_list:= [
    # SCENARIO 1
    [
        { 
            "situation_description" : "unsupported location", # name/descriptiopn of the scenario
            "remedies": [
                "Currently only 'global' is supported as a location value."
            ] # fix messages
        },
        {
            "condition" : "c1: unsupported location", # condition name
            "attribute_path" : ["location"], # nested path
            "values" : ["global"],
            "policy_type" : "whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

# use 'opa eval ... "data.terraform.<CSP>.security.<resource>.<attribute>.<...>.message" ...' for just the main non-compliant messages
message := summary.message

# use 'opa eval ... "data.terraform.<CSP>.security.<resource>.<attribute>.<...>.detail" ...' for all condition triggers and their explanations (troubleshooting)
detail := summary.details

