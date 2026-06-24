"""
Authoritative argument source: the Terraform/OpenTofu provider schema.

This module obtains the machine-readable provider schema via
``<binary> providers schema -json`` after a one-time ``init`` that downloads the
provider plugin. Unlike the markdown docs, the schema gives the exact ``type``,
``required``/``optional``/``computed`` flags, and the full recursive block nesting for
every resource — which is what docs needs.

Either ``terraform`` or ``tofu`` (OpenTofu) works; OpenTofu is a drop-in replacement.
The resolved provider version is read back from ``<binary> version -json`` so the JSON
records exactly which provider version produced it (and so the markdown clone can be
pinned to the matching tag).

Schemas are cached under ``scripts/docgen/.cache/schema_{csp}_{version}.json`` so
repeated runs (e.g. refresh) don't re-shell-out to Terraform.
"""

import json
import os
import shutil
import subprocess
from pathlib import Path
from typing import Dict, Optional, Tuple

from scripts.docgen.lib.errors import ConfigurationError, ConnectionError
from scripts.docgen.lib.logging_config import get_logger

logger = get_logger(__name__)

# Provider source addresses (registry-agnostic; matched by suffix when reading schema).
PROVIDER_SOURCES = {
    "gcp": "hashicorp/google",
    "aws": "hashicorp/aws",
    "azure": "hashicorp/azurerm",
}

DEFAULT_CACHE_DIR = Path(__file__).parent.parent / ".cache"
DEFAULT_PLUGIN_CACHE = Path.home() / ".terraform.d" / "plugin-cache"


def find_terraform_binary() -> str:
    """Return the path to a usable terraform/tofu binary, preferring terraform."""
    for candidate in ("terraform", "tofu"):
        path = shutil.which(candidate)
        if path:
            logger.debug(f"Using Terraform binary: {path}")
            return path
    raise ConfigurationError(
        "Neither 'terraform' nor 'tofu' found on PATH. Install one to fetch the "
        "provider schema.",
        operation="locate terraform binary",
    )


