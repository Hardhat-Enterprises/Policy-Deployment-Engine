inherited/gcp/service/container_registeries
package terraform.gcp.security.analysis_occurence.remediation

package terraform.gcp.security.registries.google_container_analysis_occurrence.remediation
gcp/service/container_registries

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analysis_occurence.remediation.vars

inherited/gcp/service/container_registeries
banned_empty          := vars.variables["banned_empty_values"]
banned_not_base64_rgx := vars.variables["banned_not_base64_regex"]
banned_pubkeyid_rgx   := vars.variables["banned_public_key_id_regex"]

# SECURITY blacklist: block empty/placeholder values, non-base64 payload/signature,
# and obviously invalid public_key_id formats.
conditions := [
  # A) serialized_payload must not be empty/placeholder
  [
    {
      "situation_description": "The attestation 'serialized_payload' is empty or placeholder.",
      "remedies": [
        "Provide a real base64-encoded payload (e.g., an in-toto statement)."
      ],
    },
    {
      "condition": "serialized_payload is NOT an empty/placeholder value",
      "attribute_path": ["attestation", 0, "serialized_payload"],
      "values": banned_empty,
      "policy_type": "blacklist",
      "case_insensitive": true
    },
  ],

  # B) serialized_payload must not contain non-base64 characters
  [
    {
      "situation_description": "The attestation 'serialized_payload' is not valid base64.",
      "remedies": [
        "Encode the payload using RFC 4648 base64 (A–Z a–z 0–9 + / with '=' padding)."
      ],
    },
    {
      "condition": "serialized_payload does NOT match invalid-base64 pattern",
      "attribute_path": ["attestation", 0, "serialized_payload"],
      "regex": banned_not_base64_rgx,
      "policy_type": "blacklist"
    },
  ],

  # C) signature must not be empty/placeholder
  [
    {
      "situation_description": "The attestation 'signatures[0].signature' is empty or placeholder.",
      "remedies": [
        "Provide a real base64 signature created with the attestor’s private key."
      ],
    },
    {
      "condition": "signature is NOT an empty/placeholder value",
      "attribute_path": ["attestation", 0, "signatures", 0, "signature"],
      "values": banned_empty,
      "policy_type": "blacklist",
      "case_insensitive": true
    },
  ],

  # D) signature must not contain non-base64 characters
  [
    {
      "situation_description": "The attestation signature is not valid base64.",
      "remedies": [
        "Re-sign and ensure the signature is base64-encoded without invalid characters."
      ],
    },
    {
      "condition": "signature does NOT match invalid-base64 pattern",
      "attribute_path": ["attestation", 0, "signatures", 0, "signature"],
      "regex": banned_not_base64_rgx,
      "policy_type": "blacklist"
    },
  ],

  # E) public_key_id must not be empty/placeholder/obviously invalid
  [
    {
      "situation_description": "The attestation 'public_key_id' is empty or obviously invalid.",
      "remedies": [
        "Provide a stable key identifier (e.g., 'openpgp4fpr:<fingerprint>' or a valid URI)."
      ],
    },
    {
      "condition": "public_key_id is NOT empty/placeholder/obviously invalid",
      "attribute_path": ["attestation", 0, "signatures", 0, "public_key_id"],
      "values": banned_empty,
      "policy_type": "blacklist",
      "case_insensitive": true
    },
  ],
  [
    {
      "situation_description": "The attestation 'public_key_id' format looks invalid.",
      "remedies": [
        "Use a conformant identifier (e.g., 'openpgp4fpr:<fingerprint>' or RFC3986 URI)."
      ],
    },
    {
      "condition": "public_key_id does NOT match known-bad patterns",
      "attribute_path": ["attestation", 0, "signatures", 0, "public_key_id"],
      "regex": banned_pubkeyid_rgx,
      "policy_type": "blacklist"
    },
  ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details


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
gcp/service/container_registries
