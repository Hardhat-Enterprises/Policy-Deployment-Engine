package terraform.gcp.security.gke_backup.google_gke_backup_restore_plan.secure_restore
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_backup.google_gke_backup_restore_plan.vars

conditions := [[
  {
    "situation_description": "Restore plan references unapproved backup plan or cluster",
    "remedies": ["Use approved backup plans and target clusters within your organization"]
  },
  {
    "condition": "backup_plan must reference approved backup plans",
    "attribute_path": ["backup_plan"],
    "values": [
      "projects/*/locations/australia-southeast*/backupPlans/*",
      [["fluent-coder-468700-h4"], ["australia-southeast1", "australia-southeast2"]]
    ],
    "policy_type": "pattern whitelist"
  },
  {
    "condition": "cluster must reference approved target clusters",
    "attribute_path": ["cluster"],
    "values": [
      "projects/*/locations/australia-southeast*/clusters/*",
      [["fluent-coder-468700-h4"], ["australia-southeast1", "australia-southeast2"]]
    ],
    "policy_type": "pattern whitelist"
  }
], [
  {
    "situation_description": "Restore configuration uses insecure restore modes",
    "remedies": ["Use FAIL_ON_CONFLICT for namespaced resources and USE_EXISTING_VERSION for cluster resources"]
  },
  {
    "condition": "namespaced_resource_restore_mode must be secure",
    "attribute_path": ["restore_config", 0, "namespaced_resource_restore_mode"],
    "values": ["FAIL_ON_CONFLICT", "MERGE_SKIP_ON_CONFLICT"],
    "policy_type": "whitelist"
  },
  {
    "condition": "cluster_resource_conflict_policy must be secure",
    "attribute_path": ["restore_config", 0, "cluster_resource_conflict_policy"],
    "values": ["USE_EXISTING_VERSION"],
    "policy_type": "whitelist"
  }
], [
  {
    "situation_description": "Restore plan location is not in approved region",
    "remedies": ["Set location to australia-southeast1 or australia-southeast2"]
  },
  {
    "condition": "location must be in approved Australian regions",
    "attribute_path": ["location"],
    "values": ["australia-southeast1", "australia-southeast2"],
    "policy_type": "whitelist"
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details