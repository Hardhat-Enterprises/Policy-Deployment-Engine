#!/usr/bin/env python3
"""
policy_lint — deterministic quality rules for the *content* of a policy kit.

``linter.py`` checks that the ``docs/``, ``inputs/`` and ``policies/`` trees
reconcile with each other (does every documented argument have a policy, a
fixture pair and the right file names). It says nothing about whether the policy
those files contain is any good. This linter reads the declarations themselves —
the ``conditions`` list of every ``<argument>.rego``, the ``variables`` of every
``_vars.rego``, and the committed Terraform plan behind every fixture pair — and
reports the smells a marker would otherwise have to find by hand.

Every rule is deterministic and carries a stable id (see ``RULES``), so a finding
can be cited, suppressed by fixing it, and counted over time. Nothing here writes
to ``docs/``, ``policies/`` or ``inputs/``.

How a policy is read
--------------------
A policy file is a *data declaration*, not logic::

    package terraform.<platform>.security.<service>.<resource_type>.<argument>

    conditions := [
      [ {"situation_description": ..., "remedies": [...]},        # what the human is told
        {"condition": ..., "attribute_path": [...],               # what is actually checked
         "values": [...], "policy_type": "whitelist"} ],
      ...
    ]

so the conditions are read by evaluating them with ``opa eval`` rather than by
parsing Rego text — the evaluated value is what the pipeline actually uses.
``_vars.rego`` (``package ....<resource_type>.vars``) holds the shared
``friendly_resource_name`` / ``resource_type`` / ``resource_value_name``.

Usage
-----
    python3 scripts/linters/policy_lint.py "gcp/Cloud Storage/google_storage_bucket"
    python3 scripts/linters/policy_lint.py "gcp/Cloud Storage"      # whole service
    python3 scripts/linters/policy_lint.py gcp                      # whole platform
    python3 scripts/linters/policy_lint.py --json "gcp/BigQuery/google_bigquery_table"
    python3 scripts/linters/policy_lint.py --list-rules

Exit codes: 0 clean, 1 at least one *error*-severity finding (warnings never fail
a build on their own), 2 a usage error — a target naming a platform, service or
resource type that is not in the tree.
"""

import argparse
import json
import re
import subprocess
import sys
from dataclasses import dataclass, asdict
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[2]))

# fixture_sha / plan_cache_path are the pipeline's own definition of "which
# cached plan belongs to this fixture". Importing keeps the two in lockstep: a
# provider bump changes the sha in both places at once.
from scripts.auto_test.auto_test import plan_cache_path  # noqa: E402

REPO_ROOT = Path(__file__).resolve().parents[2]
HELPERS_DIR = REPO_ROOT / "policies" / "_helpers"

VARS_FILE = "_vars.rego"
REGO_EXT = ".rego"

RULES = {
    "hard-coded-value": (
        "A value in `values` is a team-specific literal (project id, email, "
        "bucket/key/folder/org id). Use a projects/* pattern or a structural check. "
        "Locations are exempt."),
    "index-path": (
        "`attribute_path` ends in a list index; check the whole list with "
        "`element blacklist`."),
    "presence-only": (
        "`values` is only null/\"\": presence is the whole check. Pair with a pattern "
        "or justify presence in the rationale."),
    "wrong-argument": (
        "No condition in `<arg>.rego` reads the argument the file is named after."),
    "fixture-drift": (
        "compliant.tf and nonCompliant.tf differ on attributes other than the "
        "argument under test."),
    "fixture-missing-plan": (
        "No committed plan cache for this fixture pair — run the test locally and "
        "commit inputs/plan_cache."),
    "vars-resource-type": (
        "`_vars.resource_type` does not match the resource-type directory."),
    "vars-friendly-name": (
        "`_vars.friendly_resource_name` is empty, equals the raw Terraform type, or "
        "is reused by another resource type."),
    "trivial-message": (
        "`situation_description` under 20 characters or `remedies` empty."),
    "legacy-assign": "Use `:=` for message/details/summary (warn).",
    "package-case": "Package service segment is not lowercase snake_case (warn).",
    "lint-error": (
        "The linter could not evaluate this policy (parse/opa failure) — run "
        "`opa check` on the file."),
}

# Only style rules are advisory; everything else is a correctness/quality error.
WARN_RULES = {"legacy-assign", "package-case"}

