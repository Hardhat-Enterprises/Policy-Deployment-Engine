package terraform.gcp.security.registries.google_container_analysis_occurrence.ssp

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analysis_occurence.ssp.vars

# Define the conditions for serialized_payload, signature, and public_key_id
conditions := [
    [
        {"situation_description": "Serialized payload is missing or invalid.",
        "remedies": ["Ensure the serialized_payload is provided and correctly encoded."]},
        {
            "condition": "Check if serialized_payload is valid",
            "attribute_path": ["attestation", 0, "serialized_payload"],
            "values": ["", null],  # Check for non-empty value
            "policy_type": "range"  # Policy type is range to check for valid serialized payload
        }
    ],
    [
        {"situation_description": "Signature is missing or invalid.",
        "remedies": ["Ensure the signature is provided and correctly generated."]},
        {
            "condition": "Check if signature is valid",
            "attribute_path": ["attestation", 0, "signatures", 0, "signature"],
            "values": ["", null],  # Check for non-empty value
            "policy_type": "range"  # Policy type is range to check for valid signature
        }
    ],
    [
        {"situation_description": "Public key ID is missing or invalid.",
        "remedies": ["Ensure the public_key_id is provided and correctly formatted."]},
        {
            "condition": "Check if public_key_id is valid",
            "attribute_path": ["attestation", 0, "signatures", 0, "public_key_id"],
            "values": ["", null],  # Check for non-empty value
            "policy_type": "range"  # Policy type is range to check for valid public_key_id
        }
    ]
]

# Generate message based on policy evaluation
message := helpers.get_multi_summary(conditions, vars.variables).message

# Display detailed summary for debugging (optional)
details := helpers.get_multi_summary(conditions, vars.variables).details
