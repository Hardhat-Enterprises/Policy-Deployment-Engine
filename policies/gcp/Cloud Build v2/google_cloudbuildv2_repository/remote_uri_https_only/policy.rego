package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_repository.remote_uri_https_only

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_repository.vars

conditions := [
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