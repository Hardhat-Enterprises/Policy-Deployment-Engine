package terraform.gcp.security.chronicle.watchlist.multiplying_factor

import data.terraform.gcp.helpers
import data.terraform.gcp.security.chronicle.watchlist.vars

conditions := [
    [
        {
            "situation_description": "Multiplying factor is too low, reducing the risk impact of this watchlist.",
            "remedies": [
                "Set 'multiplying_factor' to at least 1.0 to ensure appropriate risk weighting.",
                "Update the Terraform configuration: multiplying_factor >= 1.0"
            ]
        },
        {
            "condition": "Ensure multiplying_factor is greater than or equal to 1.0",
            "attribute_path": ["multiplying_factor"],
            "values": [1.0, null], 
            "policy_type": "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
