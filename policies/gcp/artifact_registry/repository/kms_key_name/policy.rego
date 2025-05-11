package terraform.gcp.security.artifact_registry.repository.kms_key_name

import data.terraform.gcp.helpers
import data.terraform.gcp.security.artifact_registry.repository.vars

conditions := [
    [
    {"situation_description" : "The repository does not have a customer-managed encryption key (KMS key) set.",
    "remedies":[ "Specify a valid kms_key_name in the repository configuration to enable encryption."]},
    {
        "condition": "Check that kms_key_name is provided.",
        "attribute_path" : ["kms_key_name"],
        "values" : [null],
        "policy_type" : "blacklist"  # Disallow null kms_key_name (enforce it's always set)
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
