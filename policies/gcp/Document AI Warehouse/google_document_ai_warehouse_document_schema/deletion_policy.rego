package terraform.gcp.security.document_ai_warehouse.google_document_ai_warehouse_document_schema.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.document_ai_warehouse.google_document_ai_warehouse_document_schema.vars

conditions := [
    [
        {
            "situation_description": "Document Schema must be protected from accidental or unauthorised deletion via Terraform.",
            "remedies": [
                "Set deletion_policy to 'PREVENT'.",
                "The default 'DELETE' allows a 'terraform destroy'/'apply' to remove the schema - breaking is_required/type validation for every document that depends on it - without any safeguard."
            ]
        },
        {
            "condition": "deletion_policy is in approved whitelist",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
