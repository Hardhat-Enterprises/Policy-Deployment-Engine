package terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.gce_setup_metadata

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.vars

# Merged `gce_setup.metadata`-scoped policy. Each element of `conditions` is an
# independent scenario evaluated on its own by helpers.get_multi_summary:
#   1. block_project_ssh_keys     - project-wide SSH keys must be blocked
#   2. idle_timeout_seconds       - an idle timeout must be configured
#   3. notebook_disable_downloads - file downloads must be disabled
#   4. notebook_disable_root      - root access must be disabled
#   5. notebook_disable_terminal  - terminal access must be disabled
conditions := [
  [
    {
      "situation_description": "Ensure project-wide SSH keys are blocked. Allowing them means any project member with SSH key access can reach the instance, bypassing IAM controls.",
      "remedies": ["Set gce_setup.metadata[\"block-project-ssh-keys\"] to \"true\"."]
    },
    {
      "condition": "block-project-ssh-keys is not set to true",
      "attribute_path": ["gce_setup", 0, "metadata", "block-project-ssh-keys"],
      "values": ["true"],
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "Ensure an idle timeout is configured. Without it, abandoned instances run indefinitely, increasing cost and attack surface.",
      "remedies": ["Set gce_setup.metadata[\"idle-timeout-seconds\"] to a value (e.g. \"3600\" for 1 hour)."]
    },
    {
      "condition": "idle-timeout-seconds is not set",
      "attribute_path": ["gce_setup", 0, "metadata", "idle-timeout-seconds"],
      "values": null,
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Ensure file downloads are disabled via metadata. Unrestricted downloads can be used to exfiltrate data or introduce malicious files.",
      "remedies": ["Set gce_setup.metadata[\"notebook-disable-downloads\"] to \"true\"."]
    },
    {
      "condition": "notebook-disable-downloads is not set to true",
      "attribute_path": ["gce_setup", 0, "metadata", "notebook-disable-downloads"],
      "values": ["true"],
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "Ensure root access is disabled via metadata. Running notebooks as root increases the blast radius of any code execution vulnerability.",
      "remedies": ["Set gce_setup.metadata[\"notebook-disable-root\"] to \"true\"."]
    },
    {
      "condition": "notebook-disable-root is not set to true",
      "attribute_path": ["gce_setup", 0, "metadata", "notebook-disable-root"],
      "values": ["true"],
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "Ensure terminal access is disabled via metadata. The JupyterLab terminal provides direct shell access to the VM, bypassing notebook-level controls.",
      "remedies": ["Set gce_setup.metadata[\"notebook-disable-terminal\"] to \"true\"."]
    },
    {
      "condition": "notebook-disable-terminal is not set to true",
      "attribute_path": ["gce_setup", 0, "metadata", "notebook-disable-terminal"],
      "values": ["true"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