# --------------------------------------------------------------------------- #
# Rule constants
# --------------------------------------------------------------------------- #

# A literal project segment: "projects/PDE", "projects/my-proj/locations/x".
# "projects/*" and "projects/*/locations/*" are the *recommended* form and must
# never be flagged, so the segment right after "projects/" may not start with `*`.
PROJECT_LITERAL_RE = re.compile(r"^projects/[^*][^/]*(?:/|$)")
EMAIL_RE = re.compile(r"[A-Za-z0-9._%+\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9.\-]*[A-Za-z]{2,}")
STORAGE_URI_RE = re.compile(r"^(?:gs|s3)://")
ORG_FOLDER_RE = re.compile(r"^(?:organizations|folders)/\d+")

HARD_CODED_PATTERNS = (
    ("project id", PROJECT_LITERAL_RE),
    ("email address", EMAIL_RE),
    ("bucket URI", STORAGE_URI_RE),
    ("organization/folder id", ORG_FOLDER_RE),
)

# Region/zone names are a separate (much larger) cleanup item; an argument that
# *is* a location is expected to name one, so it is exempt from hard-coded-value.
LOCATION_SEGMENTS = {
    "location", "locations", "region", "regions", "zone", "zones",
    "replica_zones", "included_locations",
}

MIN_SITUATION_DESCRIPTION = 20
LEGACY_ASSIGN_RE = re.compile(r"^\s*(message|details|summary)\s*=\s")
PACKAGE_RE = re.compile(r"^\s*package\s+([A-Za-z_][\w.]*)", re.MULTILINE)
SNAKE_CASE_RE = re.compile(r"^[a-z][a-z0-9_]*$")

# Fixture resource labels, per the auto_test convention.
FIXTURE_LABEL_RE = re.compile(r"^(compliant|non_compliant)_example_(\d+)$")
# Keys that are *expected* to differ between the two fixture resources: the
# resource's label ("name") and `labels`, plus the two provider-computed mirrors
# of `labels`, which always move with it and would double-report every labels
# policy. The resource's `resource_value_name` is handled separately — see
# `_lint_fixtures` — because it is only exempt when it holds the fixture label.
FIXTURE_IGNORED_KEYS = {
    "name", "labels", "label", "effective_labels", "terraform_labels",
}

# Blacklist/whitelist only — a pattern or range policy with empty values means
# something else entirely.
PRESENCE_POLICY_TYPES = {"blacklist", "whitelist"}
EMPTY_VALUES = (None, "", [], {})


class PolicyLintError(RuntimeError):
    """One policy file could not be read (OPA refused to evaluate it).

    Reported as a ``lint-error`` finding against that file — never fatal, so one
    unparseable policy cannot hide every other finding in the run.
    """


class TargetError(ValueError):
    """A CLI target names a platform/service/resource that does not exist."""


@dataclass(frozen=True)
class Finding:
    service: str
    resource: str
    policy: str          # argument path (the .rego file stem) or "_vars"
    rule: str
    message: str
    severity: str = "error"


# --------------------------------------------------------------------------- #
# OPA plumbing
# --------------------------------------------------------------------------- #
_eval_cache: dict[tuple, dict] = {}


def _opa_reason(proc):
    """A one-line reason from a failed ``opa eval``.

    Parse errors are written to *stdout* as a JSON ``errors`` array, not to
    stderr, so reading stderr alone loses the reason entirely.
    """
    stderr = (proc.stderr or "").strip()
    if stderr:
        return stderr.splitlines()[0]
    stdout = (proc.stdout or "").strip()
    try:
        errors = json.loads(stdout).get("errors") or []
    except (json.JSONDecodeError, AttributeError):
        errors = []
    if errors:
        first = errors[0]
        location = first.get("location") or {}
        where = (f" ({Path(location['file']).name}:{location.get('row')})"
                 if location.get("file") else "")
        return f"{first.get('code', 'error')}: {first.get('message', '')}{where}"
    return stdout.splitlines()[0] if stdout else "no output"


