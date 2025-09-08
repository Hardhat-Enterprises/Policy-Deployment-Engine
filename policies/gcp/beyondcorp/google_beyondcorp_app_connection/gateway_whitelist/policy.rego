package terraform.gcp.security.beyondcorp.google_beyondcorp_app_connection.gateway_whitelist
import data.terraform.gcp.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_app_connection.vars
conditions := [
    [
    {
      "situation_description": "AppConnection references an unapproved AppGateway.",
      "remedies": ["Use 'projects/{project_id}/locations/{locationId}/appgateways/{gateway_id}' format for application gateway"]
    },
    {
      "condition": "Check if they used the correct naming structure for the gateway",
      "attribute_path": ["gateway",0,"app_gateway"],
      "values": ["projects/{project_id}/locations/{locationId}/appgateways/{gateway_id}"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
