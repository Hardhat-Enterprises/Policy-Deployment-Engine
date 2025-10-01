# run_all_opa_eval.ps1
$policyRoot = ".\policies\gcp"
$inputRoot  = ".\inputs\gcp"

# Define the list of (service,resource,attribute,rule_path) to evaluate
$tests = @(
  @{s="compute"; r="ssh"; a="open_to_world"; rule="terraform.gcp.security.compute.ssh.open_to_world.deny"},
  @{s="compute"; r="rdp"; a="open_to_world"; rule="terraform.gcp.security.compute.rdp.open_to_world.deny"},
  @{s="compute"; r="telnet"; a="enabled"; rule="terraform.gcp.security.compute.telnet.enabled.deny"},
  @{s="compute"; r="ftp"; a="anonymous_access"; rule="terraform.gcp.security.compute.ftp.anonymous_access.deny"},
  @{s="compute"; r="smtp"; a="open_relay"; rule="terraform.gcp.security.compute.smtp.open_relay.deny"},
  @{s="sql";     r="db"; a="public_exposure"; rule="terraform.gcp.security.sql.db.public_exposure.deny"},
  @{s="dns";     r="managed_zone"; a="recursion_enabled"; rule="terraform.gcp.security.dns.recursion_enabled.deny"},
  @{s="compute"; r="backend_service"; a="redirect_disabled"; rule="terraform.gcp.security.compute.http_to_https.redirect_disabled.deny"},
  @{s="compute"; r="firewall"; a="egress_allowlist"; rule="terraform.gcp.security.compute.firewall.egress_allowlist.deny"},
  @{s="compute"; r="firewall"; a="default_deny"; rule="terraform.gcp.security.compute.firewall.default_deny.deny"}
)

foreach ($t in $tests) {
  $inputPath = Join-Path $inputRoot ($t.s + "\" + $t.r + "\" + $t.a + "\plan.json")
  Write-Host "`n--- Evaluating $($t.rule) against $inputPath ---`n"
  if (Test-Path $inputPath) {
    opa eval --data $policyRoot --input $inputPath $t.rule --format pretty --explain=fails
  } else {
    Write-Host "Input not found: $inputPath"
  }
}
