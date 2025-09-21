package terraform.gcp.security.discovery_engine.search_engine.search_engine_industry_vertical
import data.terraform.gcp.helpers
import data.terraform.gcp.security.discovery_engine.search_engine.vars

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


message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details