package terraform.gcp.security.compute_engine.google_compute_target_https_proxy.certificate_manager_certificates

import data.terraform.gcp.security.compute_engine.google_compute_target_https_proxy.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Target HTTPS proxy certificate_manager_certificates includes an unapproved certificate.",
      "remedies": [
        "Restrict certificate_manager_certificates to only explicitly approved certificate manager certificates.",
      ],
    },
    {
      "condition": "certificate_manager_certificates must contain only approved certificates.",
      "attribute_path": ["certificate_manager_certificates"],
      "values": [
        "//certificatemanager.googleapis.com/projects/approved-project/locations/global/certificates/approved-cert",
      ],
      "policy_type": "whitelist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
