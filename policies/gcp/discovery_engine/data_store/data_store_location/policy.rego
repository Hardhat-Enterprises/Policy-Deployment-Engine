package terraform.gcp.security.discovery_engine.data_store.data_store_location
import data.terraform.gcp.helpers
import data.terraform.gcp.security.discovery_engine.data_store.vars

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

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details