class SchemaSource:
    """Fetches and caches provider resource schemas via terraform/tofu."""

    def __init__(
        self,
        cache_dir: Optional[Path] = None,
        plugin_cache_dir: Optional[Path] = None,
        binary: Optional[str] = None,
    ):
        self.cache_dir = cache_dir or DEFAULT_CACHE_DIR
        self.plugin_cache_dir = plugin_cache_dir or DEFAULT_PLUGIN_CACHE
        self.binary = binary or find_terraform_binary()

    def get_resource_schemas(
        self, csp: str, version: Optional[str] = None
    ) -> Tuple[Dict, str]:
        """Return ``(resource_schemas, resolved_version)`` for a provider.

        Args:
            csp: 'gcp' (aws/azure supported by source map but not exercised yet).
            version: Exact provider version to pin (e.g. '7.37.0'); None = latest.

        Returns:
            A tuple of the ``resource_schemas`` dict (keyed by full resource name,
            e.g. 'google_storage_bucket') and the resolved version string.
        """
        if csp not in PROVIDER_SOURCES:
            raise ConfigurationError(
                f"Unsupported CSP: {csp}. Supported: {', '.join(PROVIDER_SOURCES)}",
                operation="schema source lookup",
            )

        # Fast path: pinned version already cached on disk.
        if version:
            cached = self._read_cache(csp, _normalize_version(version))
            if cached is not None:
                logger.info(f"Schema cache hit: {csp} v{_normalize_version(version)}")
                return cached, _normalize_version(version)

        schema = self._dump_schema(csp, version)
        resolved = self._resolve_version(csp)
        resource_schemas = self._extract_resource_schemas(schema, csp)
        self._write_cache(csp, resolved, resource_schemas)
        logger.info(
            f"Fetched schema for {csp} v{resolved}: {len(resource_schemas)} resources"
        )
        return resource_schemas, resolved

    # -- internal helpers -------------------------------------------------

    def _work_dir(self, csp: str) -> Path:
        work = self.cache_dir / "_tf_work" / csp
        work.mkdir(parents=True, exist_ok=True)
        return work

    def _env(self) -> dict:
        self.plugin_cache_dir.mkdir(parents=True, exist_ok=True)
        env = os.environ.copy()
        env["TF_PLUGIN_CACHE_DIR"] = str(self.plugin_cache_dir)
        env["TF_IN_AUTOMATION"] = "1"
        return env

    def _write_versions_tf(self, csp: str, version: Optional[str]) -> Path:
        source = PROVIDER_SOURCES[csp]
        version_line = (
            f'      version = "{_normalize_version(version)}"\n' if version else ""
        )
        content = (
            "terraform {\n"
            "  required_providers {\n"
            "    provider = {\n"
            f'      source  = "{source}"\n'
            f"{version_line}"
            "    }\n"
            "  }\n"
            "}\n"
        )
        # Use a stable local name 'provider' to avoid clashing with provider config.
        work = self._work_dir(csp)
        path = work / "versions.tf"
        path.write_text(content, encoding="utf-8")
        return path

    def _run(self, args, csp: str, capture: bool = False) -> subprocess.CompletedProcess:
        try:
            return subprocess.run(
                [self.binary, *args],
                cwd=str(self._work_dir(csp)),
                env=self._env(),
                capture_output=True,
                text=True,
                check=True,
            )
        except subprocess.CalledProcessError as e:
            raise ConnectionError(
                f"`{self.binary} {' '.join(args)}` failed: {e.stderr.strip()}",
                operation="terraform schema",
            ) from e

    def _dump_schema(self, csp: str, version: Optional[str]) -> dict:
        self._write_versions_tf(csp, version)
        logger.info(
            f"Initializing provider {PROVIDER_SOURCES[csp]} "
            f"({version or 'latest'})… first run downloads the plugin."
        )
        self._run(["init", "-no-color", "-upgrade"], csp)
        result = self._run(["providers", "schema", "-json"], csp, capture=True)
        return json.loads(result.stdout)

    def _resolve_version(self, csp: str) -> str:
        result = self._run(["version", "-json"], csp, capture=True)
        data = json.loads(result.stdout)
        selections = data.get("provider_selections", {})
        suffix = PROVIDER_SOURCES[csp]
        for addr, ver in selections.items():
            if addr.endswith(suffix):
                return ver
        return "unknown"

    def _extract_resource_schemas(self, schema: dict, csp: str) -> Dict:
        suffix = PROVIDER_SOURCES[csp]
        provider_schemas = schema.get("provider_schemas", {})
        for addr, body in provider_schemas.items():
            if addr.endswith(suffix):
                return body.get("resource_schemas", {})
        raise ConnectionError(
            f"Provider '{suffix}' not present in schema output",
            operation="parse schema",
        )

    def _cache_path(self, csp: str, version: str) -> Path:
        return self.cache_dir / f"schema_{csp}_{version}.json"

    def _read_cache(self, csp: str, version: str) -> Optional[Dict]:
        path = self._cache_path(csp, version)
        if path.exists():
            try:
                return json.loads(path.read_text(encoding="utf-8"))
            except Exception as e:  # noqa: BLE001 - corrupt cache is non-fatal
                logger.warning(f"Ignoring unreadable schema cache {path}: {e}")
        return None

    def _write_cache(self, csp: str, version: str, resource_schemas: Dict) -> None:
        self.cache_dir.mkdir(parents=True, exist_ok=True)
        path = self._cache_path(csp, version)
        try:
            path.write_text(json.dumps(resource_schemas), encoding="utf-8")
        except Exception as e:  # noqa: BLE001 - caching is best-effort
            logger.warning(f"Could not write schema cache {path}: {e}")


def _normalize_version(version: Optional[str]) -> str:
    """Strip a leading 'v' so '7.37.0' and 'v7.37.0' are equivalent."""
    if not version:
        return ""
    return version[1:] if version.startswith("v") else version