def _run_opa(query, *data_dirs):
    """``opa eval --format json`` over ``data_dirs``; returns the query value."""
    cmd = ["opa", "eval", "--format", "json"]
    for d in data_dirs:
        cmd += ["-d", str(d)]
    cmd.append(query)
    try:
        proc = subprocess.run(cmd, capture_output=True, text=True)
    except FileNotFoundError as exc:                     # pragma: no cover - env
        raise PolicyLintError("`opa` is not on PATH — install it to run policy_lint.") from exc
    if proc.returncode != 0:
        raise PolicyLintError(f"opa eval {query!r} failed: {_opa_reason(proc)}")
    result = json.loads(proc.stdout or "{}").get("result") or []
    if not result:
        return None                                       # undefined, not an error
    return result[0]["expressions"][0]["value"]


def _eval_dir(directory, helpers_dir):
    """Whole-``data.terraform`` value for one policy directory, cached.

    One OPA invocation per resource-type directory covers every policy file in
    it; a per-file query is only used if this batch evaluation fails.
    """
    key = (str(Path(directory).resolve()), str(Path(helpers_dir).resolve()))
    if key not in _eval_cache:
        try:
            _eval_cache[key] = _run_opa("data.terraform", helpers_dir, directory) or {}
        except PolicyLintError:
            _eval_cache[key] = None                       # force the per-file path
    return _eval_cache[key]


def _package_of(rego_path):
    """The package name declared by a .rego file."""
    match = PACKAGE_RE.search(Path(rego_path).read_text(encoding="utf-8"))
    if not match:
        raise PolicyLintError(f"{rego_path}: no `package` declaration")
    return match.group(1)


def _walk(tree, segments):
    for segment in segments:
        if not isinstance(tree, dict) or segment not in tree:
            return None
        tree = tree[segment]
    return tree


def _rule_value(rego_path, helpers_dir, rule_name):
    """Value of ``data.<package>.<rule_name>`` for one .rego file."""
    package = _package_of(rego_path)
    tree = _eval_dir(Path(rego_path).parent, helpers_dir)
    if tree is not None:
        node = _walk(tree, package.split(".")[1:] + [rule_name])
        if node is not None:
            return node
    # Batch evaluation failed or the rule is undefined in it — ask again with just
    # this one file, so a genuine OPA error surfaces (rather than becoming a silent
    # empty list) and an unparseable *sibling* cannot poison a healthy policy.
    return _run_opa(f"data.{package}.{rule_name}", helpers_dir, Path(rego_path))


def load_conditions(rego_path, policies_root, helpers_dir=None):
    """The evaluated ``conditions`` of a policy file: a list of condition groups.

    Each group is ``[meta, check, ...]`` — ``meta`` carries
    ``situation_description``/``remedies``, each ``check`` carries
    ``condition``/``attribute_path``/``values``/``policy_type``.
    """
    helpers_dir = _resolve_helpers(policies_root, helpers_dir)
    value = _rule_value(rego_path, helpers_dir, "conditions")
    if not isinstance(value, list):
        raise PolicyLintError(
            "declares no `conditions` list (the rule is undefined or not an array)")
    return value


def load_variables(vars_path, policies_root, helpers_dir=None):
    """The evaluated ``variables`` object of a ``_vars.rego`` file."""
    helpers_dir = _resolve_helpers(policies_root, helpers_dir)
    value = _rule_value(vars_path, helpers_dir, "variables")
    if not isinstance(value, dict):
        raise PolicyLintError(
            "declares no `variables` object (the rule is undefined or not an object)")
    return value


def _resolve_helpers(policies_root, helpers_dir=None):
    """Helpers live in the tree under lint when it has them, else in the repo.

    Test fixture trees are miniature repos that deliberately do not carry a copy
    of ``policies/_helpers`` — they borrow the real one.
    """
    if helpers_dir is not None:
        return Path(helpers_dir)
    local = Path(policies_root) / "_helpers"
    return local if local.is_dir() else HELPERS_DIR


# --------------------------------------------------------------------------- #
# Plan cache
# --------------------------------------------------------------------------- #
def plan_cache_for(root, input_dir):
    """``<root>/inputs/plan_cache/<platform>/<sha>.json`` for a fixture dir.

    The sha and platform come from ``auto_test.plan_cache_path`` (the pipeline's
    own definition); only the *root* is rebased, so a fixture tree under
    ``_tests/`` resolves inside itself. For the real repo this is the identity.
    """
    canonical = plan_cache_path(Path(input_dir))
    return Path(root) / "inputs" / "plan_cache" / canonical.parent.name / canonical.name


