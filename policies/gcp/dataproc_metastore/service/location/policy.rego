package terraform.gcp.security.dataproc_metastore.service.location
import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataproc_metastore.service.vars

conditions := [
    [
        {
            "situation_description": "Location must be set to an approved value",
            "remedies": ["Use an approved Australian location."]
        },
        {
             "condition": "location is in the allow list",
             "attribute_path": ["location"],
             "values": ["australia-southeast1", "australia-southeast2"],
             "policy_type": "whitelist"
        }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details