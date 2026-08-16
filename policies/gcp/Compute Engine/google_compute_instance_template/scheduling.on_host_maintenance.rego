package terraform.gcp.security.compute_engine.google_compute_instance_template.scheduling_on_host_maintenance

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The instance template's scheduling.on_host_maintenance is not set to TERMINATE, risking silent breakage of Confidential VM guarantees or instance creation failure",
            "remedies": ["Set scheduling.on_host_maintenance to 'TERMINATE' to satisfy Confidential VM host-maintenance requirements"]
        },
        {
            "condition": "scheduling.on_host_maintenance must be exactly 'TERMINATE'",
            "attribute_path": ["scheduling", 0, "on_host_maintenance"],
            "values": ["TERMINATE"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details