# --------------------------------------------------------------------------- #
# Condition helpers
# --------------------------------------------------------------------------- #
def _split_group(group):
    """A condition group into (meta dicts, check dicts)."""
    metas, checks = [], []
    for entry in group if isinstance(group, list) else []:
        if not isinstance(entry, dict):
            continue
        if "attribute_path" in entry:
            checks.append(entry)
        elif "situation_description" in entry or "remedies" in entry:
            metas.append(entry)
    return metas, checks


def _strings_in(value):
    """Every string anywhere inside ``values`` (pattern group lists included)."""
    if isinstance(value, str):
        yield value
    elif isinstance(value, list):
        for item in value:
            yield from _strings_in(item)
    elif isinstance(value, dict):
        for item in value.values():
            yield from _strings_in(item)


def _normalise_path(attribute_path):
    """An ``attribute_path`` as a list, whatever form the policy declared it in.

    ``policies/_helpers/shared.rego`` accepts both an array (``["labels", 0]``)
    and a bare string (``"disabled"`` — see
    ``format_attribute_path``/``get_attribute_value``'s ``is_string`` branches).
    Left as a string, every rule here would iterate it *character by character*,
    which made `google_service_account/disabled` a false `wrong-argument`. Dots
    are the same nesting separator the policy file names use.
    """
    if isinstance(attribute_path, str):
        return [segment for segment in attribute_path.split(".") if segment]
    if isinstance(attribute_path, list):
        return attribute_path
    return []


def _path_segments(attribute_path):
    """String segments of an attribute_path, list indices dropped."""
    return [p for p in _normalise_path(attribute_path) if isinstance(p, str)]


def _is_index(segment):
    return isinstance(segment, int) and not isinstance(segment, bool)


def _is_location_argument(stem, attribute_path):
    """True when this argument names a location — exempt from hard-coded-value."""
    candidates = [stem.split(".")[-1]]
    segments = _path_segments(attribute_path)
    if segments:
        candidates.append(segments[-1])
    if any(c in LOCATION_SEGMENTS for c in candidates):
        return True
    return any(stem.endswith("_" + seg) or stem.endswith("." + seg)
               for seg in LOCATION_SEGMENTS)


# --------------------------------------------------------------------------- #
# Rules over one policy file
# --------------------------------------------------------------------------- #
def _lint_policy_file(root, platform, service, resource_type, rego_path, policies_root,
                      identity_key=None):
    stem = rego_path.stem
    text = rego_path.read_text(encoding="utf-8")
    out = []

    def add(rule, message):
        out.append(Finding(service, resource_type, stem, rule, message,
                           "warn" if rule in WARN_RULES else "error"))

    # --- package-case (warn) ---------------------------------------------- #
    package = _package_of(rego_path)
    segments = package.split(".")
    if len(segments) >= 4 and not SNAKE_CASE_RE.match(segments[3]):
        add("package-case",
            f"package service segment '{segments[3]}' is not lowercase snake_case")

    # --- legacy-assign (warn) --------------------------------------------- #
    legacy = sorted({LEGACY_ASSIGN_RE.match(line).group(1)
                     for line in text.splitlines() if LEGACY_ASSIGN_RE.match(line)})
    if legacy:
        add("legacy-assign", f"{', '.join(legacy)} assigned with '=' instead of ':='")

    try:
        conditions = load_conditions(rego_path, policies_root)
    except PolicyLintError as exc:
        # A kit that cannot be evaluated is itself a finding. The style rules
        # above already ran, and the fixture rules below still can, so one bad
        # file never silences the rest of the run.
        add("lint-error", str(exc))
        return out + _lint_fixtures(root, platform, service, resource_type, stem,
                                    identity_key)

    seen = set()

    def add_once(rule, key, message):
        if (rule, key) not in seen:
            seen.add((rule, key))
            add(rule, message)

    joined_paths = []
    for group in conditions:
        metas, checks = _split_group(group)

        # --- trivial-message ---------------------------------------------- #
        for meta in metas:
            description = meta.get("situation_description")
            too_short = (not isinstance(description, str)
                         or len(description.strip()) < MIN_SITUATION_DESCRIPTION)
            if too_short:
                add_once("trivial-message", ("desc", str(description)),
                         f"situation_description {str(description)!r} is under "
                         f"{MIN_SITUATION_DESCRIPTION} characters")
            if not meta.get("remedies"):
                add_once("trivial-message", ("rem", str(description)),
                         f"remedies is empty for {str(description)!r}")

        for check in checks:
            attribute_path = _normalise_path(check.get("attribute_path"))
            values = check.get("values")
            policy_type = (check.get("policy_type") or "").strip().lower()
            path_text = ".".join(str(p) for p in attribute_path)
            joined_paths.append(".".join(_path_segments(attribute_path)))

            # --- index-path ------------------------------------------------ #
            if attribute_path and _is_index(attribute_path[-1]):
                add_once("index-path", path_text,
                         f"attribute_path {attribute_path} ends in a list index; use "
                         "'element blacklist' to check the whole list")

            # --- presence-only --------------------------------------------- #
            if (isinstance(values, list) and values
                    and policy_type in PRESENCE_POLICY_TYPES
                    and all(v in EMPTY_VALUES for v in values)):
                add_once("presence-only", path_text,
                         f"'{path_text}' only checks presence ({values!r}) under a "
                         f"{policy_type} — pair it with a pattern or justify it")

            # --- hard-coded-value ------------------------------------------ #
            if not _is_location_argument(stem, attribute_path):
                for literal in _strings_in(values):
                    for label, pattern in HARD_CODED_PATTERNS:
                        if pattern.search(literal):
                            add_once("hard-coded-value", literal,
                                     f"'{path_text}' pins the team-specific {label} "
                                     f"{literal!r}")
                            break

    # --- wrong-argument ---------------------------------------------------- #
    if conditions and not any(p == stem or p.startswith(stem + ".") for p in joined_paths):
        add("wrong-argument",
            f"no condition reads '{stem}' (attribute paths: "
            f"{', '.join(sorted(set(p for p in joined_paths if p))) or 'none'})")

    out.extend(_lint_fixtures(root, platform, service, resource_type, stem, identity_key))
    return out


