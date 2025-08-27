inherited/gcp/service/container_registeries
package terraform.gcp.security.analysis_note.attestation_authority

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analysis_note.attestation_authority.vars

banned_hrn  := vars.variables["banned_human_readable_names"]
allowed_hrn := vars.variables["allowed_human_readable_name_regex"]

# Keep each situation tiny and readable; helpers aggregate results.
conditions := [

  # 1) Must have attestation_authority block
  [
    {
      "id": "AN-AA-001",
      "severity": "high",
      "situation_description": "Each Container Analysis Note must define an attestation_authority.",
      "remedies": [
        "Add an attestation_authority block to the google_container_analysis_note resource."
      ]
    },
    {
      "condition": "attestation_authority must be present",
      "attribute_path": ["attestation_authority"],
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ],

  # 2) Must have hint under attestation_authority
  [
    {
      "id": "AN-AA-002",
      "severity": "medium",
      "situation_description": "attestation_authority.hint should be provided.",
      "remedies": [
        "Supply a hint block (e.g., human_readable_name) inside attestation_authority."
      ]
    },
    {
      "condition": "hint must exist under attestation_authority",
      "attribute_path": ["attestation_authority", "hint"],
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ],

  # 3) human_readable_name must not be empty/placeholder
  [
    {
      "id": "AN-AA-003",
      "severity": "medium",
      "situation_description": "attestation_authority.hint.human_readable_name must be meaningful.",
      "remedies": [
        "Set human_readable_name to a clear label (e.g., 'Prod Attestor', 'QA Attestor')."
      ]
    },
    {
      "condition": "human_readable_name must not be a banned value",
      "attribute_path": ["attestation_authority", "hint", "human_readable_name"],
      "values": banned_hrn,
      "policy_type": "blacklist",
      "case_insensitive": true
    }
  ],

  # 4) human_readable_name should match simple org style
  [
    {
      "id": "AN-AA-004",
      "severity": "low",
      "situation_description": "attestation_authority.hint.human_readable_name should match org style.",
      "remedies": [
        "Use 2–64 chars: letters, numbers, spaces, hyphens, or underscores."
      ]
    },
    {
      "condition": "human_readable_name should match allowed pattern",
      "attribute_path": ["attestation_authority", "hint", "human_readable_name"],
      "regex": allowed_hrn,
      "policy_type": "pattern whitelist"
    }
  ]
]

# Same style as your expiration_time: direct summary/Details bindings
message := helpers.get_multi_summary(conditions, vars.variables).message

package terraform.gcp.security.registries.google_container_analysis_note.attestation_authority

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analysis_note.attestation_authority.hint.vars


conditions := [
    [
        {"situation_description" : "The 'human_readable_name' for attestation authority is not valid.",
         "remedies": [
            "Change 'human_readable_name' to a valid value.",
            "Valid values: 'QA', 'Build'"
         ]
        },
        {
            "condition": "Test if 'human_readable_name' is one of the allowed values",
            "attribute_path" : ["attestation_authority", 0, "hint", 0, "human_readable_name"],
            "values" : ["QA", "Build"], 
            "policy_type" : "whitelist" 
        }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message

gcp/service/container_registries
details := helpers.get_multi_summary(conditions, vars.variables).details
