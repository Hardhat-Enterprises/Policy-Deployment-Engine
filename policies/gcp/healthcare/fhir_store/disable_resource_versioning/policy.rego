package terraform.gcp.security.healthcare.fhir_store.disable_resource_versioning
import data.terraform.gcp.security.healthcare.fhir_store.vars
import data.terraform.gcp.helpers

scenarios_list := [
    [
        {
            "situation_description": "Non-compliant 'disable_resource_versioning' setting.",
            "remedies": ["Set 'disable_resource_versioning' to false to retain a versioned history of all FHIR resources."]
        },
        {
            "condition": "Only 'false' is allowed for disable_resource_versioning",
            "attribute_path": ["disable_resource_versioning"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(scenarios_list, vars.variables).message

details := helpers.get_multi_summary(scenarios_list, vars.variables).details