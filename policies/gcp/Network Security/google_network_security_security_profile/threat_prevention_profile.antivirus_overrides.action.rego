package terraform.gcp.security.network_security.google_network_security_security_profile.threat_prevention_profile_antivirus_overrides_action
import data.terraform.helpers
import data.terraform.gcp.security.network_security.google_network_security_security_profile.vars

conditions := [
  [
    {
      "situation_description" : "Antivirus threat overrides should not silently allow known-malicious traffic",
      "remedies":[
        "Set antivirus_overrides action to something other than ALLOW"
      ]
    },
    {
      "condition": "c1 antivirus_overrides action is not ALLOW",
      "attribute_path" : ["threat_prevention_profile", 0, "antivirus_overrides", "action"],
      "values" : ["ALLOW"],
      "policy_type" : "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
