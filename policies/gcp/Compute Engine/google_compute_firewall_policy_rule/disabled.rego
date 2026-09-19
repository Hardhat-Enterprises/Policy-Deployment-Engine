package terraform.gcp.security.compute_engine.google_compute_firewall_policy_rule.disabled
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_firewall_policy_rule.vars

conditions := [
  [
    {
      "situation_description": "disabled is set to true, which turns off enforcement of this firewall policy rule and lets matching traffic pass as if the rule did not exist",
      "remedies": [
        "Set disabled to false, or omit the attribute entirely so the rule defaults to enabled"
      ]
    },
    {
      "condition": "disabled must not be true",
      "attribute_path": ["disabled"],
      "policy_type": "blacklist",
      "values": [true]
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
