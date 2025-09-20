package terraform.gcp.security.dataplex.google_dataplex_asset.json_options

import data.terraform.gcp.security.dataplex.google_dataplex_asset.vars

default details := []
default message := []

json_options_missing[d] if {
  rc := input.resource_changes[_]
  rc.type == vars.variables.resource_type

  after := rc.change.after
  after.discovery_spec.enabled == true
  not after.discovery_spec.json_options

  d := {
    "resource_address": rc.address,
    "attribute": "discovery_spec.json_options",
    "why": "Dataplex Asset must configure JSON discovery options"
  }
}

details := [d | d := json_options_missing[_]]

message := ["Dataplex Asset must enable JSON discovery options"] if { count(details) > 0 }
