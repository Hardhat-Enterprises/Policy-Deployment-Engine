package terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.metadata.annotations
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.vars



conditions := [
  [
    {
      "situation_description": "Cloud Run domain mapping annotation does not contain a valid security ticket reference",
      "remedies": [
        "Add a valid ticket annotation to the resource",
        "Use the approved ticket format such as SEC-123"
      ]
    },
    {
       "condition": "Ticket annotation must follow the approved security ticket format",
       "attribute_path": ["metadata", 0, "annotations", "ticket"],
       "values": ["SEC-*", [["123", "456", "789"]]],
       "policy_type": "pattern whitelist"
    }
  ]
]

    


result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details