# --------------------------------------------------------------------------- #
# Rules over the fixture pair
# --------------------------------------------------------------------------- #
def _is_fixture_label(value):
    """True when a planned value is just the fixture's own label."""
    return isinstance(value, str) and bool(FIXTURE_LABEL_RE.match(value))


def _lint_fixtures(root, platform, service, resource_type, stem, identity_key=None):
    input_dir = Path(root) / "inputs" / platform / service / resource_type / stem
    # A missing input directory is linter.py's finding (an orphan policy), not
    # ours — we only speak about fixtures that exist.
    if not input_dir.is_dir() or not any(input_dir.glob("*.tf")):
        return []

    cache = plan_cache_for(root, input_dir)
    if not cache.exists():
        return [Finding(service, resource_type, stem, "fixture-missing-plan",
                        f"no committed plan cache at inputs/plan_cache/{platform}/"
                        f"{cache.name} — run auto_test locally and commit it")]

    try:
        plan = json.loads(cache.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        return [Finding(service, resource_type, stem, "fixture-missing-plan",
                        f"plan cache {cache.name} is unreadable: {exc}")]

    resources = (plan.get("planned_values", {}).get("root_module", {}).get("resources") or [])
    compliant, non_compliant = {}, {}
    for resource in resources:
        if resource.get("type") != resource_type:
            continue
        match = FIXTURE_LABEL_RE.match(resource.get("name", ""))
        if not match:
            continue
        bucket = compliant if match.group(1) == "compliant" else non_compliant
        bucket[match.group(2)] = resource.get("values") or {}

    # Only the argument's *top-level* key is expected to differ; a nested
    # argument (a.b.c) is compared at its block key, since the plan nests it.
    argument_key = stem.split(".")[0]
    ignored = FIXTURE_IGNORED_KEYS | {argument_key}

    drifted = set()
    for index in sorted(set(compliant) & set(non_compliant)):
        good, bad = compliant[index], non_compliant[index]
        for key in set(good) | set(bad):
            if key in ignored:
                continue
            good_value, bad_value = good.get(key), bad.get(key)
            if good_value == bad_value:
                continue
            # The identity attribute (`bucket` on an IAM binding, `name`
            # elsewhere) is exempt ONLY when it *is* the fixture label — two
            # genuinely different bucket names are drift like any other.
            if (key == identity_key
                    and _is_fixture_label(good_value) and _is_fixture_label(bad_value)):
                continue
            drifted.add(key)

    if drifted:
        return [Finding(service, resource_type, stem, "fixture-drift",
                        "compliant.tf and nonCompliant.tf also differ on: "
                        + ", ".join(sorted(drifted)))]
    return []


# --------------------------------------------------------------------------- #
# Rules over _vars.rego
# --------------------------------------------------------------------------- #
_friendly_index_cache: dict[tuple, dict] = {}


def _friendly_name_index(policies_root, platform):
    """{normalised friendly name: [(service, resource_type), ...]} for a platform.

    Duplicate detection is only meaningful across the whole tree, so this reads
    *every* ``_vars.rego`` under ``policies/<platform>/``. It does that in ONE
    ``opa eval`` over the platform (~0.6s); asking per file cost 370 subprocesses
    and ~9s for a single-resource lint. Package names are read from the files
    themselves (a plain regex, no subprocess) so each result maps back to its
    real service folder and resource-type directory.
    """
    policies_root = Path(policies_root)
    key = (str(policies_root.resolve()), platform)
    if key in _friendly_index_cache:
        return _friendly_index_cache[key]

    platform_root = policies_root / platform
    vars_paths = sorted(platform_root.glob(f"*/*/{VARS_FILE}"))
    helpers_dir = _resolve_helpers(policies_root)
    try:
        tree = _run_opa("data.terraform", helpers_dir, platform_root) or {}
    except PolicyLintError:
        tree = None      # one bad file in the tree — fall back to per-file reads

    index = {}
    for vars_path in vars_paths:
        try:
            package = _package_of(vars_path)
            variables = None
            if tree is not None:
                variables = _walk(tree, package.split(".")[1:] + ["variables"])
            if not isinstance(variables, dict):
                variables = load_variables(vars_path, policies_root)
        except (PolicyLintError, OSError):
            continue
        friendly = variables.get("friendly_resource_name")
        friendly = friendly.strip().lower() if isinstance(friendly, str) else ""
        if friendly:
            index.setdefault(friendly, []).append(
                (vars_path.parent.parent.name, vars_path.parent.name))
    _friendly_index_cache[key] = index
    return index


def clear_caches():
    """Drop every cached OPA evaluation (the caches are process-global)."""
    _eval_cache.clear()
    _friendly_index_cache.clear()


def _lint_vars_file(platform, service, resource_type, vars_path, policies_root):
    out = []

    def add(rule, message):
        out.append(Finding(service, resource_type, "_vars", rule, message,
                           "warn" if rule in WARN_RULES else "error"))

    variables = load_variables(vars_path, policies_root)

    declared_type = variables.get("resource_type")
    if declared_type != resource_type:
        add("vars-resource-type",
            f"resource_type is {declared_type!r} but the directory is "
            f"'{resource_type}' — the policy will never match a planned resource")

    friendly = variables.get("friendly_resource_name")
    friendly_text = friendly.strip() if isinstance(friendly, str) else ""
    if not friendly_text:
        add("vars-friendly-name", "friendly_resource_name is empty")
    elif friendly_text == resource_type or friendly_text == declared_type:
        add("vars-friendly-name",
            f"friendly_resource_name {friendly_text!r} is the raw Terraform type — "
            "use the name a human would say")
    else:
        others = [rt for svc, rt in
                  _friendly_name_index(policies_root, platform).get(friendly_text.lower(), [])
                  if rt != resource_type]
        if others:
            add("vars-friendly-name",
                f"friendly_resource_name {friendly_text!r} is also used by "
                + ", ".join(sorted(others)))
    return out


# --------------------------------------------------------------------------- #
# Entry points
# --------------------------------------------------------------------------- #
def lint_resource(root, platform, service_folder, resource_type):
    """Every finding for one ``policies/<platform>/<service>/<resource_type>/``."""
    root = Path(root)
    policies_root = root / "policies"
    resource_dir = policies_root / platform / service_folder / resource_type
    if not resource_dir.is_dir():
        return []

    findings = []
    identity_key = None
    vars_path = resource_dir / VARS_FILE
    if vars_path.is_file():
        # _vars.rego is optional; when it exists but cannot be read, say so and
        # keep going — the argument policies are still worth linting.
        try:
            findings += _lint_vars_file(platform, service_folder, resource_type,
                                        vars_path, policies_root)
            identity_key = load_variables(
                vars_path, policies_root).get("resource_value_name")
        except (PolicyLintError, OSError, UnicodeDecodeError) as exc:
            findings.append(Finding(service_folder, resource_type, "_vars",
                                    "lint-error", str(exc)))

    for rego_path in sorted(resource_dir.glob(f"*{REGO_EXT}")):
        if rego_path.name == VARS_FILE:
            continue
        try:
            findings += _lint_policy_file(root, platform, service_folder, resource_type,
                                          rego_path, policies_root, identity_key)
        except (PolicyLintError, OSError, UnicodeDecodeError) as exc:
            findings.append(Finding(service_folder, resource_type, rego_path.stem,
                                    "lint-error", str(exc)))
    return findings


def _expand_target(root, target):
    """A ``platform[/service[/resource]]`` target into (platform, service, resource).

    Every segment is checked against the tree. A mistyped target must be a *usage*
    error — silently linting nothing and exiting 0 is the worst possible answer to
    a typo.
    """
    parts = [p for p in target.split("/") if p]
    if not parts or len(parts) > 3:
        raise TargetError(
            f"target {target!r} must be '<platform>', '<platform>/<Service folder>' or "
            "'<platform>/<Service folder>/<resource_type>'")

    platform = parts[0]
    platform_root = Path(root) / "policies" / platform
    if not platform_root.is_dir():
        available = sorted(d.name for d in (Path(root) / "policies").glob("*")
                           if d.is_dir() and not d.name.startswith("_"))
        raise TargetError(
            f"no policies for platform '{platform}' "
            f"(available: {', '.join(available) or 'none'})")

    services = [parts[1]] if len(parts) >= 2 else [
        d.name for d in sorted(platform_root.iterdir()) if d.is_dir()]

    out = []
    for service in services:
        service_dir = platform_root / service
        if not service_dir.is_dir():
            raise TargetError(f"no policies directory for '{platform}/{service}'")
        resources = [d.name for d in sorted(service_dir.iterdir()) if d.is_dir()]
        if len(parts) == 3:
            if parts[2] not in resources:
                raise TargetError(
                    f"no resource type '{parts[2]}' in '{platform}/{service}' "
                    f"({len(resources)} available)")
            resources = [parts[2]]
        out += [(platform, service, resource) for resource in resources]
    return out


def _print_rules():
    width = max(len(r) for r in RULES)
    for rule_id, description in RULES.items():
        print(f"{rule_id.ljust(width)}  {description}")


def main(argv=None):
    parser = argparse.ArgumentParser(
        description="Lint the content of a policy kit (conditions, _vars, fixtures).",
        formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("targets", nargs="*", metavar="TARGET",
                        help="'<platform>', '<platform>/<Service folder>' or "
                             "'<platform>/<Service folder>/<resource_type>'")
    parser.add_argument("--root", default=str(REPO_ROOT),
                        help="repo root holding docs/, policies/ and inputs/ "
                             "(default: this checkout)")
    parser.add_argument("--json", action="store_true", dest="as_json",
                        help="print the findings as a JSON array")
    parser.add_argument("--list-rules", action="store_true",
                        help="print every rule id and its description, then exit")
    args = parser.parse_args(argv)

    if args.list_rules:
        _print_rules()
        return 0
    if not args.targets:
        parser.error("at least one TARGET is required (or use --list-rules)")

    root = Path(args.root)
    findings, usage_error = [], False
    for target in args.targets:
        try:
            for platform, service, resource_type in _expand_target(root, target):
                findings += lint_resource(root, platform, service, resource_type)
        except TargetError as exc:
            print(f"[ERROR] {target}: {exc}", file=sys.stderr)
            usage_error = True

    findings.sort(key=lambda f: (f.service, f.resource, f.policy, f.rule, f.message))

    if args.as_json:
        print(json.dumps([asdict(f) for f in findings], indent=2))
    else:
        for finding in findings:
            print(f"[{finding.severity}] {finding.service}/{finding.resource}/"
                  f"{finding.policy}: {finding.rule} — {finding.message}")
        errors = sum(1 for f in findings if f.severity == "error")
        warns = len(findings) - errors
        if findings:
            print(f"\n{errors} error(s), {warns} warning(s).")
        elif not usage_error:
            # "No findings." after a bad target would read as an all-clear.
            print("\nNo findings.")

    # 2 = the caller asked for something that does not exist (a typo); 1 = the
    # tree was linted and has error-severity findings; 0 = clean.
    if usage_error:
        return 2
    return 1 if any(f.severity == "error" for f in findings) else 0


if __name__ == "__main__":
    sys.exit(main())
