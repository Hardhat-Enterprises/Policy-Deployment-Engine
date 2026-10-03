package terraform.gcp.security.compute_engine.google_compute_instance_template.disk_guest_os_features

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "A disk in the instance template does not enable the guest OS features UEFI_COMPATIBLE and SEV_CAPABLE. Without them, instances cannot use Shielded VM secure boot or Confidential VM memory encryption, and those protections are silently unavailable.",
            "remedies": [
                "Add guest_os_features = [\"UEFI_COMPATIBLE\", \"SEV_CAPABLE\"] to every disk block in the instance template.",
                "Use a source image that supports UEFI and SEV so the features can take effect."
            ]
        },
        {
            "condition": "Check that every disk enables UEFI_COMPATIBLE and SEV_CAPABLE",
            "attribute_path": ["disk", "guest_os_features"],
            "values": ["UEFI_COMPATIBLE", "SEV_CAPABLE"],
            "policy_type": "element required"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
