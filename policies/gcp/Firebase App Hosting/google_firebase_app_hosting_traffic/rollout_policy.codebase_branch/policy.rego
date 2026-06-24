package terraform.gcp.security.firebase_app_hosting.traffic.rollout_policy_codebase_branch

import data.terraform.helpers
import data.terraform.gcp.security.firebase_app_hosting.traffic.vars

conditions := [
    [
    {"situation_description" : "Rollout policy allows automatic deployments from potentially insecure branches",
    "remedies":[ "Disable automatic rollouts for production environments","Use specific release branches like 'main', 'release', or 'production'","Implement manual approval process for production deployments"]},
    {
        "condition": "Rollout policy should use secure branches for automation",
        "attribute_path" : ["rollout_policy", 0, "codebase_branch"],
        "values" : ["main", "master", "release", "production", "prod"],
        "policy_type" : "whitelist" 
    }
    ],
    [
    {"situation_description" : "Rollout policy is using insecure or development branches for automatic deployment",
    "remedies":[ "Avoid automatic rollouts from development branches","Use feature branches only for testing","Implement proper CI/CD approval gates"]},
    {
        "condition": "Rollout policy should not use development branches",
        "attribute_path" : ["rollout_policy", 0, "codebase_branch"],
        "values" : ["dev", "develop", "test", "feature", "experimental", "temp"],
        "policy_type" : "blacklist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
