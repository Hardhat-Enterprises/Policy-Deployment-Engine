package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_repository.remote_uri_github_org_whitelist

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_repository.vars

conditions := [
    [
    {"situation_description" : "Cloud Build v2 repository is connected to an unapproved GitHub organisation",
    "remedies":["Use a repository from the approved GitHub organisation"]},
    {
        "condition": "Block unapproved GitHub organisation repository URL",
        "attribute_path" : ["remote_uri"],
        "values" : ["https://github.com/random-user/unknown-repo.git"],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details