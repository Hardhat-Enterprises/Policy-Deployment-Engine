package terraform.gcp.security.deploy.google_clouddeploy_automation.service_account
import data.terraform.helpers
import data.terraform.gcp.security.deploy.google_clouddeploy_automation.vars

conditions := [
    [
        {"situation_description": "Automation using generic service account",
         "remedies": ["Automation should use dedicated service account with specific naming pattern"]},
        {
            "condition": "Automation uses dedicated service account",
            "attribute_path": ["service_account"],
            "values": ["*@*", [["dedicated-automation-sa"], ["my-project.iam.gserviceaccount.com"]]],
            "policy_type": "pattern whitelist"
        }
    ]
]


result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
