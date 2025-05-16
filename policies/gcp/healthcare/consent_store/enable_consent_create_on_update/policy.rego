package terraform.gcp.security.healthcare.consent_store.enable_consent_create_on_update
import data.terraform.gcp.security.healthcare.consent_store.vars
import data.terraform.gcp.helpers

scenarios_list := [
    [
        {
            "situation_description": "Non-compliant enable_consent_create_on_update setting.",
            "remedies": ["Set enable_consent_create_on_update to true."]
        },
        {
            "condition": "Only 'true' is an allowed value for enable_consent_create_on_update",
            "attribute_path": ["enable_consent_create_on_update"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(scenarios_list, vars.variables).message

details := helpers.get_multi_summary(scenarios_list, vars.variables).details