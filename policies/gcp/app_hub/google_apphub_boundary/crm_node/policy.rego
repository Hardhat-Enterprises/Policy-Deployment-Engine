package terraform.gcp.security.app_hub.google_apphub_boundary.crm_node
import data.terraform.helpers
import data.terraform.gcp.security.app_hub.google_apphub_boundary.vars

conditions := [
    [
      {"situation_description" : "CRM node being attached to the boundary should only be a folder or a single application",
      "remedies":[ "CRM node path should be set to 'folders/*' or 'projects/*'"]},
      {
          "condition": "Check if boundary's crm_node is named as allowed one from",
          "attribute_path" : ["crm_node"], 
          "values" : [
            "*", 
            [["projects", "folders"]]
          ],
          "policy_type" : "pattern whitelist" 
      }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details