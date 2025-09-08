package terraform.gcp.cloudbuild.bitbucket_server_config

import data.terraform.gcp.cloudbuild.bitbucket_server_config.naming_standard as naming

results = {
  "deny": [msg | msg := naming.deny[_]]
}
