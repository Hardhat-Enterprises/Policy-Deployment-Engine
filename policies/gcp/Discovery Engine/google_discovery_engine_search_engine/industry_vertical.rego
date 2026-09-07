package terraform.gcp.security.discovery_engine.google_discovery_engine_search_engine.industry_vertical
import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_search_engine.vars

#search_engine_industry_vertical

conditions := [
    [
    {
        "situation_description": "Is search_engine_industry_verticaln configured correctly",
        "remedies": ["Ensure that it is not set to the wrong type"]
        },
      {
        "condition": "search_engine_industry_vertical is mis-configured",
        "attribute_path": ["industry_vertical"],
        "values": ["GENERIC"],
        "policy_type": "whitelist"
      }
    ]
]


result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
