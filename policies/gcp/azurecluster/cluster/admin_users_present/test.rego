package terraform.gcp.security.azureclient.tenant_id_whitelist.test

import data.terraform.gcp.security.azureclient.tenant_id_whitelist as policy

test_allow := {
    "input": {
        "planned_values": {
            "root_module": {
                "resources": [
                    {
                        "address": "google_container_azure_client.pass",
                        "type": "google_container_azure_client",
                        "values": {
                            "tenant_id": "11111111-1111-1111-1111-111111111111"
                        }
                    }
                ]
            }
        }
    }
}

test_deny := {
    "input": {
        "planned_values": {
            "root_module": {
                "resources": [
                    {
                        "address": "google_container_azure_client.fail",
                        "type": "google_container_azure_client",
                        "values": {
                            "tenant_id": "99999999-9999-9999-9999-999999999999"
                        }
                    }
                ]
            }
        }
    }
}

test_pass {
    result := policy.deny with input as test_allow.input
    count(result) == 0
}

test_fail {
    result := policy.deny with input as test_deny.input
    count(result) > 0
}