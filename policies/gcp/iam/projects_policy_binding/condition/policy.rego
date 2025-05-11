package terraform.gcp.security.iam.projects_policy_binding.condition # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.projects_policy_binding.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL OUT THE VARS FILE FOR THIS RESOURCE (please)

# STEP 2: CREATE SCENARIOS (can be as simple (one condition) or as complex (multiple conditions) as you want)
scenarios_list:= [
    # SCENARIO 1
    [
        { 
            "situation_description" : "unsupported policy_kind", # name/descriptiopn of the scenario
            "remedies": [
                "Currently 'condition' only supports 'PRINCIPAL_ACCESS_BOUNDARY' as a policy_kind value!"
            ] # fix messages
        },
        {
            "condition" : "c1: unsupported policy_kind", # condition name
            "attribute_path" : ["policy_kind"], # nested path
            "values" : ["PRINCIPAL_ACCESS_BOUNDARY"],
            "policy_type" : "whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    # SCENARIO 2
    [
        { 
            "situation_description" : "null condition", # name/descriptiopn of the scenario
            "remedies": [
                "The 'condition' block has been left empty. Please specifiy a secure condition!"
            ] # fix messages
        },
        {
            "condition" : "c1: empty/null condition", # condition name
            "attribute_path" : ["condition"], # nested path
            "values" : ["null"],
            "policy_type" : "blacklist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    # SCENARIO 3
    [
        { 
            "situation_description" : "condition contains empty expression", # name/descriptiopn of the scenario
            "remedies": [
                "condition.expression has been left empty. Please specify an expression in Common Expression Language!"
            ] # fix messages
        },
        {
            "condition" : "c1: empty/null condition.expression", # condition name
            "attribute_path" : ["condition", 0, "expression"], # nested path
            "values" : [""],
            "policy_type" : "blacklist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    # SCENARIO 4
    [
        { 
            "situation_description" : "condition.expression supported principal.type", # name/descriptiopn of the scenario
            "remedies": [
                "condition.expression principal.type must be one of the following: [iam.googleapis.com/WorkspaceIdentity, iam.googleapis.com/WorkforcePoolIdentity, iam.googleapis.com/WorkloadPoolIdentity, iam.googleapis.com/ServiceAccount]"
            ] # fix messages
        },
        {
            "condition" : "c1: condition.expression contains principal.type", # condition name
            "attribute_path" : ["condition", 0, "expression"], # nested path
            #"values" : ["principal[.]type == 'iam[.]googleapis[.]com/*'", [["WorkspaceIdentity", "WorkforcePoolIdentity", "WorkloadPoolIdentity", "ServiceAccount"]]],
            "values" : ["principal[.]* ==", [["type"]]],
            "policy_type" : "pattern blacklist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
        {
            "condition" : "c2: condition.expression contains principal.type", # condition name
            "attribute_path" : ["condition", 0, "expression"], # nested path
            "values" : ["principal[.]type == 'iam[.]googleapis[.]com/*'", [["WorkspaceIdentity", "WorkforcePoolIdentity", "WorkloadPoolIdentity", "ServiceAccount"]]],
            "policy_type" : "pattern whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

# use 'opa eval ... "data.terraform.<CSP>.security.<resource>.<attribute>.<...>.message" ...' for just the main non-compliant messages
message := summary.message

# use 'opa eval ... "data.terraform.<CSP>.security.<resource>.<attribute>.<...>.detail" ...' for all condition triggers and their explanations (troubleshooting)
detail := summary.details

