package terraform.gcp.security.dataproc.job_iam.iam_least_privilege

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataproc.job_iam.vars

conditions := [
    [
        {"situation_description" : "A primitive role (owner, editor, or viewer) is being assigned to the job.",
         "remedies": [ "Replace the primitive role with a specific Dataproc role like 'roles/dataproc.viewer'."]},
        {
            "condition": "Checks if the assigned role is a primitive role.",
            "attribute_path" : ["role"],
            "values" : ["roles/owner", "roles/editor", "roles/viewer"],
            "policy_type" : "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details