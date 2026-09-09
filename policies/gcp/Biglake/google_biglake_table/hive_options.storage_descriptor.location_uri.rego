package terraform.gcp.security.biglake.google_biglake_table.hive_options_storage_descriptor_location_uri
import data.terraform.helpers
import data.terraform.gcp.security.biglake.google_biglake_table.vars

conditions := [
  [
    {
      "situation_description": "BigLake Table data is stored outside the approved GCS location",
      "remedies": [
        "Change hive_options.storage_descriptor.location_uri to an approved bucket/prefix (example: gs://org-au-biglake-data/*)"
      ]
    },
    {
      "condition": "Restrict table storage location to approved GCS prefixes",
      "attribute_path": ["hive_options", 0,"storage_descriptor", 0, "location_uri"],
      "values": ["*://*/data/", [["gs"], ["org-au-biglake-data"]]],
      "policy_type": "pattern whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
