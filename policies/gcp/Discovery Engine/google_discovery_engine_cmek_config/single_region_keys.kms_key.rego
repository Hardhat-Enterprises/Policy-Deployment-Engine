package terraform.gcp.security.discovery_engine.google_discovery_engine_cmek_config.single_region_keys_kms_key
import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_cmek_config.vars

#cmek_config_single_region_keys

#Pattern whitelist wouldnt work, too many arguments

# policy_lint reports hard-coded-value on the value below, and the finding stands.
# A pattern whitelist only judges values that MATCH its target: one that does not
# match the shape is never flagged at all. This argument's non-compliant example
# is the empty string, so converting would make the fixture pass for the wrong
# reason. Either _helpers needs a pattern whitelist that fails a non-matching
# value, or the fixture needs a wrongly-scoped (not malformed) example.
conditions := [
    [
    {
        "situation_description": "cmek_config_single_region_keys key is set to the wrong key!!!",
        "remedies": ["Ensure that it is set to the correct key"]
        },
      {
        "condition": "single_region_keys is mis-configured",
        "attribute_path": ["single_region_keys", 0, "kms_key"],
        "values": ["projects/735927692082/locations/europe-west1/keyRings/my-ring/cryptoKeys/my-eu1-key"],
        "policy_type": "whitelist"
      }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
