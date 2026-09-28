package terraform.gcp.security.cloud_platform_service.google_broken_thing.good

import data.terraform.helpers

conditions := [
  [
    {"situation_description": "Good argument is set to an unapproved value.",
     "remedies": ["Set good to 'approved'."]},
    {"condition": "Good must be approved",
     "attribute_path": ["good"],
     "values": ["approved"],
     "policy_type": "whitelist"}
  ]
]
