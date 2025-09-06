package terraform.gcp.security.discovery_engine.cmek_config.cmek_config_single_region_keys # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.discovery_engine.cmek_config.vars

#cmek_config_single_region_keys


conditions := [
    [
    {
        "situation_description": "cmek_config_single_region_keys key is set to the wrong key!!!",
        "remedies": ["Ensure that it is set to the correct key"]
        },
      {
        "condition": "single_region_keys is mis-configured",
        "attribute_path": ["single_region_keys", 0, "kms_key"],
        "values": ["projects/735927692082/locations/eu/keyRings/my-ring/cryptoKeys/my-eu-key", "projects/735927692082/locations/europe-west1/keyRings/my-ring/cryptoKeys/my-ew1-key", "projects/735927692082/locations/europe-north1/keyRings/my-ring/cryptoKeys/my-en1-key"],
        "policy_type": "whitelist"
      }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details