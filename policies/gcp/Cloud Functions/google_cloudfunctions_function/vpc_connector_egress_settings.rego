package terraform.gcp.security.cloud_functions.google_cloudfunctions_function.vpc_connector_egress_settings
import data.terraform.helpers
import data.terraform.gcp.security.cloud_functions.google_cloudfunctions_function.vars

conditions := [
    [
    {
      "situation_description": "VPC connector should reside in approved Australian regions",
      "remedies": ["Change the region where VPC connector resides"]
    },
    {
      "condition": "checks that vpc connector resides in approved Australian regions",
      "attribute_path": ["vpc_connector"],
      "values": ["projects/*/locations/*/connectors/*",
                 [["my-project"], ["australia-southeast1", "australia-southeast2"], ["my-connector"]]],
      "policy_type": "pattern whitelist"
    }
    ],
    [
    {"situation_description" : "VPC egress traffic should be diverted through private ranges only",
    "remedies":[ "Change VPC egress to PRIVATE_RANGES_ONLY"],
    },
    {
        "condition": "Test whether egress settings for the connector is only filtering through private ranges",
        "attribute_path" : ["vpc_connector_egress_settings"],
        "values" : ["ALL_TRAFFIC"],
        "policy_type" : "blacklist"
    }
    ]
]


result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details