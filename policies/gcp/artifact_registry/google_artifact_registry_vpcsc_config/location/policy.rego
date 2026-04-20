package terraform.gcp.security.artifact_registry.google_artifact_registry_vpcsc_config.location
import data.terraform.helpers
import data.terraform.gcp.security.artifact_registry.google_artifact_registry_vpcsc_config.vars


conditions := [
    [
    {"situation_description" : "Artifact Registry VPC SC configuration is being applied in an unapproved location.",
    "remedies":[ "Change the location to an approved region."]},
    {
        "condition": "Location should be in approved secure regions",
        "attribute_path" : ["location"],
        "values" : ["australia-southeast1-a", "australia-southeast1-b", "australia-southeast1-c", "australia-southeast2-a", "australia-southeast2-b", "australia-southeast2-c"],
        "policy_type" : "whitelist"
    }
    ]
]


result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details