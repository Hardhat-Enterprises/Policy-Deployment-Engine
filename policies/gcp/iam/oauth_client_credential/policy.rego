package terraform.gcp.security.iam.oauth_client_credential # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.oauth_client_credential.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL OUT THE VARS FILE FOR THIS RESOURCE (please)

get_other_resource_type_values(other_resource_type, other_attribute) := values if {
    values := [v |
        some i
        v := object.get(input.planned_values.root_module.resources[i].values, other_attribute, null)
        object.get(input.planned_values.root_module.resources[i], "type", null) == other_resource_type
    ]
    trace(sprintf("%s", [values]))
}
# STEP 2: CREATE SCENARIOS (can be as simple (one condition) or as complex (multiple conditions) as you want)
scenarios_list:= [
    # SCENARIO 1
    [
        { 
            "situation_description" : "oauthclient does not exist!", # name/descriptiopn of the scenario
            "remedies": [
                "should be tied to an existing oauthclient!",
                "consider setting the value for 'oauthclient' in the form 'google_iam_oauth_client.[name of oauth client].oauth_client_id' instead of a hard-coded value!"
            ] # fix messages
        },
        {
            "condition" : "c1: oauthclient does not exist", # condition name
            "attribute_path" : ["oauthclient"], # nested path
            "values" : get_other_resource_type_values("google_iam_oauth_client", "oauth_client_id"), # value to be compared 
            "policy_type" : "whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

# use 'opa eval ... "data.terraform.<CSP>.security.<resource>.<attribute>.<...>.message" ...' for just the main non-compliant messages
message := summary.message

# use 'opa eval ... "data.terraform.<CSP>.security.<resource>.<attribute>.<...>.detail" ...' for all condition triggers and their explanations (troubleshooting)
detail := summary.details

