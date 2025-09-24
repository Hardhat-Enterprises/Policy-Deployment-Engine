package terraform.gcp.security.looker.core.fips_required
import data.terraform.gcp.helpers
import data.terraform.gcp.security.looker.core.vars

conditions := [
  [
    {
      "situation_description": "FIPS compliance is required but not enabled",
      "remedies": [
        "Enable FIPS compliance by setting fips_enabled to true",
        "Ensure FIPS-validated cryptographic modules are used",
        "Required for FedRAMP and regulated environments"
      ]
    },
    {
      "condition": "Require FIPS compliance (whitelist: fipsEnabled must be true)",
      "attribute_path": ["fips_enabled"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details