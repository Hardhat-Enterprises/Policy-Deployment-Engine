package terraform.gcp.security.analysis_occurence.remediation

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analysis_occurence.remediation.vars

banned_empty     := vars.variables["banned_empty_values"]
banned_badchars  := vars.variables["banned_not_base64_character_patterns"]
banned_keyid_bad := vars.variables["banned_public_key_id_patterns"]

conditions := [
  [
    {
      "situation_description": "The attestation 'serialized_payload' is empty or placeholder.",
      "remedies": ["Provide a real base64-encoded payload (e.g., an in-toto statement)."],
    },
    {
      "condition": "serialized_payload is NOT an empty/placeholder value",
      "attribute_path": ["attestation", 0, "serialized_payload"],
      "values": banned_empty,
      "policy_type": "blacklist"
    },
  ],
  [
    {
      "situation_description": "The attestation 'serialized_payload' contains invalid characters.",
      "remedies": ["Encode using base64 (A–Z a–z 0–9 + / with '=' padding)."],
    },
    {
      "condition": "serialized_payload does NOT contain banned characters",
      "attribute_path": ["attestation", 0, "serialized_payload"],
      "values": ["*", [banned_badchars]],
      "policy_type": "pattern blacklist"
    },
  ],
  [
    {
      "situation_description": "The attestation 'signatures[0].signature' is empty or placeholder.",
      "remedies": ["Provide a real base64 signature created with the attestor’s private key."],
    },
    {
      "condition": "signature is NOT an empty/placeholder value",
      "attribute_path": ["attestation", 0, "signatures", 0, "signature"],
      "values": banned_empty,
      "policy_type": "blacklist"
    },
  ],
  [
    {
      "situation_description": "The attestation signature contains invalid characters.",
      "remedies": ["Re-sign and base64-encode without invalid characters."],
    },
    {
      "condition": "signature does NOT contain banned characters",
      "attribute_path": ["attestation", 0, "signatures", 0, "signature"],
      "values": ["*", [banned_badchars]],
      "policy_type": "pattern blacklist"
    },
  ],
  [
    {
      "situation_description": "The attestation 'public_key_id' is empty or obviously invalid.",
      "remedies": ["Provide a stable key ID (e.g., 'openpgp4fpr:<fingerprint>' or a valid URI)."],
    },
    {
      "condition": "public_key_id is NOT empty/placeholder/obviously invalid",
      "attribute_path": ["attestation", 0, "signatures", 0, "public_key_id"],
      "values": banned_empty,
      "policy_type": "blacklist"
    },
  ],
  [
    {
      "situation_description": "The attestation 'public_key_id' contains invalid characters.",
      "remedies": ["Avoid whitespace or email-like IDs; use a conformant identifier."],
    },
    {
      "condition": "public_key_id does NOT contain banned patterns",
      "attribute_path": ["attestation", 0, "signatures", 0, "public_key_id"],
      "values": ["*", [banned_keyid_bad]],
      "policy_type": "pattern blacklist"
    },
  ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
