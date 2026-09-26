package terraform.gcp.security.dataproc_on_gdc.google_dataproc_gdc_spark_application.deletion_policy

import data.terraform.helpers as helpers
import data.terraform.gcp.security.dataproc_on_gdc.google_dataproc_gdc_spark_application.vars as vars

conditions := [[
  {
    "situation_description": "Spark application must be protected from accidental or unauthorized deletion.",
    "remedies": ["Set deletion_policy = PREVENT."],
  },
  {
    "condition": "deletion_policy must be PREVENT.",
    "attribute_path": ["deletion_policy"],
    "values": ["PREVENT"],
    "policy_type": "whitelist",
  },
]]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
