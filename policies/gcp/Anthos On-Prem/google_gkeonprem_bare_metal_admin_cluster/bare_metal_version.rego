package terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_admin_cluster.bare_metal_version

import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_admin_cluster.vars

conditions := [
    [
        {
            "situation_description": "Bare Metal Admin Cluster must run an approved, patched Anthos on bare metal version.",
            "remedies": [
                "Set bare_metal_version to a version confirmed current/patched by the team - '1.16.9' is used here as a placeholder, not a confirmed value.",
                "This whitelist has not been verified against an authoritative source: the set of currently-supported, patched versions changes on Google's own release cadence and cannot be hardcoded here. Confirm the actual approved version list with the team before relying on this policy."
            ]
        },
        {
            "condition": "bare_metal_version is in approved whitelist",
            "attribute_path": ["bare_metal_version"],
            "values": ["1.16.9"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
