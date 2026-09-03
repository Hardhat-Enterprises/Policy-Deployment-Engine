package terraform.gcp.security.document_ai_warehouse.google_document_ai_warehouse_document_schema.property_definitions_is_filterable

import data.terraform.helpers
import data.terraform.gcp.security.document_ai_warehouse.google_document_ai_warehouse_document_schema.vars

conditions := [
    [
        {
            "situation_description": "A schema property can be used as a structured query filter across the corpus.",
            "remedies": [
                "Set property_definitions.is_filterable to false unless the property has been confirmed non-sensitive.",
                "A filterable property lets a caller with query access probe for, or enumerate, documents by that property's value - a data-exposure side-channel like is_searchable - even without full-text search access to the field."
            ]
        },
        {
            "condition": "property_definitions.is_filterable must not be true",
            "attribute_path": ["property_definitions", 0, "is_filterable"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
