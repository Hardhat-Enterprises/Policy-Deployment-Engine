package terraform.gcp.security.deploy.target.run
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
                "projects/my-project-name/locations/us-central1",
                "projects/my-project-name/locations/us-east1",
                "projects/my-project-name/locations/europe-west1",
                "projects/my-project-name/locations/asia-southeast1"
            ],
            "policy_type": "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details