package terraform.gcp.security.artifact_registry.google_artifact_registry_vpcsc_config.vpcsc_policy # Edit here 
import data.terraform.helpers
import data.terraform.gcp.security.artifact_registry.google_artifact_registry_vpcsc_config.vars


conditions := [
    [
    {"situation_description" : "Artifact Registry VPC Service Controls policy is not set to DENY, reducing protection against data exfiltration from the registry.",
    "remedies":[ "Set vpcsc_policy to DENY."]},
    {
        "condition": "Require VPCSC policy to be DENY",
        "attribute_path" : ["vpcsc_policy"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["DENY"], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details