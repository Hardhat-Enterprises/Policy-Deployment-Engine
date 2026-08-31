package terraform.gcp.security.compute_engine.google_compute_instance_group_manager.all_instances_config_metadata

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_group_manager.vars

conditions := [
  [
    {
      "situation_description": "OS Login is explicitly disabled in instance metadata.",
      "remedies": ["Remove 'enable-oslogin' or set it to 'TRUE' to keep centrally-managed IAM-based SSH access enforced."]
    },
    {
      "condition": "'enable-oslogin' must not be disabled",
      "attribute_path": ["all_instances_config", 0, "metadata", "enable-oslogin"],
      "values": ["TRUE", "true", "True"],
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "Project-wide SSH keys are explicitly re-enabled via instance metadata.",
      "remedies": ["Remove 'block-project-ssh-keys' or set it to 'TRUE' to keep project-wide SSH keys blocked."]
    },
    {
      "condition": "'block-project-ssh-keys' must not be disabled",
      "attribute_path": ["all_instances_config", 0, "metadata", "block-project-ssh-keys"],
      "values": ["TRUE", "true", "True"],
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "The interactive serial console is explicitly enabled via instance metadata.",
      "remedies": ["Remove 'serial-port-enable' or set it to 'FALSE' to keep the serial console disabled."]
    },
    {
      "condition": "'serial-port-enable' must not be enabled",
      "attribute_path": ["all_instances_config", 0, "metadata", "serial-port-enable"],
      "values": ["TRUE", "true"],
      "policy_type": "blacklist"
    }
  ],
  [

    # Note: a best-effort spot-check, not full coverage, It only catches a plaintext secret stored under the literal key "password" 
    {
      "situation_description": "A plaintext value is stored under the 'password' metadata key.",
      "remedies": ["Remove 'password' from metadata and store the credential in Secret Manager instead."]
    },
    {
      "condition": "'password' must not be set in metadata",
      "attribute_path": ["all_instances_config", 0, "metadata", "password"],
      "values": [null],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
