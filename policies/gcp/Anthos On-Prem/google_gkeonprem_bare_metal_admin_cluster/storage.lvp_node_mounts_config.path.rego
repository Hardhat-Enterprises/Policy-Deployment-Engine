package terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_admin_cluster.storage_lvp_node_mounts_config_path

import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_bare_metal_admin_cluster.vars

conditions := [
    [
        {
            "situation_description": "Bare Metal Admin Cluster's local-PersistentVolume node-mount path must not be a sensitive host system path.",
            "remedies": [
                "Point storage.lvp_node_mounts_config.path at a dedicated, non-system directory reserved for cluster storage.",
                "This is functionally a hostPath-style mount: pointing it at a sensitive root (e.g. '/', '/etc', '/root', '/boot', '/proc', '/sys', '/var/run/docker.sock', '/home') exposes host filesystem content or control-plane sockets to workloads - a well-established container-escape/privilege-escalation vector."
            ]
        },
        {
            "condition": "storage.lvp_node_mounts_config.path must not be a known-sensitive host path",
            "attribute_path": ["storage", 0, "lvp_node_mounts_config", 0, "path"],
            "values": ["/", "/etc", "/root", "/boot", "/proc", "/sys", "/var/run/docker.sock", "/home"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
