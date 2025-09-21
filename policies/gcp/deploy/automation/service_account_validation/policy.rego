package terraform.gcp.security.deploy.automation.service_account_validation
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deploy.automation.vars

conditions := [
    [
        {"situation_description": "Automation using generic service account",
         "remedies": ["Automation should use dedicated service account with specific naming pattern"]},
        {
            "condition": "Automation uses dedicated service account",
            "attribute_path": ["service_account"],
            "values": ["dedicated-automation-sa@my-project.iam.gserviceaccount.com"],
            "policy_type": "whitelist"
        }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details