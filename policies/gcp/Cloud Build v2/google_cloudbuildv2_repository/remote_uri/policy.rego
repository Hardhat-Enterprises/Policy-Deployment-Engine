package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_repository.remote_uri

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_repository.vars

# Merged policy for `remote_uri` — 2 independent scenarios, each a
# situation in `conditions`, evaluated separately by helpers.get_multi_summary.
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
    ],
[
    {"situation_description" : "Cloud Build v2 repository remote URI is using insecure HTTP",
    "remedies":["Use HTTPS instead of HTTP for remote_uri"]},
    {
        "condition": "Remote URI must not use HTTP",
        "attribute_path" : ["remote_uri"],
        "values" : ["http://github.com/approved-org/secure-repo.git"],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
