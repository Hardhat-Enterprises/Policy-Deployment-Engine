package terraform.gcp.security.discovery_engine.cmek_config.cmek_config_single_region_keys 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.discovery_engine.cmek_config.vars

#cmek_config_single_region_keys

#change to pattern whitelist

conditions := [
    [
    {
        "situation_description": "cmek_config_single_region_keys key is set to the wrong key!!!",
        "remedies": ["Ensure that it is set to the correct key"]
        },
      {
        "condition": "single_region_keys is mis-configured",
        "attribute_path": ["single_region_keys", 0, "kms_key"],
        "values": ["projects/735927692082/locations/*/keyRings/my-ring/cryptoKeys/* ",[["europe-west1","europe-north1","eu"],["my-eu-key","my-eu-key1","my-eu-key2"]]],
        "policy_type": "pattern whitelist"
      }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details