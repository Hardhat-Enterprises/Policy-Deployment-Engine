package terraform.gcp.security.dataplex.google_dataplex_datascan.location

import data.terraform.gcp.security.dataplex.google_dataplex_datascan.vars
import data.terraform.helpers

conditions := [
        [
                {
                        "situation_description": "The Dataplex DataScan is deployed outside approved Australian regions.",
                        "remedies": [
                                "Set location to australia-southeast1 or australia-southeast2.",
                        ],
                },
                {
                        "condition": "Dataplex DataScan must be deployed in an approved Australian region.",
                        "attribute_path": ["location"],
                        "values": ["australia-southeast1", "australia-southeast2"],
                        "policy_type": "whitelist",
                },
        ],
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
