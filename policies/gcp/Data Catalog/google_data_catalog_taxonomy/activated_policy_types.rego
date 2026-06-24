package terraform.gcp.security.google_data_catalog.google_data_catalog_taxonomy.activated_policy_types
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_taxonomy.vars

conditions := [
    [
    {"situation_description" : "Data Catalog taxonomy does not enable fine-grained access control.",
    "remedies":["Enable FINE_GRAINED_ACCESS_CONTROL for the taxonomy."]},
    {
        "condition": "Activated policy types must not be empty",
        "attribute_path" : ["activated_policy_types"],
        "values" : [[]],
        "policy_type" : "blacklist"
    },
    {
        "condition": "Activated policy types must include fine-grained access control.",
        "attribute_path" : ["activated_policy_types"],
        "values" : ["FINE_GRAINED_ACCESS_CONTROL"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
