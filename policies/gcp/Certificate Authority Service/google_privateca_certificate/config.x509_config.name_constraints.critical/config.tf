##### DO NOT EDIT ######

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {}
locals {
  certificate_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwiRudjheDltMexXmy7iv2XSH0a8W5/y9X+Q02UuZlDkQRbmZjlTTPLwC6WU1C73JKT/kyMcJAmu0C7ZohqOPsnIuNoR/A9mAhCa3NmuOYK42jnzVCl6ALJCB25dHiCv8P2Mm2aUDqShP/Ua8kkAi8/nC8g5vBV5/d44MyUa+IKwNKW8Q30R3AEYGDn6xNsEielVsAAzYqG2bBz+Dn3xXRq9iIqWwujS2N2lgT8ac1k2uRlNQF8ZvqvAu9xOCfvj3J/yJZrmNUJjtdgRW64dreJqjNkWmKQHRDPdIyQBm1DsRvMGuyMbkGNw50VBDi5aCu6/EXmUH69Gyra1Um1bUpQIDAQAB"
}