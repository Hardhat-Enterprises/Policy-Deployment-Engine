resource "google_identity_platform_config" "non_compliant_example_1" {
  project = "fake-project"
  sign_in {
    phone_number {
      enabled = true
      test_phone_numbers = {
        "+61400000000" = "123456"
      }
    }
  }
}
