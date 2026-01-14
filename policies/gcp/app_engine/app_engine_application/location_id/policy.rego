package terraform.gcp.security.app_engine.app_engine_application.location_id
import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.app_engine_application.vars

conditions := [
    [
        {"situation_description" : "App Engine application is being deployed within an unapproved region",
         "remedies":[ "Location should be an approved region, e.g., australia-southeast1"]},
        {
            "condition": "Check if location_id is allowed",
            "attribute_path": ["location_id"],
            "values" : ["australia-southeast1", "australia-southeast2"],
            "policy_type" : "whitelist"
        }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details