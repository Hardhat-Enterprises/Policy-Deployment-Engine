package terraform.gcp.security.API.Gateway_Config.gateway_config

import data.terraform.gcp.helpers
import data.terraform.gcp.security.API.Gateway_Config.gateway_config.vars

conditions := [
  [
    {
      "situation_description": "Ensure the API Gateway config uses only approved backend service accounts",
      "remedies": ["Use only the compliant Google service account for backend config."]
    },
    {
      "condition": "The google_service_account must be one of the approved accounts",
      "attribute_path": ["gateway_config", 0, "backend_config", 0, "google_service_account"],
      "values": ["gateway-backend-sa@api_cfg.iam.gserviceaccount.com"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details