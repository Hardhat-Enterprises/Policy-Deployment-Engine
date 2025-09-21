package terraform.gcp.security.alloydb.google_alloydb_instance.vars

variables := {
	"friendly_resource_name": "AlloyDB Instance",
	"resource_type": "google_alloydb_instance",
	"resource_value_name": "instance_id",
	"allowed_ssl_modes": ["ENCRYPTED_ONLY"],
	"require_public_ip_disabled": true,
}
