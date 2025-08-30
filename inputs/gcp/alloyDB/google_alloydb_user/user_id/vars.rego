package terraform.gcp.security.alloydb.google_alloydb_user.vars

variables := {
  # Target this resource type in plan JSON
  "target_type": "google_alloydb_user",

  # Blocked IDs (tweak for your org)
  "disallowed_usernames": [
    "admin",
    "root",
    "postgres",
    "alloydbadmin",
    "superuser",
    "sa",
    "dbadmin",
    "test",
    "temp",
    "dev"
  ],

  # Start with a letter; then letters/digits/_ ; total 3–30 chars
  "username_pattern": "^[a-z][a-z0-9_]{2,29}$"
}
