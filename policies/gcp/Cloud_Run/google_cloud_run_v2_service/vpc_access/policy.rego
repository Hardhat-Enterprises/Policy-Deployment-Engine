package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service.vpc_access

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service.vars


conditions := [
  [
    {
      "situation_description": "Cloud Run v2 Service is missing a VPC Access Connector.",
      "remedies": [
        "Define 'vpc_access.connector' to enforce private networking.",
        "Example: vpc_access { connector = \"projects/<project>/locations/<region>/connectors/<connector-name>\" }"
      ]
    },
    {
      "condition": "Missing or empty 'vpc_access.connector'",
      "attribute_path": ["template", "vpc_access", "connector"],
      "values": ["", null],
      "policy_type": "blacklist"
    }
  ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
