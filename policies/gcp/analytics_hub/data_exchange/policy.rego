package terraform.gcp.analytics_hub.data_exchange.naming_standard

import data.terraform.gcp.helpers
import data.terraform.gcp.analytics_hub.data_exchange.vars

# ----------------------------------------------------------------
# 1. Enforce Display Name Prefix
# ----------------------------------------------------------------
deny[r] {
  rc := input.resource_changes[_]
  rc.type == "google_bigquery_analytics_hub_data_exchange"
  ex := rc.change.after
  not helpers.name_starts_with(ex.display_name, vars.prefix)
  r := {
    "msg": sprintf("resource %s: display_name '%s' must start with prefix '%s'",
                   [rc.address, ex.display_name, vars.prefix]),
    "resource": rc.type
  }
}

# ----------------------------------------------------------------
# 2. Validate data_exchange_id (letters, numbers, underscores only)
# ----------------------------------------------------------------
deny[r] {
  rc := input.resource_changes[_]
  rc.type == "google_bigquery_analytics_hub_data_exchange"
  ex := rc.change.after
  not regex.match("^[a-zA-Z0-9_]+$", ex.data_exchange_id)
  r := {
    "msg": sprintf("resource %s: data_exchange_id '%s' contains invalid characters",
                   [rc.address, ex.data_exchange_id]),
    "resource": rc.type
  }
}

# ----------------------------------------------------------------
# 3. Display name should not start or end with spaces
# ----------------------------------------------------------------
deny[r] {
  rc := input.resource_changes[_]
  rc.type == "google_bigquery_analytics_hub_data_exchange"
  ex := rc.change.after
  regex.match("(^\\s+|\\s+$)", ex.display_name)
  r := {
    "msg": sprintf("resource %s: display_name '%s' must not start or end with spaces",
                   [rc.address, ex.display_name]),
    "resource": rc.type
  }
}

# ----------------------------------------------------------------
# 4. Require metadata: primary_contact
# ----------------------------------------------------------------
deny[r] {
  rc := input.resource_changes[_]
  rc.type == "google_bigquery_analytics_hub_data_exchange"
  ex := rc.change.after
  not ex.primary_contact
  r := {
    "msg": sprintf("resource %s: primary_contact must be set", [rc.address]),
    "resource": rc.type
  }
}

# ----------------------------------------------------------------
# 5. Require metadata: documentation
# ----------------------------------------------------------------
deny[r] {
  rc := input.resource_changes[_]
  rc.type == "google_bigquery_analytics_hub_data_exchange"
  ex := rc.change.after
  not ex.documentation
  r := {
    "msg": sprintf("resource %s: documentation must be set", [rc.address]),
    "resource": rc.type
  }
}

# ----------------------------------------------------------------
# 6. Enforce discovery_type = PRIVATE
# ----------------------------------------------------------------
deny[r] {
  rc := input.resource_changes[_]
  rc.type == "google_bigquery_analytics_hub_data_exchange"
  ex := rc.change.after
  ex.discovery_type != "DISCOVERY_TYPE_PRIVATE"
  r := {
    "msg": sprintf("resource %s: discovery_type must be PRIVATE (found '%s')",
                   [rc.address, ex.discovery_type]),
    "resource": rc.type
  }
}

# ----------------------------------------------------------------
# 7. Require subscriber query logging
# ----------------------------------------------------------------
deny[r] {
  rc := input.resource_changes[_]
  rc.type == "google_bigquery_analytics_hub_data_exchange"
  ex := rc.change.after
  not ex.log_linked_dataset_query_user_email
  r := {
    "msg": sprintf("resource %s: log_linked_dataset_query_user_email must be enabled",
                   [rc.address]),
    "resource": rc.type
  }
}

# ----------------------------------------------------------------
# 8. Enforce project whitelist
# ----------------------------------------------------------------
deny[r] {
  rc := input.resource_changes[_]
  rc.type == "google_bigquery_analytics_hub_data_exchange"
  ex := rc.change.after
  ex.project != ""                      # project provided
  not vars.allowed_projects[ex.project] # not in whitelist
  r := {
    "msg": sprintf("resource %s: project '%s' is not in the approved list",
                   [rc.address, ex.project]),
    "resource": rc.type
  }
}
