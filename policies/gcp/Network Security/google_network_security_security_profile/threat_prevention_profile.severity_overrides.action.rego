package terraform.gcp.security.network_security.google_network_security_security_profile.severity_overrides.action
import data.terraform.helpers
import data.terraform.gcp.security.network_security.google_network_security_security_profile.vars

conditions := [
  [
    {
      "situation_description" : "Severity-based threat overrides should not silently allow dangerous threats",
      "remedies":[
        "Set severity_overrides action to something other than ALLOW"
      ]
    },
    {
      "condition": "c1 severity_overrides action is not ALLOW",
      "attribute_path" : ["threat_prevention_profile", 0, "severity_overrides", "action"],
      "values" : ["ALLOW"],
      "policy_type" : "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
