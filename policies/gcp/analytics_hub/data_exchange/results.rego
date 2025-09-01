package terraform.gcp.security.analytics_hub.data_exchange.naming_standard

import data.terraform.gcp.analytics_hub.data_exchange.naming_standard as ns

# pass/fail summary (future-keywords style)
message := "pass" if {
  count(ns.deny) == 0
}

message := "fail" if {
  count(ns.deny) > 0
}

# surface violations
details := ns.deny
