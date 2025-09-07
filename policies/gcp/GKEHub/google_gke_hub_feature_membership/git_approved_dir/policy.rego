package terraform.gcp.security.gke_hub.google_gke_hub_feature_membership.git_approved_dir
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_hub.google_gke_hub_feature_membership.vars

conditions := [[
  {
    "situation_description": "Config Sync git.policy_dir is not set to an approved directory",
    "remedies": ["Make sure your in the approved subdirectory 'project/*')"]
  },
  {
    "condition": "git.policy_dir must match approved values",
    "attribute_path": ["configmanagement",0,"config_sync",0,"git",0,"policy_dir"],
    "values": ["project/*", [["test","prod","deploy"]]],
    "policy_type": "pattern whitelist"
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

