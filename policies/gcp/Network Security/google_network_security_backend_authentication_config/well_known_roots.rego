package terraform.gcp.security.network_security.google_network_security_backend_authentication_config.well_known_roots
import data.terraform.helpers
import data.terraform.gcp.security.network_security.google_network_security_backend_authentication_config.vars

conditions := [
  [
    {
      "situation_description" : "Backend server certificate validation should rely on explicit trust anchors rather than the broad, externally-managed public root CA set",
      "remedies":[
        "Set well_known_roots to NONE"
      ]
    },
    {
      "condition": "c1 well_known_roots is NONE",
      "attribute_path" : ["well_known_roots"],
      "values" : ["NONE"],
      "policy_type" : "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
