package terraform.gcp.blockchain.data_exchange.iam

import data.terraform.gcp.blockchain.data_exchange.iam.policy as policy

message := "pass" if {
  count(policy.deny) == 0
}

message := "fail" if {
  count(policy.deny) > 0
}

details := policy.deny
