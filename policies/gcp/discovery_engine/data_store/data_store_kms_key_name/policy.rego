package terraform.gcp.security.discovery_engine.data_store.data_store_kms_key_name
import data.terraform.gcp.helpers
import data.terraform.gcp.security.discovery_engine.data_store.vars

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

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details