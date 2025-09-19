package terraform.gcp.security.dataform.google_dataform_repository.labels

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository.vars

conditions := [
  [
    {
      "situation_description": "Dataform repository must have environment label.",
      "remedies": [
        "Add environment label to the repository.",
        "Use values like production, staging, development."
      ]
    },
    {
      "condition": "environment label must not be null",
      "attribute_path": ["labels", "environment"],
      "values": [null],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Dataform repository environment label cannot be empty.",
      "remedies": [
        "Set environment label to a non-empty value.",
        "Use descriptive environment names."
      ]
    },
    {
      "condition": "environment label must not be empty",
      "attribute_path": ["labels", "environment"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Dataform repository must have owner label.",
      "remedies": [
        "Add owner label to the repository.",
        "Use team or individual names as owner."
      ]
    },
    {
      "condition": "owner label must not be null",
      "attribute_path": ["labels", "owner"],
      "values": [null],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Dataform repository owner label cannot be empty.",
      "remedies": [
        "Set owner label to a non-empty value.",
        "Use descriptive owner names."
      ]
    },
    {
      "condition": "owner label must not be empty",
      "attribute_path": ["labels", "owner"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Dataform repository must have cost_center label.",
      "remedies": [
        "Add cost_center label to the repository.",
        "Use appropriate cost center codes."
      ]
    },
    {
      "condition": "cost_center label must not be null",
      "attribute_path": ["labels", "cost_center"],
      "values": [null],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Dataform repository cost_center label cannot be empty.",
      "remedies": [
        "Set cost_center label to a non-empty value.",
        "Use appropriate cost center codes."
      ]
    },
    {
      "condition": "cost_center label must not be empty",
      "attribute_path": ["labels", "cost_center"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Dataform repository must have team label.",
      "remedies": [
        "Add team label to the repository.",
        "Use team names or identifiers."
      ]
    },
    {
      "condition": "team label must not be null",
      "attribute_path": ["labels", "team"],
      "values": [null],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Dataform repository team label cannot be empty.",
      "remedies": [
        "Set team label to a non-empty value.",
        "Use descriptive team names."
      ]
    },
    {
      "condition": "team label must not be empty",
      "attribute_path": ["labels", "team"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
