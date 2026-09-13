package terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_private_cloud.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.cloud_vmware_engine.google_vmwareengine_private_cloud.vars

conditions := [[
        {
                "situation_description": "Private clouds should be protected from accidental deletion",
                "remedies": ["Set deletion_policy to PREVENT"],
        },
        {
                "condition": "deletion_policy must prevent deletion",
                "attribute_path": ["deletion_policy"],
                "values": ["PREVENT"],
                "policy_type": "whitelist",
        },
]]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message

details := summary.details