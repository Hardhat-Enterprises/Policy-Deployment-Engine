package terraform.gcp.security.network_security.google_network_security_tls_inspection_policy.tls_feature_profile
import data.terraform.helpers
import data.terraform.gcp.security.network_security.google_network_security_tls_inspection_policy.vars

conditions := [
  [
    {
      "situation_description" : "TLS inspection should use a modern or restricted cipher profile, not the broadly compatible legacy default",
      "remedies":[
        "Set tls_feature_profile to PROFILE_MODERN or PROFILE_RESTRICTED"
      ]
    },
    {
      "condition": "c1 tls_feature_profile is PROFILE_MODERN or PROFILE_RESTRICTED",
      "attribute_path" : ["tls_feature_profile"],
      "values" : ["PROFILE_MODERN", "PROFILE_RESTRICTED"],
      "policy_type" : "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
