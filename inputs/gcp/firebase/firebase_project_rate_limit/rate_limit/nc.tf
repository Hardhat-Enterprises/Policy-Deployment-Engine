resource "local_file" "nc" {
  filename = "noncompliant.txt"
  content  = "rate_limit=false"
}

