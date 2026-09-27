package terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.cloud_tasks.google_cloud_tasks_queue.vars

conditions := [
    [
        {
            "situation_description": "The Cloud Tasks queue is not protected against Terraform-driven deletion, which could cause unintended loss of task-processing infrastructure.",
            "remedies": [
                "Set deletion_policy to PREVENT.",
                "Require an explicit lifecycle review before allowing Terraform to destroy protected Cloud Tasks queues."
            ]
        },
        {
            "condition": "Check whether deletion_policy prevents Terraform from destroying the Cloud Tasks queue.",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details