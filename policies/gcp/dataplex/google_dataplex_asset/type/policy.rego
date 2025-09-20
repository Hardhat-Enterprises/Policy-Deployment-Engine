package terraform.gcp.security.dataplex.google_dataplex_asset.type

import data.terraform.gcp.security.dataplex.google_dataplex_asset.vars

default details := []
default message := []

invalid_type[d] if {
  rc := input.resource_changes[_]
  rc.type == vars.variables.resource_type

  after := rc.change.after
  after.resource_spec.type != "STORAGE_BUCKET"

  d := {
    "resource_address": rc.address,
    "attribute": "resource_spec.type",
    "why": sprintf("Dataplex Asset must be STORAGE_BUCKET, found '%s'", [after.resource_spec.type])
  }
}

details := [d | d := invalid_type[_]]

message := ["Dataplex Asset must use STORAGE_BUCKET type"] if { count(details) > 0 }
