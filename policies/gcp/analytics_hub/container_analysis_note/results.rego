package terraform.gcp.container_analysis_note

import data.terraform.gcp.container_analysis_note.naming_standard as naming

results = {
  "deny": [msg | msg := naming.deny[_]]
}
