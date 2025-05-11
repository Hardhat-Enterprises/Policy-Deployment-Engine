package terraform.gcp.security.artifact_registry.repository.format

import data.terraform.gcp.helpers
import data.terraform.gcp.security.artifact_registry.repository.vars

conditions := [
  {
    "situation_description": "The repository format is not in the approved list (DOCKER, MAVEN).",
    "remedies": [
      "Change the format to a supported type such as DOCKER or MAVEN."
    ]
  },
  {
    "condition": "Allow only DOCKER or MAVEN as formats.",
    "attribute_path": ["format"],
    "values": ["DOCKER", "MAVEN"],
    "policy_type": "whitelist"
  }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
