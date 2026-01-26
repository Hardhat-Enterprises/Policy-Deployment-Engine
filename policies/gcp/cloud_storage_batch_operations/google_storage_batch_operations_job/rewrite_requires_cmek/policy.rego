package terraform.gcp.security.cloud_storage_batch_operations.google_storage_batch_operations_job.rewrite_requires_cmek

import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage_batch_operations.google_storage_batch_operations_job.vars

conditions := [[
    {
        "situation_description": "rewrite_object must use a valid CMEK",
        "remedies": [
            "Set kms_key to a valid CMEK path: projects/my-project/locations/us-central1/keyRings/kr/cryptoKeys/key",
            "Use format: projects/{project}/locations/{location}/keyRings/{keyring}/cryptoKeys/{key}"
        ]
    },
    {
        "condition": "kms_key must not be an invalid CMEK path",
        "attribute_path": ["rewrite_object", 0, "kms_key"],
        "policy_type": "blacklist",
        "values": ["invalid-key-path", "bad-key", "test-key", "not-a-cmek-key", "invalid-project/locations/invalid-location/keyRings/invalid-keyring/cryptoKeys/invalid-key"]
    }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
