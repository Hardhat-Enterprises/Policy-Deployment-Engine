package terraform.gcp.security.firebase_app_hosting.google_firebase_app_hosting_backend.location

import data.terraform.helpers
import data.terraform.gcp.security.firebase_app_hosting.google_firebase_app_hosting_backend.vars

conditions := [
    [
    {"situation_description" : "Backend is deployed in non-approved geographic regions",
    "remedies":[ "Use only approved regions that comply with data residency requirements","Deploy in regions with proper security certifications","Avoid regions with potential geopolitical risks"]},
    {
        "condition": "Location should be in approved secure regions",
        "attribute_path" : ["location"],
        "values" : ["australia-southeast1-a", "australia-southeast1-b", "australia-southeast1-c", "australia-southeast2-a", "australia-southeast2-b", "australia-southeast2-c"],
        "policy_type" : "whitelist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details