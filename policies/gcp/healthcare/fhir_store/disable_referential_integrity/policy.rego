package terraform.gcp.security.healthcare.fhir_store.disable_referential_integrity
import data.terraform.gcp.security.healthcare.fhir_store.vars
import data.terraform.gcp.helpers

scenarios_list := [
    [
        {
            "situation_description": "Non-compliant 'disable_referential_integrity' setting.",
            "remedies": ["Set 'disable_referential_integrity' to false."]
        },
        {
            "condition": "Only 'false' is allowed for disable_referential_integrity",
            "attribute_path": ["disable_referential_integrity"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(scenarios_list, vars.variables).message

details := helpers.get_multi_summary(scenarios_list, vars.variables).details