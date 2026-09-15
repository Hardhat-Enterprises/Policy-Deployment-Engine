package terraform.gcp.security.discovery_engine.google_discovery_engine_data_store.location
import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_data_store.vars

#Data_store_location

conditions := [
    [
    {
        "situation_description": "Location is set to the wrong value",
        "remedies": ["Ensure Location is set to eu"]
        },
      {
        "condition": "Location is mis-configured",
        "attribute_path": ["location"],
        "values": ["eu"],
        "policy_type": "whitelist"
      }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
