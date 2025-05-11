package terraform.gcp.security.artifact_registry.repository.coverage

import data.terraform.gcp.helpers
import data.terraform.gcp.security.artifact_registry.repository.vars

conditions := [
  {
    "situation_description": "The repository is missing a description.",
    "remedies": ["Add a description to clarify repository purpose."]
  },
  {
    "condition": "Description must be provided.",
    "attribute_path": ["description"],
    "values": [null, ""],
    "policy_type": "blacklist"
  },
  {
    "situation_description": "The repository is missing labels.",
    "remedies": ["Add labels such as team or environment."]
  },
  {
    "condition": "Labels must not be null or empty.",
    "attribute_path": ["labels"],
    "values": [null, {}],
    "policy_type": "blacklist"
  },
  {
    "situation_description": "Vulnerability scanning is not enabled.",
    "remedies": ["Set vulnerability_scanning_config to enable security scanning."]
  },
  {
    "condition": "Vulnerability scanning config must be present.",
    "attribute_path": ["vulnerability_scanning_config", "enablement_config"],
    "values": [null, "DISABLED"],
    "policy_type": "blacklist"
  }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
