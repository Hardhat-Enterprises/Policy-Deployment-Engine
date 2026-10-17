package terraform.gcp.security.compute_engine.google_compute_instance_template.confidential_instance_config_confidential_instance_type

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The instance template's confidential_instance_config.confidential_instance_type is not a modern confidential computing tier. Only SEV_SNP and TDX add memory integrity protection on top of encryption; plain SEV encrypts memory but does not protect it against replay or remapping by a compromised hypervisor.",
            "remedies": [
                "Set confidential_instance_config.confidential_instance_type to SEV_SNP (with min_cpu_platform = \"AMD Milan\") or TDX.",
                "Move workloads still on SEV to an SEV_SNP or TDX capable machine type."
            ]
        },
        {
            "condition": "confidential_instance_config.confidential_instance_type must be SEV_SNP or TDX",
            "attribute_path": ["confidential_instance_config", 0, "confidential_instance_type"],
            "values": ["SEV_SNP", "TDX"],
            "policy_type": "whitelist"
        }
    ]
]


result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
