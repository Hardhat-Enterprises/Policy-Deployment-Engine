package terraform.gcp.security.document_ai_warehouse.google_document_ai_warehouse_document_schema.property_definitions_property_type_options_property_definitions_is_searchable

import data.terraform.helpers
import data.terraform.gcp.security.document_ai_warehouse.google_document_ai_warehouse_document_schema.vars

conditions := [
    [
        {
            "situation_description": "A nested sub-property (inside a structured property_type_options property) is included in the warehouse-wide global search index.",
            "remedies": [
                "Set property_type_options.property_definitions.is_searchable to false unless the sub-property has been confirmed non-sensitive.",
                "A searchable sub-property is discoverable via global search the same way a top-level searchable property is, regardless of whether the caller would otherwise be shown that field."
            ]
        },
        {
            "condition": "property_type_options.property_definitions.is_searchable must not be true",
            "attribute_path": ["property_definitions", 0, "property_type_options", 0, "property_definitions", 0, "is_searchable"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
