package terraform.gcp.security.cloud_iam.google_iam_workforce_pool_provider.attribute_condition

import data.terraform.helpers
import data.terraform.gcp.security.cloud_iam.google_iam_workforce_pool_provider.vars

conditions := [
    [
        {
            "situation_description": "The workforce pool provider does not define an attribute condition, allowing every otherwise valid identity-provider credential to be accepted.",
            "remedies": [
                "Set a non-empty 'attribute_condition' that restricts federation using trusted identity-provider claims."
            ]
        },
        {
            "condition": "Check whether an attribute condition is configured",
            "attribute_path": ["attribute_condition"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
