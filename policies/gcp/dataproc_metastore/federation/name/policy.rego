package terraform.gcp.security.dataproc_metastore.federation.name

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataproc_metastore.federation.vars


# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
    [
    {
      "situation_description": "Check that the relative resource name resides in the correct region",
      "remedies": ["Update reigion to australia-southeast1/2"]
    },
    {
      "condition": "Test version of Apache Hive metastore",
      "attribute_path": ["backend_metastores", 0, "name"],
      "values": ["projects/acme-data-01/locations/*/services/hive-prod", [["australia-southeast2", "australia-southeast1"]]],
      "policy_type": "pattern_whitelist"
    }
  ]
]

  
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details