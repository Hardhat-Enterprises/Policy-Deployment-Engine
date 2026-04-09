resource "google_service_account" "nc" {
  account_id   = "administration"                    # ❌ risky term (blacklist)
  display_name = "Ops Agent"
  description  = "Ops automation agent"
  project      = "not-secure-project"
  disabled     = false
}
