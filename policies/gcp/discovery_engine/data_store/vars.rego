package terraform.gcp.security.discovery_engine.data_store.vars

#Make sure you modify this to be correct!!
#This is for the data_store

variables := {
    "friendly_resource_name": "Discovery_engine_data_store",
    "resource_type":  "google_discovery_engine_data_store",
    "resource_value_name" : "data_store_id" # eg., "name"
    # Not sure if the above line is needed, its not in the tutorial.
}
