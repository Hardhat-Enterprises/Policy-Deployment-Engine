package terraform.gcp.security.app_engine.google_app_engine_standard_app_version.https_only

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_standard_app_version.https_only.vars

conditions := [
  [
    {"situation_description" : "App Engine allows HTTP traffic.",
     "remedies": [ "Only allow HTTPS traffic by restricting 'inbound_services'" ]},
    {
      "condition": "App should not enable HTTP",
      "attribute_path": ["inbound_services"],
      "values": ["INBOUND_SERVICE_MAIL","INBOUND_SERVICE_MAIL_BOUNCE", "INBOUND_SERVICE_WARMUP"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
