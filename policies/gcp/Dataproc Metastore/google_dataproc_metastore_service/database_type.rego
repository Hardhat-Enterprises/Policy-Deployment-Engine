package terraform.gcp.security.dataproc_metastore.google_dataproc_metastore_service.database_type
import data.terraform.helpers
import data.terraform.gcp.security.dataproc_metastore.google_dataproc_metastore_service.vars


conditions := [
  [
    {
      "situation_description": "Check that the database meets requirements",
      "remedies": ["Database type must be MYSQL or SPANNER"]
    },
    {
      "condition": "check database type is compliant",
      "attribute_path": ["database_type"],
      "values": ["MYSQL"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details