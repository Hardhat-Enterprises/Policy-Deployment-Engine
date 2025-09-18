package terraform.gcp.security.dataform.google_dataform_repository.labels

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository.vars

conditions := [
  [
    {"situation_description": "Repository must have environment label.",
     "remedies": [
       "Add environment label with non-empty value.",
       "Use values like 'production', 'staging', 'development'."
     ]},
    {"condition": "environment label must not be null",
     "attribute_path": ["labels","environment"],
     "values": [null],
     "policy_type": "blacklist"}
  ],
  [
    {"situation_description": "Repository must have environment label.",
     "remedies": [
       "Add environment label with non-empty value.",
       "Use values like 'production', 'staging', 'development'."
     ]},
    {"condition": "environment label must not be empty",
     "attribute_path": ["labels","environment"],
     "values": [""],
     "policy_type": "blacklist"}
  ],
  [
    {"situation_description": "Repository must have owner label.",
     "remedies": [
       "Add owner label with non-empty value.",
       "Use team name or individual email."
     ]},
    {"condition": "owner label must not be null",
     "attribute_path": ["labels","owner"],
     "values": [null],
     "policy_type": "blacklist"}
  ],
  [
    {"situation_description": "Repository must have owner label.",
     "remedies": [
       "Add owner label with non-empty value.",
       "Use team name or individual email."
     ]},
    {"condition": "owner label must not be empty",
     "attribute_path": ["labels","owner"],
     "values": [""],
     "policy_type": "blacklist"}
  ],
  [
    {"situation_description": "Repository must have cost_center label.",
     "remedies": [
       "Add cost_center label with non-empty value.",
       "Use department or cost center identifier."
     ]},
    {"condition": "cost_center label must not be null",
     "attribute_path": ["labels","cost_center"],
     "values": [null],
     "policy_type": "blacklist"}
  ],
  [
    {"situation_description": "Repository must have cost_center label.",
     "remedies": [
       "Add cost_center label with non-empty value.",
       "Use department or cost center identifier."
     ]},
    {"condition": "cost_center label must not be empty",
     "attribute_path": ["labels","cost_center"],
     "values": [""],
     "policy_type": "blacklist"}
  ],
  [
    {"situation_description": "Repository must have team label.",
     "remedies": [
       "Add team label with non-empty value.",
       "Use team name or project identifier."
     ]},
    {"condition": "team label must not be null",
     "attribute_path": ["labels","team"],
     "values": [null],
     "policy_type": "blacklist"}
  ],
  [
    {"situation_description": "Repository must have team label.",
     "remedies": [
       "Add team label with non-empty value.",
       "Use team name or project identifier."
     ]},
    {"condition": "team label must not be empty",
     "attribute_path": ["labels","team"],
     "values": [""],
     "policy_type": "blacklist"}
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details