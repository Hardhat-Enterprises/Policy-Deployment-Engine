package terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.kms_key_name
import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.vars

#KMS_Key_Name

conditions := [
    [
    {
        "situation_description": "kms_key_name is misconfigured",
        "remedies": ["Ensure it is set to the correct key"]
        },
      {
        "condition": "KMS Key is mis-configured",
        "attribute_path": ["kms_key_name"],
        "values": ["/project/keys/my-safe-key"],
        "policy_type": "whitelist"
      }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
