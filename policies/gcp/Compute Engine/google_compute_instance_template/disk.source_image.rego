package terraform.gcp.security.compute_engine.google_compute_instance_template.disk_source_image

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The instance template boots from an image that is not an approved hardened image (approved images follow the hardened-* naming convention). Public, community or outdated images can contain unpatched vulnerabilities or untrusted software.",
            "remedies": [
                "Set disk.source_image to an approved hardened image, referenced by its full path (projects/<project>/global/images/hardened-...).",
                "Build any new base image through the hardened image pipeline rather than referencing a public image directly."
            ]
        },
        {
            "condition": "Check that disk.source_image is an approved hardened image",
            "attribute_path": ["disk", 0, "source_image"],
            "values": ["projects/*/global/images/hardened-*"],
            "policy_type": "element pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
