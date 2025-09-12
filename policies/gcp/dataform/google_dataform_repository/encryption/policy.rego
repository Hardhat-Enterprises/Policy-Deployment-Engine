package terraform.gcp.security.dataform.google_dataform_repository.encryption
import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository.vars

conditions := [
  [
    {
      "situation_description": "Dataform repository must use customer-managed encryption key (CMEK).",
      "remedies": ["Set kms_key_name to a valid CMEK path matching the repository region."]
    },
    {
      "condition": "kms_key_name must be set (non-empty)",
      "attribute_path": ["kms_key_name"],
      "policy_type": "blacklist",
      "values": ["", null]
    }
  ]
  ,
  [
    {
      "situation_description": "Repository must use a customer-managed encryption key (CMEK)",
      "remedies": ["Set kms_key_name to a valid CMEK resource", "Rotate keys per org policy"]
    },
    {
      "condition": "kms_key_name must reference a CMEK",
      "attribute_path": ["kms_key_name"],
      "policy_type": "pattern whitelist",
      "values": ["projects/*/locations/*/keyRings/*/cryptoKeys/*"]
    }
  ]
  ,
  [
    {
      "situation_description": "FORCE deletion risks accidental data loss",
      "remedies": ["Set deletion_policy to DELETE", "Require manual cleanup for child resources"]
    },
    {
      "condition": "Disallow FORCE deletion policy",
      "attribute_path": ["deletion_policy"],
      "policy_type": "blacklist",
      "values": ["FORCE"]
    }
  ]
  ,
  [
    {
      "situation_description": "Git integration configured without a remote URL",
      "remedies": ["Provide git_remote_settings.url", "Verify default_branch matches remote"]
    },
    {
      "condition": "Require git remote URL when Git is configured",
      "attribute_path": ["git_remote_settings", 0, "url"],
      "policy_type": "pattern whitelist",
      "values": ["*"]
    }
  ]
  ,
  [
    {
      "situation_description": "Git integration missing default branch",
      "remedies": ["Set git_remote_settings.default_branch (e.g., main)"]
    },
    {
      "condition": "Require default_branch when git remote is set",
      "attribute_path": ["git_remote_settings", 0, "default_branch"],
      "policy_type": "pattern whitelist",
      "values": ["*"]
    }
  ]
  ,
  [
    {
      "situation_description": "workspace_compilation_overrides present but default_database not set",
      "remedies": ["Set default_database to a valid GCP project ID used by BigQuery"]
    },
    {
      "condition": "Require default_database when overrides are used",
      "attribute_path": ["workspace_compilation_overrides", 0, "default_database"],
      "policy_type": "pattern whitelist",
      "values": ["*"]
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details






