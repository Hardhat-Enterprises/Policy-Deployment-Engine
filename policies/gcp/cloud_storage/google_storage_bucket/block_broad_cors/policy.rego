package terraform.gcp.security.cloud_storage.google_storage_bucket.block_broad_cors

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage.google_storage_bucket.vars


conditions := [
  [
    {
      "situation_description": "CORS methods  are too broad.",
      "remedies": [
        "Consider restricting CORS methods to only trusted domains."
      ]
    },
    {
      "condition": "CORS method should be specific.",
      "attribute_path": ["cors",0,"method",0],
      "values": ["*"],
      "policy_type": "blacklist"
    },
    ],

  [
    {
      "situation_description": "CORS  origin are too broad.",
      "remedies": [
        "Consider restricting CORS origins to only trusted domains."
      ]
    },
        
    {
      "condition": "CORS origin should not be *.",
      "attribute_path": ["cors",0,"origin",0],
      "values": ["*"], 
      "policy_type": "blacklist"
    }
  ]
]



summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
