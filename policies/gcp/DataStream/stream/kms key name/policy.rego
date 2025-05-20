package terraform.gcp.security.datastream.stream.kms_key_compliance
import data.terraform.gcp.helpers
import data.terraform.gcp.security.datastream.stream.vars

conditions := [
    [
    {"situation_description": "Customer-managed encryption key (CMEK) is not configured for the Datastream Stream.",
    "remedies": ["Set 'kms_key_name' to a valid CMEK in the format: projects/PROJECT_ID/locations/LOCATION/keyRings/KEY_RING/cryptoKeys/KEY.", "Avoid using default Google-managed encryption."]},
    {
        "condition": "Checks that a valid CMEK is configured.",
        "attribute_path": ["destination_config", 0, "bigquery_destination_config", 0, "source_hierarchy_datasets", 0, "dataset_template", 0, "kms_key_name"],
        "values": ["projects/my-secure-project/locations/global/keyRings/my-keyring/cryptoKeys/my-key"],
        "policy_type": "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
