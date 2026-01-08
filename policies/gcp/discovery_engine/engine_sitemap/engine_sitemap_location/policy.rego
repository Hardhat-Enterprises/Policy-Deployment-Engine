package terraform.gcp.security.discovery_engine.engine_sitemap.engine_sitemap_location
import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.engine_sitemap.vars

#engine_sitemap_location

conditions := [
    [
    {
        "situation_description": "Is engine_sitemap_location set to eu?",
        "remedies": ["Ensure that it is set to eu"]
        },
      {
        "condition": "engine_sitemap_location is mis-configured",
        "attribute_path": ["location"],
        "values": ["eu"],
        "policy_type": "whitelist"
      }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details