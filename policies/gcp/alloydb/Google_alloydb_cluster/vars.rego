package terraform.gcp.security.alloydb.google_alloydb_cluster.vars

variables := {
	"friendly_resource_name": "AlloyDB Cluster",
	"resource_type": "google_alloydb_cluster",
	"resource_value_name": "cluster_id",
	"accepted_retention_seconds": [604800, 1209600, 1814400, 2419200, 2592000],
	"allowed_backup_locations": ["us-central1", "us-east1"],
	"approved_vpc_networks": [
		"projects/pde-demo/global/networks/prod-vpc",
		"projects/shared-host-project/global/networks/shared-vpc",
	],
	"require_continuous_backup": true,
	"kms_key_self_link_regex": "^projects/[^/]+/locations/[^/]+/keyRings/[^/]+/cryptoKeys/[^/]+$",
}
