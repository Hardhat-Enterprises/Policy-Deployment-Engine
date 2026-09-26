package terraform.gcp.security.google_cloudfunction.google_cloudfunctions2_function.service_config_vpc_connector

import data.terraform.helpers
import data.terraform.gcp.security.google_cloudfunction.google_cloudfunctions2_function.vars

# policy_lint reports hard-coded-value on the value below, and the finding stands.
# A pattern whitelist only judges values that MATCH its target: one that does not
# match the shape is never flagged at all. This argument's non-compliant example
# is the empty string, so converting would make the fixture pass for the wrong
# reason. Either _helpers needs a pattern whitelist that fails a non-matching
# value, or the fixture needs a wrongly-scoped (not malformed) example.
conditions := [
  [
    {
      "situation_description": "Function must specify a VPC connector to route traffic through a private network.",
      "remedies": [
        "Specify a 'vpc_connector' in the 'service_config' block using an approved connector."
      ]
    },
    {
      "condition": "Function must use an approved VPC connector.",
      "attribute_path": ["service_config", 0, "vpc_connector"],
      "values": [
        "projects/my-project/locations/us-central1/connectors/my-vpc-connector"
      ],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
