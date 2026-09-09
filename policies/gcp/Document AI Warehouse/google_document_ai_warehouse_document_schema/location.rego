package terraform.gcp.security.document_ai_warehouse.google_document_ai_warehouse_document_schema.location

import data.terraform.helpers
import data.terraform.gcp.security.document_ai_warehouse.google_document_ai_warehouse_document_schema.vars

conditions := [
    [
        {
            "situation_description": "Document Schema must be provisioned in an approved data-residency location.",
            "remedies": [
                "Set the location field to an approved location - 'us' is used here as a placeholder, taken from the provider's own example usage, not a confirmed value.",
                "This whitelist has not been verified against an authoritative source: Document AI Warehouse was discontinued on 2025-01-16, so there is no live API or current docs page enumerating its valid locations. Confirm the actual approved location list with the team before relying on this policy."
            ]
        },
        {
            "condition": "location is in approved whitelist",
            "attribute_path": ["location"],
            "values": ["us"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
