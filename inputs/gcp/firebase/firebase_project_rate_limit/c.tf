

resource "local_file" "c" {
  filename = "compliant.txt"
  content  = "rate_limit=true"
}

