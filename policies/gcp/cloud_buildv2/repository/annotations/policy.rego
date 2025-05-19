package terraform.gcp.security.cloud_buildv2.repository.annotations

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_buildv2.repository.vars

scenarios_list := [
  [
    {
      "situation_description": "Annotations must include 'owner' to specify who is responsible for the repository",
      "remedies": ["Add an 'owner' key with a valid team or individual responsible."]
    },
    {
      "condition": "Missing or invalid 'owner' in annotations",
      "attribute_path": ["annotations", "owner"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Annotations must include 'team' to specify the responsible team",
      "remedies": ["Add a 'team' key with a valid team identifier."]
    },
    {
      "condition": "Missing or invalid 'team' in annotations",
      "attribute_path": ["annotations", "team"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Annotations must include 'contact' to provide a security contact point",
      "remedies": ["Add a 'contact' email or alias responsible for this repository."]
    },
    {
      "condition": "Missing or invalid 'contact' in annotations",
      "attribute_path": ["annotations", "contact"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Annotations must include 'created_by' to track repository creation source",
      "remedies": ["Specify 'created_by' such as Terraform, admin name, etc."]
    },
    {
      "condition": "Missing or invalid 'created_by' in annotations",
      "attribute_path": ["annotations", "created_by"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Annotations must include 'created_at' timestamp",
      "remedies": ["Include a 'created_at' annotation in ISO-8601 format."]
    },
    {
      "condition": "Missing or invalid 'created_at' in annotations",
      "attribute_path": ["annotations", "created_at"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Annotations must include 'updated_at' timestamp",
      "remedies": ["Include an 'updated_at' annotation for audit trails."]
    },
    {
      "condition": "Missing or invalid 'updated_at' in annotations",
      "attribute_path": ["annotations", "updated_at"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Annotations must include 'environment' context (e.g., prod/dev)",
      "remedies": ["Add an 'environment' key with a valid value such as 'production' or 'dev'."]
    },
    {
      "condition": "Missing or invalid 'environment' in annotations",
      "attribute_path": ["annotations", "environment"],
      "values": ["production", "staging", "dev"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)
message := summary.message
details := summary.details
