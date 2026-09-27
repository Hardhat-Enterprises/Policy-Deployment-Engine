package terraform.gcp.security.compute_engine.google_compute_region_instance_template.confidential_instance_config_confidential_instance_type

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The regional instance template uses the weaker SEV confidential-computing option, which lacks the memory-integrity and anti-replay protections available with SEV_SNP.",
            "remedies": [
                "Use SEV_SNP or another approved stronger confidential-computing technology.",
                "Avoid plain SEV where stronger memory-integrity protections are required.",
                "Review the confidential-computing configuration."
            ]
        },
        {
            "condition": "Plain SEV must not be used as the confidential instance type.",
            "attribute_path": ["confidential_instance_config", 0, "confidential_instance_type"],
            "values": ["SEV"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
