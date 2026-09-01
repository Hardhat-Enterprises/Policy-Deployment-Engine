import json

path = "docs/gcp/App Engine/google_app_engine_flexible_app_version.json"
with open(path) as f:
    data = json.load(f)

updates = {
    "beta_settings": (False, "Free-form metadata map for enabling beta runtime features; team-specific content that can't be structurally validated by a generic policy."),
    "default_expiration": (False, "Cache duration for static files. Affects performance/cost, not security."),
    "delete_service_on_destroy": (True, "Matches the prevent-destructive-loss archetype: if true, the entire underlying service (not just this version) can be deleted when the last version is destroyed. A generic policy can require this be false to prevent accidental service-wide deletion."),
    "deletion_policy": (True, "Matches the prevent-destructive-loss archetype directly: a generic policy can require this be set to 'PREVENT' so the resource cannot be accidentally destroyed via terraform apply/destroy."),
    "env_variables": (False, "Team-specific environment variable content; a generic policy cannot meaningfully validate arbitrary key/value pairs without hardcoding team-specific data."),
    "inbound_services": (False, "Selects which inbound message types the app handles (mail, XMPP, etc). A functional feature choice with no inherently insecure value."),
    "instance_class": (False, "Performance/cost sizing choice, not a security lever."),
    "nobuild_files_regex": (False, "Team-specific build exclusion pattern for Go runtimes."),
    "noop_on_destroy": (True, "Matches the prevent-destructive-loss archetype: a generic policy can require this be true so the application version cannot be silently deleted."),
    "project": (False, "Identifies which project owns the resource. A generic platform policy cannot constrain this without hardcoding a specific project ID."),
    "runtime": (False, "Functional runtime language choice."),
    "runtime_api_version": (False, "Functional/team-specific API version choice."),
    "runtime_channel": (False, "Functional runtime channel choice."),
    "runtime_main_executable_path": (False, "Team-specific file path."),
    "service": (False, "Identifier only."),
    "service_account": (True, "Leaving this unset causes the deployed version to fall back to the broad default App Engine Appspot service account. A generic policy can require this be explicitly set (non-empty), favouring an intentionally-scoped identity over the broad default, without needing to hardcode which specific service account to use."),
    "serving_status": (False, "Functional serving state (SERVING/STOPPED); no inherently insecure value."),
    "version_id": (False, "Identifier only."),
    "api_config.auth_fail_action": (False, "Both REDIRECT and UNAUTHORIZED are legitimate, equally valid ways to handle failed authentication depending on the application's needs; not a structural security lever."),
    "api_config.login": (True, "Matches the access-control archetype: a generic policy can require LOGIN_REQUIRED or LOGIN_ADMIN, excluding the permissive LOGIN_OPTIONAL default, to ensure this endpoint isn't left unintentionally open."),
    "api_config.script": (False, "Team-specific file path."),
    "api_config.security_level": (True, "Matches the enforce-secure-protocol archetype: a generic policy can require SECURE_ALWAYS to enforce HTTPS for this endpoint."),
    "api_config.url": (False, "Team-specific endpoint URL."),
    "endpoints_api_service.config_id": (False, "Team-specific version pin for the Endpoints service configuration."),
    "endpoints_api_service.disable_trace_sampling": (False, "Controls observability/tracing sampling, not a security control."),
    "endpoints_api_service.name": (False, "Identifier for the Endpoints service."),
    "endpoints_api_service.rollout_strategy": (False, "FIXED and MANAGED are both legitimate operational rollout choices depending on the team's process; not a clear-cut structural security control either way."),
    "vpc_access_connector.name": (False, "A reference to another resource (the VPC Access Connector). We secure the referenced connector itself, not this pointer to it."),
}

changed = 0
missing = []
for arg_name, (impact, rationale) in updates.items():
    if arg_name in data["arguments"]:
        data["arguments"][arg_name]["security_impact"] = impact
        data["arguments"][arg_name]["rationale"] = rationale
        changed += 1
    else:
        missing.append(arg_name)

with open(path, "w") as f:
    json.dump(data, f, indent=2)

print(f"Updated {changed} arguments.")
if missing:
    print("WARNING - not found in file:", missing)
