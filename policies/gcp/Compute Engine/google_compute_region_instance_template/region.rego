package terraform.gcp.security.compute_engine.google_compute_region_instance_template.region
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_instance_template.vars

conditions := [
  [
    {
      "situation_description": "region is not one of the approved data-residency regions, which risks creating regional instance templates outside the location required by policy outside the region required by policy",
      "remedies": [
        "Set region to an approved region: australia-southeast1"
      ]
    },
    {
      "condition": "region must be an approved region",
      "attribute_path": ["region"],
      "policy_type": "whitelist",
      "values": ["australia-southeast1"]
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
