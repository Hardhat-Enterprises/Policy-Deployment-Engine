package terraform.gcp.security.discovery_engine.recommendation_engine.recommendation_engine_data_store_ids 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.discovery_engine.recommendation_engine.vars

#recommendation_engine_data_store_ids

#Remove?

conditions := [
    [
    {
        "situation_description": "data_store_ids is not set up correctly",
        "remedies": ["Ensure The data_store_ids is set up correctly according to rules"]
        },
      {
        "condition": "data_store_ids is mis-configured",
        "attribute_path": ["data_store_ids"],
        "values": ["c-recommendation-datastore-id"],
        "policy_type": "whitelist"
      }
]
]
message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details