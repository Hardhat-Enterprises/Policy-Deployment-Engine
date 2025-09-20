package terraform.gcp.security.dataplex.google_dataplex_lake.metastore

import data.terraform.gcp.security.dataplex.google_dataplex_lake.vars

default details := []
default message := []

missing_metastore[d] if {
  rc := input.resource_changes[_]
  rc.type == vars.variables.resource_type
  after := rc.change.after

  not after.metastore

  d := {
    "resource_address": rc.address,
    "attribute": "metastore",
    "why": "Dataplex Lake must have a metastore configured for metadata governance"
  }
}

details := [d | d := missing_metastore[_]]

message := ["Dataplex Lake is missing a metastore configuration"] if { count(details) > 0 }
