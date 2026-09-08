package terraform.gcp.security.biglake.google_biglake_database.hive_options_location_uri

import data.terraform.helpers
import data.terraform.gcp.security.biglake.google_biglake_database.vars

conditions := [
  [
    {
      "situation_description": "BigLake Database hive_options.location_uri is not using an approved GCS location",
      "remedies": [
        "Change hive_options.location_uri to an approved GCS bucket/prefix (example: gs://org-au-biglake-metadata/*)"
      ]
    },
    {
      "condition": "Restrict hive_options.location_uri to approved GCS prefixes",
      "attribute_path": ["hive_options", 0, "location_uri"],
      "values": ["*://*/metadata/", [["gs"], ["org-au-biglake-metadata"]]],
      "policy_type": "pattern whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
