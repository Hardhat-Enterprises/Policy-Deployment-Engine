package terraform.gcp.security.artifact_registry.google_artifact_registry_repository.approved_locations # Edit here 
import data.terraform.helpers
import data.terraform.gcp.security.artifact_registry.google_artifact_registry_repository.vars


conditions := [
    [
    {"situation_description" : "Artifact Registry VPC SC configuration is being applied in an unapproved location.",
    "remedies":[ "Change the location to an approved region."]},
    {
        "condition": "Location should be in approved secure regions",
        "attribute_path" : ["location"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["australia-southeast1-a", "australia-southeast1-b", "australia-southeast1-c", "australia-southeast2-a", "australia-southeast2-b", "australia-southeast2-c"], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details

