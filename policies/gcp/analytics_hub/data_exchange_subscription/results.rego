package terraform.gcp.security.analytics_hub.data_exchange_subscription

import data.terraform.gcp.analytics_hub.data_exchange_subscription.naming_standard as ns

# message: collect only violation messages
message = [msg | violation := ns.deny[_]; msg := violation.msg]

# details: collect full violation objects
details = [violation | violation := ns.deny[_]]
