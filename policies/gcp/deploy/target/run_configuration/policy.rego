package terraform.gcp.security.deploy.target.run_configuration
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deploy.target.vars

conditions := [
    [
    {"situation_description" : "Cloud Run service location is not in approved secure regions",
    "remedies":[ "Deploy to approved secure regions only","Ensure service location meets security requirements"]},
    {
        "condition": "Cloud Run service must be deployed in approved secure locations",
            "attribute_path": ["run", 0, "location"],
            "values": [
                "projects/*/locations/*",
                [
                    ["my-project-name"],
                    ["us-central1", "us-east1", "europe-west1", "asia-southeast1"]
                ]
            ],
            "policy_type": "pattern whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details