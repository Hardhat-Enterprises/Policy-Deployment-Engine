package terraform.gcp.security.discovery_engine.google_discovery_engine_sitemap.uri
import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_sitemap.vars

#engine_sitemap_uri

conditions := [
    [
    {
        "situation_description": "Is engine_sitemap_uri set to correct uri?",
        "remedies": ["Ensure that it is set to valid"]
        },
      {
        "condition": "engine_sitemap_uri is mis-configured",
        "attribute_path": ["uri"],
        "values": ["https://www.valid.com/sitemap.xml"],
        "policy_type": "whitelist"
      }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
