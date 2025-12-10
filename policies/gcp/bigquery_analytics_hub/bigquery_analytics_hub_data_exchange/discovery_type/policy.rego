package terraform.gcp.security.bigquery_analytics_hub.bigquery_analytics_hub_data_exchange.discovery_type

import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_analytics_hub.bigquery_analytics_hub_data_exchange.vars

# Discovery type values that are NOT allowed for this data exchange
disallowed_discovery_types := ["DISCOVERY_TYPE_PUBLIC"]

conditions := [[
    {
        "situation_description": "The BigQuery Analytics Hub data exchange is publicly discoverable.",
        "remedies": [
            "Set 'discovery_type' to DISCOVERY_TYPE_PRIVATE or remove the field to keep the data exchange private from the public discovery page."
        ]
    },
    {
        "condition": "Discovery type must not be public.",
        "attribute_path": ["discovery_type"],
        "values": disallowed_discovery_types,
        "policy_type": "blacklist"
    }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
