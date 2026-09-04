package terraform.gcp.security.compute_engine.google_compute_node_template.region
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_node_template.vars

conditions := [
  [
    {
      "situation_description": "region is not one of the approved data-residency regions, which risks creating nodes and associated workload data outside the region required by policy",
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
