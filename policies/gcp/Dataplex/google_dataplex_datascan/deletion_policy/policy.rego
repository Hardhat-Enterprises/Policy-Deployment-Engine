package terraform.gcp.security.dataplex.google_dataplex_datascan.deletion_policy

import data.terraform.gcp.security.dataplex.google_dataplex_datascan.vars
import data.terraform.helpers

conditions := [
        [
                {
                        "situation_description": "The Dataplex DataScan is not protected from accidental deletion.",
                        "remedies": [
                                "Set deletion_policy = PREVENT.",
                        ],
                },
                {
                        "condition": "Dataplex DataScan deletion protection must be enabled.",
                        "attribute_path": ["deletion_policy"],
                        "values": ["PREVENT"],
                        "policy_type": "whitelist",
                },
        ],
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
