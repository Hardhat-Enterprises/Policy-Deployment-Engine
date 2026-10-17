package terraform.gcp.security.compute_engine.google_compute_address.address_type
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_address.vars

conditions := [
    [
        {
            "situation_description": "The reserved IP address is configured as an external address.",
            "remedies": [
                "Set address_type to INTERNAL when public connectivity is not required."
            ]
        },
        {
            "condition": "Address type must be INTERNAL",
            "attribute_path": ["address_type"],
            "values": ["INTERNAL"],
            "policy_type": "whitelist"
        }
    ]
]
   
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details