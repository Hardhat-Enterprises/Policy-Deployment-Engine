resource "google_compute_router" "compliant_example_1" {
  name    = "compliant-md5-router"
  region  = "australia-southeast2"
  network = "default"

  bgp {
    asn = 64514
  }

  md5_authentication_keys {
    name = "peer-key-1"
    key  = "G7x9Qz2Lm4Rp8Vw1Kd6Nf3Bh0Ty5Jc"
  }
}