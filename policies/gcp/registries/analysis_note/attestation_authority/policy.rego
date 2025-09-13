package terraform.gcp.security.analysis_note.attestation_authority

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analysis_note.attestation_authority.vars

banned_values   := vars.variables["banned_human_readable_names"]
banned_patterns := vars.variables["banned_human_readable_name_patterns"]

conditions := [
  [
    {
      "situation_description": "The attestation 'human_readable_name' is a banned value.",
      "remedies": ["Use a production-appropriate stage (e.g., QA/Build/Release)."],
    },
    {
      "condition": "human_readable_name is NOT a banned value",
      "attribute_path": ["attestation_authority", 0, "hint", 0, "human_readable_name"],
      "values": banned_values,
      "policy_type": "blacklist"
    },
  ],
  [
    {
      "situation_description": "The attestation 'human_readable_name' contains a banned pattern (e.g., dev/test/stage/tmp/demo).",
      "remedies": ["Rename to a trusted stage used for release attestation."],
    },
    {
      # Pattern blacklist expects: ["<target with *>", [ <list for capture 1>, ... ]]
      # Using "*" → treat the entire string as one capture, and apply your simple (non-regex) patterns.
      "condition": "human_readable_name does NOT contain banned patterns",
      "attribute_path": ["attestation_authority", 0, "hint", 0, "human_readable_name"],
      "values": ["*", [banned_patterns]],
      "policy_type": "pattern blacklist"
    },
  ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
