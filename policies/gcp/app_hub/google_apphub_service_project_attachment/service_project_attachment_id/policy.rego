package terraform.gcp.security.app_hub.google_apphub_service_project_attachment.service_project_attachment_id
import data.terraform.helpers
import data.terraform.gcp.security.app_hub.google_apphub_service_project_attachment.vars

conditions := [
  [
    {
        "situation_description": "Enforce that service project attachment id is not missing or empty.",
        "remedies": ["Set service project attachment id to the ID of service project."]
    },
    {
        "condition": "Service project attachment id must be set.",
        "attribute_path": ["service_project_attachment_id"],
        "values" : [null, "", []],
        "policy_type": "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details

