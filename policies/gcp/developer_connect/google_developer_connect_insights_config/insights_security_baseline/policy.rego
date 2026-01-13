package terraform.gcp.security.developer_connect.google_developer_connect_insights_config.insights_security_baseline
import data.terraform.helpers
import data.terraform.gcp.security.developer_connect.google_developer_connect_insights_config.vars

allowed_ar_uri := ["*-docker.pkg.dev/*/*/*", [["australia-southeast1","australia-southeast2"], ["pde2025"], ["my-repo"], ["my-image"]]]

conditions := [
  [
    {
      "situation_description": "Artifact URI must be an approved Artifact Registry location and project",
      "remedies": ["Use australia-southeast1-docker.pkg.dev/pde2025/my-repo/my-image"]
    },
    {
      "condition": "Artifact URI not approved",
      "attribute_path": ["artifact_configs", 0, "uri"],
      "values": allowed_ar_uri,
      "policy_type": "pattern whitelist"
    }
  ],
  [
    {
      "situation_description": "Artifact Registry project must be approved",
      "remedies": ["Set google_artifact_registry.project_id = pde2025"]
    },
    {
      "condition": "Artifact Registry project not approved",
      "attribute_path": ["artifact_configs", 0, "google_artifact_registry", 0, "project_id"],
      "values": ["pde2025"],
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "Artifact Analysis project must be approved",
      "remedies": ["Set google_artifact_analysis.project_id = pde2025"]
    },
    {
      "condition": "Artifact Analysis project not approved",
      "attribute_path": ["artifact_configs", 0, "google_artifact_analysis", 0, "project_id"],
      "values": ["pde2025"],
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "App Hub Application must belong to approved project and region",
      "remedies": ["Use //apphub.googleapis.com/projects/723741059731/locations/australia-southeast1/applications/app1"]
    },
    {
      "condition": "App Hub Application not approved",
      "attribute_path": ["app_hub_application"],
      "values": ["//apphub.googleapis.com/projects/*/locations/*/applications/*", [["723741059731"], ["australia-southeast1","australia-southeast2"], ["app1"]]],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
