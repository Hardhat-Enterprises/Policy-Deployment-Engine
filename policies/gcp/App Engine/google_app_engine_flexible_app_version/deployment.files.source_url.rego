package terraform.gcp.security.app_engine.google_app_engine_flexible_app_version.deployment.files.source_url
import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_flexible_app_version.vars

conditions := [
  [
    {
      "situation_description" : "Deployment file source URLs should use HTTPS, not plain HTTP",
      "remedies":[
        "Use an https:// source_url instead of http://"
      ]
    },
    {
      "condition": "Check that source_url does not use the insecure http scheme",
      "attribute_path" : ["deployment", 0, "files", 0, "source_url"],
      "values" : ["*://*", [["http"]]],
      "policy_type" : "pattern blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
