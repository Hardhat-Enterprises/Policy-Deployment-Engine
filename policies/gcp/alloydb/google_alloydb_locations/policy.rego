package terraform.gcp.security.alloydb.data_google_alloydb_locations.allowed_regions
import data.terraform.gcp.helpers
import data.terraform.gcp.security.alloydb.data_google_alloydb_locations.vars

conditions := [
  [
    {
      "situation_description": "Project exposes AlloyDB locations outside the approved allowlist.",
      "remedies": [
        "Restrict AlloyDB usage to approved regions only (us-central1, us-east1, us-west1)."
      ]
    },
    {
      "condition": "locations must be approved regions",
      "attribute_path": ["locations"],
      "values": ["^(us-(central1|east1|west1))$"],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
