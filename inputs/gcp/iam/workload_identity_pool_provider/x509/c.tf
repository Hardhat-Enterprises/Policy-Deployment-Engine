# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_iam_workload_identity_pool_provider" "c" {
  workload_identity_pool_id          = "pid"
  workload_identity_pool_provider_id = "wipp-c"
  project = "pid"
  display_name                       = "Name of provider"
  description                        = "X.509 identity pool provider for automated test"
  disabled                           = true
  attribute_mapping                  = {
    "google.subject"        = "assertion.subject.dn.cn"
  }
  x509 {
    trust_store {
        trust_anchors {
            pem_certificate = "file('test-fixtures/trust_anchor.pem')"
        }
        intermediate_cas {
            pem_certificate = "file('test-fixtures/intermediate_ca.pem')"
        }
    }
  }
}