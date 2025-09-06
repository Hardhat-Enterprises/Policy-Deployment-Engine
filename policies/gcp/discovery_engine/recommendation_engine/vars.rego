package terraform.gcp.security.discovery_engine.recommendation_engine.vars

#Make sure you modify this to be correct!!
#This is for the recommendation_engine

variables := {
    "friendly_resource_name": "engine_id",
    "resource_type":  "google_discovery_engine_recommendation_engine",
    "resource_value_name" : "engine_id" # eg., "name"
    # Not sure if the above line is needed, its not in the tutorial.
}
