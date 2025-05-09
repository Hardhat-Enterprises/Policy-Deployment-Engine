package terraform.gcp.security.clouddns.dns_managed_zone.managed_zone_basic # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.clouddns.dns_managed_zone.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
    {
        "situation_description" : "dns_managed_zone",
        "remedies":[ "disallows unauthorised namespace"]},
    {
        "condition": "Identifies valid dns namespace",
        "attribute_path" : ["parent"], 
        "values" : ["PDE.example.com"], 
        "policy_type" : "whitelist"
    }
    ]
]
    
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"
details := helpers.get_multi_summary(conditions, vars.variables).details