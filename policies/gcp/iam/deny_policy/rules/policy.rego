package terraform.gcp.security.iam.deny_policy.rules # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.deny_policy.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL OUT THE VARS FILE FOR THIS RESOURCE (please)

approved_denied_permissions_list = ["cloudresourcemanager.googleapis.com/projects.update", "cloudresourcemanager.googleapis.com/projects.delete", "cloudresourcemanager.googleapis.com/projects.get"]
approved_exception_permissions_list = ["cloudresourcemanager.googleapis.com/projects.get"]
# STEP 2: CREATE SCENARIOS (can be as simple (one condition) or as complex (multiple conditions) as you want)
scenarios_list:= [
    # SCENARIO 1
    [
        { 
            "situation_description" : "1 empty description", # name/description of the scenario
            "remedies": ["Please provide a description for this rule"] # fix messages
        },
        {
            "condition" : "c1: empty rules.description", # condition name
            "attribute_path" : ["rules", 0, "description"], # nested path
            "values" : [""], # value to be compared 
            "policy_type" : "blacklist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "2 empty rules.deny_rule.denial_condition.descirption", # name/description of the scenario
            "remedies": ["Please provide a description for this expression"] # fix messages
        },
        {
            "condition" : "c2: empty rules.deny_rule.denial_condition.description", # condition name
            "attribute_path" : ["rules", 0, "deny_rule", 0, "denial_condition", 0, "description"], # nested path
            "values" : [""], # value to be compared 
            "policy_type" : "blacklist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "3 empty rules.deny_rule.denial_condition.expression", # name/description of the scenario
            "remedies": ["rules.deny_rule.denial_condition.expression should not be empty, and should be in Common Expression Language"] # fix messages
        },
        {
            "condition" : "c3: empty rules.deny_rule.denial_condition.expression", # condition name
            "attribute_path" : ["rules", 0, "deny_rule", 0, "denial_condition", 0, "expression"], # nested path
            "values" : [""], # value to be compared 
            "policy_type" : "blacklist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "4 empty rules.deny_rule.denial_condition.location", # name/description of the scenario
            "remedies": ["Please provide the location of possible errors for debugging"] # fix messages
        },
        {
            "condition" : "c4: empty rules.deny_rule.denial_condition.location", # condition name
            "attribute_path" : ["rules", 0, "deny_rule", 0, "denial_condition", 0, "location"], # nested path
            "values" : [""], # value to be compared 
            "policy_type" : "blacklist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "5 empty rules.deny_rule.denial_condition.title", # name/description of the scenario
            "remedies": ["Please provide a title for this expression"] # fix messages
        },
        {
            "condition" : "c5: empty rules.deny_rule.denial_condition.title", # condition name
            "attribute_path" : ["rules", 0, "deny_rule", 0, "denial_condition", 0, "title"], # nested path
            "values" : [""], # value to be compared 
            "policy_type" : "blacklist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "6 empty rules.deny_rule.denial_condition.location", # name/description of the scenario
            "remedies": ["Please provide the location of possible errors for debugging!"] # fix messages
        },
        {
            "condition" : "c6: empty rules.deny_rule.denial_condition.location", # condition name
            "attribute_path" : ["rules", 0, "deny_rule", 0, "denial_condition", 0, "location"], # nested path
            "values" : [""], # value to be compared 
            "policy_type" : "blacklist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "7 unapproved permissions in denied_permissions list", # name/description of the scenario
            "remedies": ["Permissions in denied_permissions should be from approved list!"] # fix messages
        },
        {
            "condition" : "c7: unapproved permissions in denied_permissions list", # condition name
            "attribute_path" : ["rules", 0, "deny_rule", 0, "denied_permissions"], # nested path
            "values" : approved_denied_permissions_list, # value to be compared 
            "policy_type" : "whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "8 permissions in denied_permissions list same as in exception_permissions", # name/description of the scenario
            "remedies": ["Permissions in denied_permissions should be different (otherwise they do not get denied)!"] # fix messages
        },
        {
            "condition" : "c8: permissions in denied_permissions", # condition name
            "attribute_path" : ["rules", 0, "deny_rule", 0, "denied_permissions"], # nested path
            "values" : approved_exception_permissions_list, # value to be compared 
            "policy_type" : "blacklist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
        {
            "condition" : "c9: permissions in exception_permissions", # condition name
            "attribute_path" : ["rules", 0, "deny_rule", 0, "exception_permissions"], # nested path
            "values" : approved_denied_permissions_list, # value to be compared 
            "policy_type" : "blacklist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "9 exception_principals group set to public", # name/description of the scenario
            "remedies": ["exception_principals group should NOT be set to public!"] # fix messages
        },
        {
            "condition" : "c10: exception_principals group set to public", # condition name
            "attribute_path" : ["rules", 0, "deny_rule", 0, "exception_principals"], # nested path
            "values" : ["principalSet://goog/public:all"], # value to be compared 
            "policy_type" : "whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "exception_principals group should only be from approved list", # name/description of the scenario
            "remedies": ["exception_principals group should be from approved list!"] # fix messages
        },
        {
            "condition" : "c11: exception_principals group from approved list", # condition name
            "attribute_path" : ["rules", 0, "deny_rule", 0, "exception_principals"], # nested path
            "values" : ["principalSet://goog/group/*", [["admins@company.com", "owners@company.com"]]], # value to be compared 
            "policy_type" : "pattern whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "exception_principals single google account should only be from approved list", # name/description of the scenario
            "remedies": ["exception_principals single google account should be from an approved list!"] # fix messages
        },
        {
            "condition" : "c12: exception_principals single google account from approved list", # condition name
            "attribute_path" : ["rules", 0, "deny_rule", 0, "exception_principals"], # nested path
            "values" : ["principal://goog/subject/*", [["admins@company.com", "owners@company.com"]]], # value to be compared 
            "policy_type" : "pattern whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    [
        { 
            "situation_description" : "exception_principals single service account should only be from approved list", # name/description of the scenario
            "remedies": ["exception_principals single service account should be from an approved list!"] # fix messages
        },
        {
            "condition" : "c13: exception_principals single service account from approved list", # condition name
            "attribute_path" : ["rules", 0, "deny_rule", 0, "exception_principals"], # nested path
            "values" : ["principal://iam[.]googleapis[.]com/projects/-/serviceAccounts/*", [["admins@iam.gserviceaccount.com", "owners@iam.gserviceaccount.com"]]], # value to be compared 
            "policy_type" : "pattern whitelist" # policy type(s): blacklist, whitelist, range, pattern blacklist, pattern whitelist
        },
    ],
    
    
    

]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

# use 'opa eval ... "data.terraform.<CSP>.security.<resource>.<attribute>.<...>.message" ...' for just the main non-compliant messages
message := summary.message

# use 'opa eval ... "data.terraform.<CSP>.security.<resource>.<attribute>.<...>.detail" ...' for all condition triggers and their explanations (troubleshooting)
detail := summary.details
