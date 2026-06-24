package terraform.gcp.security.app_hub.google_apphub_application.attributes_criticality_type
import data.terraform.helpers
import data.terraform.gcp.security.app_hub.google_apphub_application.vars

criticalities := ["MISSION_CRITICAL", "HIGH", "MEDIUM", "LOW"]
environments := ["DEVELOPMENT", "TEST", "STAGING", "PRODUCTION"]

# CONDITIONS
conditions := [
    [
    {
      "situation_description": "Invalid criticality value for App Hub application",
      "remedies": [sprintf("Set attributes.criticality.type to one of: %v",[criticalities])]
    },
    {
      "condition": "attributes.criticality.type must be an allowed value",
      "attribute_path": ["attributes", 0, "criticality", 0, "type"],
      "policy_type": "whitelist",
      "values": criticalities
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details