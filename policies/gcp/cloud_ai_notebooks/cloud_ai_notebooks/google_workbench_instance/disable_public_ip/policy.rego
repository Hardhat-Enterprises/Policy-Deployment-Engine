package terraform.gcp.security.cloud_ai_notebooks.cloud_ai_notebooks.google_workbench_instance.disable_public_ip

import data.terraform.helpers
import data.terraform.gcp.security.cloud_ai_notebooks.cloud_ai_notebooks.google_workbench_instance.vars

conditions := [
  [
    {
      "situation_description": "Ensure the Workbench instance does not have a public IP assigned. Public IPs expose the notebook VM directly to the internet, creating an attack surface for unauthorised access, data exfiltration, and cryptojacking. This setting is immutable after instance creation and cannot be changed without destroying and recreating the instance.",
      "remedies": ["Set gce_setup.disable_public_ip to true to enforce private-only networking. Ensure the VPC subnet has Private Google Access enabled so the instance can still reach Google APIs. Use the Workbench proxy or Identity-Aware Proxy (IAP) for secure user access to JupyterLab."]
    },
    {
      "condition": "disable_public_ip is not set to true",
      "attribute_path": ["gce_setup", 0, "disable_public_ip"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
