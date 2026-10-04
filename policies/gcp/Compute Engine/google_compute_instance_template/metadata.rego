package terraform.gcp.security.compute_engine.google_compute_instance_template.metadata

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The instance template's metadata does not set enable-oslogin to TRUE, so SSH access is not managed centrally through IAM and OS Login.",
            "remedies": ["Set metadata = { \"enable-oslogin\" = \"TRUE\" } to enforce OS Login for centralized, auditable SSH access control."]
        },
        {
            "condition": "metadata['enable-oslogin'] must be exactly 'TRUE'",
            "attribute_path": ["metadata", "enable-oslogin"],
            "values": ["TRUE"],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "The instance template's metadata does not set block-project-ssh-keys to TRUE, so any SSH key added to project metadata grants access to every instance created from the template.",
            "remedies": ["Set metadata = { \"block-project-ssh-keys\" = \"TRUE\" } so only instance-level keys or OS Login grant SSH access."]
        },
        {
            "condition": "metadata['block-project-ssh-keys'] must be exactly 'TRUE'",
            "attribute_path": ["metadata", "block-project-ssh-keys"],
            "values": ["TRUE"],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "The instance template's metadata enables the interactive serial console (serial-port-enable), which gives console access that bypasses network firewall rules.",
            "remedies": ["Remove serial-port-enable from metadata or set it to \"FALSE\"; enable the serial console only temporarily for troubleshooting."]
        },
        {
            "condition": "metadata['serial-port-enable'] must not be enabled",
            "attribute_path": ["metadata", "serial-port-enable"],
            "values": ["TRUE", "true", "1"],
            "policy_type": "blacklist"
        }
    ]
]


result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
