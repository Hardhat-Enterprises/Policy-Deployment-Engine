package terraform.gcp.security.compute_engine.google_compute_image.guest_os_features_type

import data.terraform.gcp.security.compute_engine.google_compute_image.vars
import data.terraform.helpers

conditions := [
	[
		{
			"situation_description": "The Compute Image enables a guest OS feature outside the platform-approved security and compatibility feature set.",
			"remedies": [
				"Use a supported security or compatibility feature and remove MULTI_IP_SUBNET unless separately approved.",
			],
		},
		{
			"condition": "Guest OS feature must use a platform-approved API enumeration.",
			"attribute_path": ["guest_os_features", "type"],
			"values": [
				"SECURE_BOOT",
				"SEV_CAPABLE",
				"UEFI_COMPATIBLE",
				"VIRTIO_SCSI_MULTIQUEUE",
				"WINDOWS",
				"GVNIC",
				"IDPF",
				"SEV_LIVE_MIGRATABLE",
				"SEV_SNP_CAPABLE",
				"SUSPEND_RESUME_COMPATIBLE",
				"TDX_CAPABLE",
				"SEV_LIVE_MIGRATABLE_V2",
				"SNP_SVSM_CAPABLE",
			],
			"policy_type": "whitelist",
		},
	],
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
