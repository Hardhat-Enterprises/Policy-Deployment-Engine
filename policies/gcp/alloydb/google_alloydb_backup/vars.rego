package terraform.gcp.security.alloydb.google_alloydb_backup.vars

variables := {
	"friendly_resource_name": "AlloyDB Backup",
	"resource_type": "google_alloydb_backup",
	"resource_value_name": "backup_id",
	"allowed_locations": ["us-central1", "us-east1"],
	"kms_key_self_link_regex": "^projects/[^/]+/locations/[^/]+/keyRings/[^/]+/cryptoKeys/[^/]+$",
}
