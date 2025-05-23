package terraform.gcp.security.registries.google_container_analysis_occurrence.remediation

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analysis_occurence.remediation.vars


conditions := [
    [
        {"situation_description": "Serialized payload is missing or invalid.",
        "remedies": ["Ensure the serialized_payload is provided and correctly encoded."],
        "remediation": "Please validate that the serialized_payload is base64-encoded properly and provided."},
        {
            "condition": "Check if serialized_payload is valid",
            "attribute_path": ["attestation", 0, "serialized_payload"],
            "values": ["", null], 
            "policy_type": "range" 
        }
    ],
    [
        {"situation_description": "Signature is missing or invalid.",
        "remedies": ["Ensure the signature is provided and correctly generated."],
        "remediation": "Please ensure that the signature is generated properly using the private key and is provided."},
        {
            "condition": "Check if signature is valid",
            "attribute_path": ["attestation", 0, "signatures", 0, "signature"],
            "values": ["", null], 
            "policy_type": "range"  
        }
    ],
    [
        {"situation_description": "Public key ID is missing or invalid.",
        "remedies": ["Ensure the public_key_id is provided and correctly formatted."],
        "remediation": "Please ensure that the public_key_id is in the correct format (e.g., an RFC3986 conformant URI)."},
        {
            "condition": "Check if public_key_id is valid",
            "attribute_path": ["attestation", 0, "signatures", 0, "public_key_id"],
            "values": ["", null], 
            "policy_type": "range"  
        }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details