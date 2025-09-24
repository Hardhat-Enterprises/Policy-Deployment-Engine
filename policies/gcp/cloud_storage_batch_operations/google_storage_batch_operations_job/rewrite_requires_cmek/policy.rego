package terraform.gcp.security.cloud_storage_batch_operations.google_storage_batch_operations_job.rewrite_requires_cmek

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage_batch_operations.google_storage_batch_operations_job.vars

conditions := [[
    {
        "situation_description": "rewrite_object must use a valid CMEK",
        "remedies": [
            "Set kms_key to a valid CMEK path: projects/my-project/locations/us-central1/keyRings/kr/cryptoKeys/key",
            "Use format: projects/*/locations/*/keyRings/*/cryptoKeys/*"
        ]
    },
    {
        "condition": "kms_key must be a valid CMEK path",
        "attribute_path": ["rewrite_object", 0, "kms_key"],
        "policy_type": "pattern whitelist",
        "values": ["projects/*/locations/*/keyRings/*/cryptoKeys/*", [["test-project", "my-project", "example"], ["us-central1", "us-east1", "europe-west1"], ["test-keyring", "my-keyring", "example-keyring"], ["test-key", "my-key", "example-key"]]]
    }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
