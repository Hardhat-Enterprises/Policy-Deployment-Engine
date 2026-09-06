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
a build on their own), 2 a usage or environment error — a target naming a
platform, service or resource type that is not in the tree, or a missing ``opa``
binary. When the named resource type simply has no ``policies/`` directory yet,
the stderr line is marked ``[ERROR] no-policies-dir: <target> (...)`` so a caller
can treat it as "nothing to lint" rather than as a typo.
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
    "unknown-policy-type": (
        "`policy_type` is not one of the six the engine dispatches, so the condition "
        "is never evaluated. Set it to a valid type (lowercase, spaces not "
        "underscores)."),
    "presence-only": (
        "`values` is only null/\"\": presence is the whole check. Acceptable when the "
        "rationale says presence is the control — the reviewer decides; pair with a "
        "pattern where a shape exists (warn)."),
    "wrong-argument": (
        "No condition in `<arg>.rego` reads the argument the file is named after."),
    "fixture-drift": (
        "compliant.tf and nonCompliant.tf differ on attributes other than the "
        "argument under test."),
    "fixture-missing-plan": (
        "No committed plan for this fixture pair — run the test locally and commit "
        "the <sha>.json the harness writes into the fixture directory."),
    "fixture-one-sided": (
        "The fixture has no compliant examples at all, or no non-compliant examples "
        "at all, so one half of what the harness checks is never exercised."),
    "vars-resource-type": (
        "`_vars.resource_type` does not match the resource-type directory."),
    "vars-friendly-name": (
        "`_vars.friendly_resource_name` is empty, equals the raw Terraform type, or "
        "is reused by another resource type."),
    "trivial-message": (
        "`situation_description` under 20 characters or `remedies` empty."),
    "legacy-assign": "Use `:=` for message/details/summary (warn).",
    "package-case": "Package service segment is not lowercase snake_case (warn).",
    "repeated-helper-call": (
        "The same helper is called twice with the same arguments. Call it once, "
        "bind the result to a variable, then read the fields off that."),
    "lint-error": (
        "The linter could not evaluate this policy (parse/opa failure) — run "
        "`opa check` on the file."),
}

# Advisory rules: two style conventions, plus presence-only — whether "presence
# is the control" is a judgement about the argument's rationale, which a human
# (or the AI reviewer) makes, not something a linter can decide. It is surfaced
# to the reviewer rather than failing a build.
#
# `repeated-helper-call` is deliberately NOT here: it is an error, by the owner's
# call. The size of the backlog is what made that look risky — measured on dev
# 2026-08-31, 498 of 1,395 policy files carried the pattern — but the mechanical
# cleanup (PR #565) takes that to 5, and those 5 are skipped only because open
# Service/* branches are editing them.
#
# What keeps a backlog from reaching someone who did not write it is structural,
# not the severity: run_precommit_linter.py fails only on findings the
# contributor OWNS (a file their own branch changed — see `_finding_owned`), and
# branch_scope.py stops a Service/* branch touching a file outside its own
# resource type. A pre-existing finding elsewhere is reported, never failed on.
WARN_RULES = {"legacy-assign", "package-case", "presence-only"}

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

# --- repeated-helper-call --------------------------------------------------- #
# A qualified call, `<package>.<function>(`: the only call shape a policy uses
# (`helpers.get_multi_summary`, the `shared.*` helpers, OPA built-ins like
# `object.get`). Bare built-ins such as `count(x)` are never worth hoisting and
# are deliberately not matched.
QUALIFIED_CALL_RE = re.compile(r"\b([a-z_][A-Za-z0-9_]*)\.([a-z_][A-Za-z0-9_]*)\s*\(")
# A top-level rule head. Column 0 is *not* the test: a good number of policies
# indent their `message :=` line by a space or two, so the head is confirmed by
# being at brace depth 0 instead (see _top_level_rules).
RULE_HEAD_RE = re.compile(
    r"^[ \t]*([a-z_][A-Za-z0-9_]*)\s*(?:\(|\[|:=|=|if\b|contains\b|\{)", re.MULTILINE)
IMPORT_RE = re.compile(
    r"^\s*import\s+([A-Za-z0-9_.]+)(?:\s+as\s+([A-Za-z_][A-Za-z0-9_]*))?\s*$",
    re.MULTILINE)
IDENTIFIER_RE = re.compile(r"\b[A-Za-z_][A-Za-z0-9_]*\b")
REGO_STRING_RE = re.compile(r'"(?:[^"\\]|\\.)*"')
# Roots that are global everywhere, so an argument built only from them means the
# same thing in every rule of the file. Deliberately minimal: an unrecognised
# root is treated as a local, which makes the rule *quieter*, never noisier.
REGO_GLOBAL_ROOTS = frozenset({"input", "data", "true", "false", "null"})
# `.message` / `.details` immediately after a call's closing parenthesis: the
# field the call site actually wanted, which the remedy text echoes back.
FIELD_ACCESS_RE = re.compile(r"\s*\.([a-z_][A-Za-z0-9_]*)")
# How much of a call to echo back before eliding it.
MAX_CALL_ECHO = 60

# Fixture resource labels, per the auto_test convention.
FIXTURE_LABEL_RE = re.compile(r"^(compliant|non_compliant)_example_(\d+)$")
# Keys that are *expected* to differ between the two fixture resources: the
# resource's label ("name"), `labels`, and the provider-computed mirrors.
# `effective_labels` and `terraform_labels` mirror `labels`; `effective_annotations`
# mirrors `annotations` in exactly the same way. A mirror always moves with the key
# it mirrors, so reporting one duplicates a difference the argument under test
# already explains — and it is a difference no author can remove: the mirror cannot
# be equal while the fixture legitimately differs on what it mirrors.
# `annotations` itself needs no entry here: when it is the argument under test
# `_lint_fixtures` already adds the argument key to the ignore set, and when it is
# not, a difference in it is real drift. The resource's `resource_value_name` is
# handled separately — see `_lint_fixtures` — because it is only exempt when it
# holds the fixture label.
FIXTURE_IGNORED_KEYS = {
    "name", "labels", "label", "effective_labels", "terraform_labels",
    "effective_annotations",
}

# --- fixtures whose second difference the provider requires ------------------
#
# The drift rule asks that a compliant and a non-compliant example differ only on
# the argument under test. Sometimes they cannot. Every entry here is the same
# shape: the argument under test belongs to a set Terraform allows only one of, so
# showing a compliant and a non-compliant value of it necessarily changes which
# member of that set is populated. Asking these authors to remove the difference
# would be asking for a fixture terraform will not accept.
#
# This is NOT a way to silence a finding you would rather not fix. It lives in
# scripts/, which a Service branch cannot edit, so adding one takes a maintainer —
# and each entry has to say what the mutually exclusive set is. A fixture that
# stops drifting makes its entry stale, and a test over the real tree fails when
# that happens, so the list cannot quietly rot.
#
# (service folder, resource type, argument) -> ({keys}, why)
FIXTURE_DRIFT_EXEMPT = {
    ("App Hub", "google_apphub_application", "scope.type"): (
        {"location"},
        "A GLOBAL-scoped application can only exist in the `global` location and a "
        "REGIONAL one only in a real region, so the location follows the scope type "
        "under test rather than varying independently of it."),
    ("Certificate Manager", "google_certificate_manager_certificate",
     "self_managed.pem_private_key"): (
        {"managed"},
        "`managed` and `self_managed` are mutually exclusive. Demonstrating a "
        "non-compliant self_managed private key means the compliant example cannot "
        "use self_managed at all, so it uses `managed` instead."),
    ("Certificate Manager", "google_certificate_manager_certificate_map_entry",
     "matcher"): (
        {"hostname"},
        "`matcher` and `hostname` are mutually exclusive. The compliant example "
        "cannot set the matcher it is meant not to use, so it sets a hostname."),
    ("Cloud Platform", "google_folder_organization_policy", "constraint"): (
        {"boolean_policy", "list_policy", "restore_policy"},
        "Each constraint is of a fixed type — compute.disableSerialPortAccess is a "
        "boolean constraint, serviceuser.services a list one — and the three policy "
        "blocks are mutually exclusive. Varying the constraint under test therefore "
        "varies which block is populated."),
    ("Cloud Storage", "google_storage_object_acl", "predefined_acl"): (
        {"role_entity"},
        "`predefined_acl` and `role_entity` are mutually exclusive. The compliant "
        "example cannot set the predefined ACL it is meant not to use, so it grants "
        "the equivalent access with role_entity."),
}


def drift_exempt_keys(service, resource_type, stem):
    """Keys this fixture may differ on because the provider leaves it no choice."""
    entry = FIXTURE_DRIFT_EXEMPT.get((service, resource_type, stem))
    return entry[0] if entry else frozenset()

# The policy types `policies/_helpers/helpers.rego` can dispatch, in the order its
# error message lists them (so the two read identically to a student who hits both).
# Anything else is refused at evaluation time; this rule catches it at authoring
# time instead. Keep in step with `valid_policy_types` there.
VALID_POLICY_TYPES = (
    "blacklist", "whitelist", "range",
    "pattern blacklist", "pattern whitelist", "element blacklist",
)

# Blacklist/whitelist only — a pattern or range policy with empty values means
# something else entirely.
PRESENCE_POLICY_TYPES = {"blacklist", "whitelist"}
EMPTY_VALUES = (None, "", [], {})


class PolicyLintError(RuntimeError):
    """One policy file could not be read (OPA refused to evaluate it).

    Reported as a ``lint-error`` finding against that file — never fatal, so one
    unparseable policy cannot hide every other finding in the run.
    """


class OpaUnavailableError(PolicyLintError):
    """The ``opa`` binary is missing — nothing in the tree can be evaluated.

    A ``PolicyLintError`` so callers that already handle "policy_lint could not
    run" (``run_precommit_linter.py``) catch it, but deliberately *not* caught by
    the per-file guards: a missing toolchain is one environment error, not one
    ``lint-error`` finding per policy file.
    """


class TargetError(ValueError):
    """A CLI target names a platform/service/resource that does not exist."""

    #: Prefix printed before the target when the marker is set, so a caller can
    #: distinguish "nothing to lint yet" from "you typed the name wrong".
    marker = None

    def __init__(self, message, marker=None):
        super().__init__(message)
        self.marker = marker


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
    except FileNotFoundError as exc:
        raise OpaUnavailableError(
            "`opa` is not on PATH — install it to run policy_lint.") from exc
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
        except OpaUnavailableError:
            raise                                         # environment, not content
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
def plan_cache_for(input_dir):
    """``<input_dir>/<sha>.json`` — the committed plan, beside the fixture's *.tf.

    Straight through to ``auto_test.plan_cache_path`` (the pipeline's own
    definition of which plan belongs to a fixture), so a provider bump changes
    the expected filename here and in the harness at the same time. No root
    rebasing is needed any more: the plan lives inside the directory it is for,
    so a fixture tree under ``_tests/`` resolves inside itself for free.
    """
    return plan_cache_path(Path(input_dir))


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
# repeated-helper-call helpers
# --------------------------------------------------------------------------- #
def _strip_rego_comments(text):
    """``text`` with ``#`` comments blanked out, line numbering preserved.

    A ``#`` inside a string is not a comment — ``"projects/*#1"`` is a value, and
    cutting at it would truncate the call the rule is trying to read.
    """
    out = []
    for line in text.splitlines():
        in_string = escaped = False
        cut = None
        for index, char in enumerate(line):
            if escaped:
                escaped = False
            elif char == "\\":
                escaped = True
            elif char == '"':
                in_string = not in_string
            elif char == "#" and not in_string:
                cut = index
                break
        out.append(line if cut is None else line[:cut])
    return "\n".join(out)


def _qualified_calls(text):
    """Yield ``(callee, argument_text, start, end, line_no)`` per ``pkg.func(...)``.

    The closing parenthesis is found by balancing, not by regex, so a call whose
    arguments themselves contain parentheses or brackets is read whole.
    """
    for match in QUALIFIED_CALL_RE.finditer(text):
        depth = 0
        index = match.end() - 1
        in_string = escaped = False
        while index < len(text):
            char = text[index]
            if escaped:
                escaped = False
            elif char == "\\":
                escaped = True
            elif char == '"':
                in_string = not in_string
            elif not in_string:
                if char == "(":
                    depth += 1
                elif char == ")":
                    depth -= 1
                    if depth == 0:
                        break
            index += 1
        if depth != 0:            # unbalanced — a parse error, not this rule's job
            continue
        callee = f"{match.group(1)}.{match.group(2)}"
        line_no = text.count("\n", 0, match.start()) + 1
        yield callee, text[match.end():index], match.start(), index + 1, line_no


def _top_level_rules(text):
    """``[(start, end, name)]`` for each top-level rule, split at brace depth 0."""
    heads = []
    depth = 0
    in_string = escaped = False
    consumed = 0
    for match in RULE_HEAD_RE.finditer(text):
        for char in text[consumed:match.start()]:
            if escaped:
                escaped = False
            elif char == "\\":
                escaped = True
            elif char == '"':
                in_string = not in_string
            elif not in_string:
                if char in "{[(":
                    depth += 1
                elif char in "}])":
                    depth -= 1
        consumed = match.start()
        if depth == 0 and not in_string:
            heads.append((match.start(), match.group(1)))
    return [(start, heads[i + 1][0] if i + 1 < len(heads) else len(text), name)
            for i, (start, name) in enumerate(heads)]


def _scope_of(position, spans):
    """Index of the top-level rule containing ``position`` (-1 above them all)."""
    for index, (start, end, _name) in enumerate(spans):
        if start <= position < end:
            return index
    return -1


def _argument_roots(argument_text):
    """The root identifiers an argument expression depends on.

    ``vars.variables`` has the single root ``vars``; ``resource`` has the root
    ``resource``. String contents are blanked first so a word inside a value is
    never mistaken for a variable.
    """
    cleaned = REGO_STRING_RE.sub('""', argument_text)
    return {match.group()
            for match in IDENTIFIER_RE.finditer(cleaned)
            if match.start() == 0 or cleaned[match.start() - 1] != "."}


def _echo_call(callee, argument_text):
    """``callee(args)`` on one line, elided if long, for a finding message."""
    collapsed = " ".join(argument_text.split())
    if len(collapsed) > MAX_CALL_ECHO:
        collapsed = collapsed[:MAX_CALL_ECHO].rstrip() + "..."
    return f"{callee}({collapsed})"


def _repeated_helper_calls(text):
    """Identical helper calls that could be computed once and reused.

    Yields ``(callee, argument_text, [line, ...], [field, ...])``. The fields are
    the ``.message`` / ``.details`` read off each call site, and are empty when
    any site is not a field read.

    "Identical" means the same helper and the same argument text (whitespace
    insensitive). Two calls with *different* arguments compute different things
    and are never reported.

    Scope is the second half of the test, and it is what keeps the rule honest.
    Two calls are only interchangeable when their arguments mean the same thing
    in both places, which holds when either:

    * both sit in the same top-level rule, so they share its locals; or
    * every argument is built from package-level names (another rule in the file,
      an import such as ``vars``, ``input``/``data``), so it reads the same
      anywhere in the file. This is the case the policy kits hit — ``message``
      and ``details`` are *sibling* rules, and the fix binds a third one.

    A call whose arguments name a rule-local variable (a function parameter, a
    comprehension variable) is only reported against the same rule: two helper
    rules that each do ``shared.get_attribute_value(resource, attribute_path)``
    over their own ``resource`` are unrelated, and hoisting them is not possible.
    """
    spans = _top_level_rules(text)
    file_globals = ({name for _s, _e, name in spans}
                    | {(match.group(2) or match.group(1).rsplit(".", 1)[-1])
                       for match in IMPORT_RE.finditer(text)}
                    | REGO_GLOBAL_ROOTS)

    groups = {}
    for callee, argument_text, start, end, line_no in _qualified_calls(text):
        key = (callee, "".join(argument_text.split()))
        field = FIELD_ACCESS_RE.match(text, end)
        groups.setdefault(key, []).append(
            (start, line_no, argument_text, field.group(1) if field else None))

    for (callee, _key), occurrences in groups.items():
        if len(occurrences) < 2:
            continue
        scopes = {_scope_of(start, spans) for start, _l, _a, _f in occurrences}
        argument_text = occurrences[0][2]
        if len(scopes) > 1 and not _argument_roots(argument_text) <= file_globals:
            continue
        fields = [field for _s, _l, _a, field in occurrences]
        yield (callee, argument_text,
               [line for _s, line, _a, _f in occurrences],
               fields if all(fields) else [])


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

    # --- repeated-helper-call ---------------------------------------------- #
    # The kit convention is one binding per file: `result := helpers.get_multi_
    # summary(conditions, vars.variables)`, with `message` and `details` read off
    # `result`. Writing the call out again per field re-evaluates it per field.
    for callee, argument_text, lines, fields in _repeated_helper_calls(
            _strip_rego_comments(text)):
        call = _echo_call(callee, argument_text)
        where = f"lines {', '.join(str(line) for line in lines)}"
        if fields:
            reads = ", ".join(f"`{field} := result.{field}`"
                              for field in dict.fromkeys(fields))
            fix = (f"assign it once — `result := {call}` — then read the fields "
                   f"off `result`: {reads}")
        else:
            fix = (f"assign it once — `result := {call}` — and use `result` "
                   "at each of those sites")
        add("repeated-helper-call",
            f"{call} is evaluated {len(lines)} times ({where}); {fix}")

    try:
        conditions = load_conditions(rego_path, policies_root)
    except OpaUnavailableError:
        raise
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

            # --- unknown-policy-type ---------------------------------------- #
            # First in the block on purpose: if the engine cannot dispatch the
            # type, the condition is never evaluated, so every other reading of
            # it (what it checks, against which values) is beside the point.
            if policy_type not in VALID_POLICY_TYPES:
                declared = check.get("policy_type")
                wrote = (f"declares policy_type {declared!r}"
                         if declared not in (None, "")
                         else "declares no policy_type")
                # Keyed on the path as well as the type, so every offending
                # condition is reported at once rather than the next one
                # surfacing each time the author fixes the previous.
                add_once("unknown-policy-type", (str(declared), path_text),
                         f"'{path_text}' {wrote}, which the engine cannot dispatch "
                         f"— the condition is never evaluated and the policy passes "
                         f"everything. Set policy_type to one of: "
                         f"{', '.join(VALID_POLICY_TYPES)} (lowercase, and a space "
                         f"rather than an underscore).")

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
def _plan_resources(plan):
    """``planned_values.root_module.resources`` — or None if this is not a plan."""
    if not isinstance(plan, dict):
        return None
    planned = plan.get("planned_values")
    if not isinstance(planned, dict):
        return None
    root_module = planned.get("root_module")
    if not isinstance(root_module, dict):
        return None
    resources = root_module.get("resources")
    if resources is None:
        return []
    return resources if isinstance(resources, list) else None


def _is_fixture_label(value):
    """True when a planned value is just the fixture's own label."""
    return isinstance(value, str) and bool(FIXTURE_LABEL_RE.match(value))


# A *value* that names itself after the fixture it belongs to. Deliberately looser
# than FIXTURE_LABEL_RE, which matches a terraform resource label and may keep its
# underscores: many GCP id fields reject underscores, so a contributor naming an
# example has to write `compliant-example-1`, and `compliant-assistant-1` is the
# same act of naming. The polarity carries the meaning — a value starting
# `compliant-` beside one starting `non-compliant-` is one label written twice, not
# two different configurations.
_LABEL_VALUE_RE = re.compile(r"^(non[-_]compliant|compliant)[-_]", re.I)


def _label_polarity(value):
    """'compliant' / 'non_compliant' when a value names itself after the fixture."""
    if not isinstance(value, str):
        return None
    match = _LABEL_VALUE_RE.match(value)
    if not match:
        return None
    return "non_compliant" if match.group(1).lower().startswith("non") else "compliant"


def _drift_comparisons(compliant, non_compliant):
    """(compliant_values, non_compliant_values) pairs for the drift rule.

    Numbered twins are compared to each other. An example with no twin is still
    compared — to the lowest-numbered example on the other side — so that an
    N-vs-M fixture cannot hide drift in the examples that happen to be orphans.
    Every example on both sides therefore appears in at least one comparison.

    Measured over the whole tree on 2026-08-31: this widens 1,050 comparisons to
    1,110 and produces 0 additional findings and 0 additional drifted keys, so
    it closes the gap without moving anyone's backlog.
    """
    if not compliant or not non_compliant:
        return []
    lowest_compliant = compliant[min(compliant, key=int)]
    lowest_non_compliant = non_compliant[min(non_compliant, key=int)]
    pairs = [(compliant[i], non_compliant[i])
             for i in sorted(set(compliant) & set(non_compliant), key=int)]
    pairs += [(lowest_compliant, non_compliant[i])
              for i in sorted(set(non_compliant) - set(compliant), key=int)]
    pairs += [(compliant[i], lowest_non_compliant)
              for i in sorted(set(compliant) - set(non_compliant), key=int)]
    return pairs


def _lint_fixtures(root, platform, service, resource_type, stem, identity_key=None):
    input_dir = Path(root) / "inputs" / platform / service / resource_type / stem
    # A missing input directory is linter.py's finding (an orphan policy), not
    # ours — we only speak about fixtures that exist.
    if not input_dir.is_dir() or not any(input_dir.glob("*.tf")):
        return []

    cache = plan_cache_for(input_dir)
    if not cache.exists():
        # Reported repo-relative: the finding is read in CI logs and on the portal,
        # where an absolute path of the checkout means nothing.
        return [Finding(service, resource_type, stem, "fixture-missing-plan",
                        f"no committed plan at {cache.relative_to(root).as_posix()} — "
                        "run auto_test locally and commit the file it writes")]

    try:
        plan = json.loads(cache.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        return [Finding(service, resource_type, stem, "fixture-missing-plan",
                        f"plan {cache.name} is unreadable: {exc}")]

    # A cache written by an older/other tool (or a truncated file) must be a
    # finding, not an AttributeError halfway down this function.
    resources = _plan_resources(plan)
    if resources is None:
        return [Finding(service, resource_type, stem, "lint-error",
                        f"plan {cache.name} is not a Terraform plan "
                        "(no planned_values.root_module.resources list)")]

    compliant, non_compliant = {}, {}
    for resource in resources:
        if not isinstance(resource, dict) or resource.get("type") != resource_type:
            continue
        match = FIXTURE_LABEL_RE.match(resource.get("name") or "")
        if not match:
            continue
        bucket = compliant if match.group(1) == "compliant" else non_compliant
        values = resource.get("values")
        bucket[match.group(2)] = values if isinstance(values, dict) else {}

    # --- fixture-one-sided ------------------------------------------------- #
    # The harness does NOT pair examples by number. `validate_policy_output`
    # matches labels against `^compliant_example_\d+$` / `^non_compliant_
    # example_\d+$` and asserts two things over the whole set: no compliant
    # example may be flagged, and every non-compliant example must be. An
    # orphan `non_compliant_example_3` is therefore fully evaluated — N
    # compliant against M non-compliant is a legitimate, and often better,
    # shape (one baseline against several distinct failure modes).
    #
    # What is genuinely untested is a fixture with nothing on one side: with no
    # non-compliant example nothing has to be flagged, so a policy that matches
    # nothing passes; with no compliant example nothing has to stay unflagged,
    # so a policy that flags everything passes.
    findings = []
    if not compliant or not non_compliant:
        missing = []
        if not compliant:
            missing.append("no compliant_example_N resources")
        if not non_compliant:
            missing.append("no non_compliant_example_N resources")
        findings.append(Finding(
            service, resource_type, stem, "fixture-one-sided",
            f"the committed plan has {' and '.join(missing)} of type "
            f"'{resource_type}' — a fixture needs at least one of each"))

    # Only the argument's *top-level* key is expected to differ; a nested
    # argument (a.b.c) is compared at its block key, since the plan nests it.
    argument_key = stem.split(".")[0]
    ignored = (FIXTURE_IGNORED_KEYS | {argument_key}
               | drift_exempt_keys(service, resource_type, stem))

    drifted = set()
    for good, bad in _drift_comparisons(compliant, non_compliant):
        # What the argument under test is actually set to on each side. A key that
        # merely carries these values onward is a mirror of the thing being tested,
        # not a second difference: `google_service_account.email` is built from
        # `account_id`, and a regional resource's `target` URL embeds its `region`.
        # Changing the argument necessarily changes them, so reporting them tells a
        # contributor to remove a difference the provider requires.
        arg_good, arg_bad = good.get(argument_key), bad.get(argument_key)
        mirrors = (isinstance(arg_good, str) and isinstance(arg_bad, str)
                   and len(arg_good) >= 3 and len(arg_bad) >= 3 and arg_good != arg_bad)

        for key in set(good) | set(bad):
            if key in ignored:
                continue
            good_value, bad_value = good.get(key), bad.get(key)
            if good_value == bad_value:
                continue
            # Case-sensitive containment on purpose: `location = "global"` beside
            # `scope.type = "GLOBAL"` is a real editorial choice about the fixture,
            # not a value the provider derived.
            if (mirrors and isinstance(good_value, str) and isinstance(bad_value, str)
                    and arg_good in good_value and arg_bad in bad_value):
                continue
            # A key whose two values are the fixture's own labels is naming, not
            # drift — `odb_subnet_id = "compliant-example-1"` against
            # `"non-compliant-example-1"` is one name written twice. The polarity
            # has to line up: the compliant side must carry the compliant label. A
            # pair that merely looks label-ish on one side stays drift.
            if (_label_polarity(good_value) == "compliant"
                    and _label_polarity(bad_value) == "non_compliant"):
                continue
            # The identity attribute (`bucket` on an IAM binding, `name`
            # elsewhere) is exempt ONLY when it *is* the fixture label — two
            # genuinely different bucket names are drift like any other.
            if (key == identity_key
                    and _is_fixture_label(good_value) and _is_fixture_label(bad_value)):
                continue
            drifted.add(key)

    if drifted:
        findings.append(Finding(
            service, resource_type, stem, "fixture-drift",
            "compliant.tf and nonCompliant.tf also differ on: " + ", ".join(sorted(drifted))))
    return findings


# --------------------------------------------------------------------------- #
# Rules over _vars.rego
# --------------------------------------------------------------------------- #
_friendly_index_cache: dict[tuple, dict] = {}

# Text fallback for the friendly-name index only. It is deliberately not used for
# anything else: every rule that decides a finding reads *evaluated* Rego, never
# scraped text.
FRIENDLY_NAME_RE = re.compile(
    r'"friendly_resource_name"\s*:\s*"((?:[^"\\]|\\.)*)"')


def _friendly_name_from_text(vars_path):
    """The declared friendly_resource_name scraped from a _vars.rego, or None."""
    match = FRIENDLY_NAME_RE.search(Path(vars_path).read_text(encoding="utf-8"))
    return match.group(1) if match else None


def _friendly_name_index(policies_root, platform):
    """{normalised friendly name: [(service, resource_type), ...]} for a platform.

    Duplicate detection is only meaningful across the whole tree, so this reads
    *every* ``_vars.rego`` under ``policies/<platform>/``. It needs exactly one
    field from each, ``friendly_resource_name``, and in every file in the tree that
    field is a plain string literal — so the name is read straight out of the text
    and OPA is not involved at all.

    That is the one place this linter reads text rather than evaluated Rego, and it
    is worth being precise about why it is safe here and nowhere else. A rule that
    decides a finding has to see what the policy actually evaluates to; this index
    only has to recognise the same literal twice. Evaluating the whole platform to
    obtain it cost 0.93s of the 1.05s a single-resource lint spent — for a result
    measured to be byte-identical to the regex over all 441 files.

    A file whose name the regex cannot read is not assumed absent: those files, and
    only those, are resolved with one ``opa eval`` over the platform. So a
    ``friendly_resource_name`` that is computed rather than declared still lands in
    the index correctly; it just makes the run pay for what it needs.
    """
    policies_root = Path(policies_root)
    key = (str(policies_root.resolve()), platform)
    if key in _friendly_index_cache:
        return _friendly_index_cache[key]

    platform_root = policies_root / platform
    vars_paths = sorted(platform_root.glob(f"*/*/{VARS_FILE}"))

    names, unread = {}, []
    for vars_path in vars_paths:
        try:
            friendly = _friendly_name_from_text(vars_path)
        except (OSError, UnicodeDecodeError):
            continue
        if friendly is None:
            unread.append(vars_path)
        else:
            names[vars_path] = friendly

    if unread:
        # Only now is an evaluation worth its cost, and only for these files.
        helpers_dir = _resolve_helpers(policies_root)
        try:
            tree = _run_opa("data.terraform", helpers_dir, platform_root) or {}
        except OpaUnavailableError:
            raise
        except PolicyLintError:
            # ONE unparseable file anywhere under the platform fails the batch.
            # Nothing more to try: those names stay out of the index.
            tree = None
        for vars_path in unread:
            try:
                variables = _walk(tree, _package_of(vars_path).split(".")[1:]
                                  + ["variables"]) if tree is not None else None
            except (PolicyLintError, OSError, UnicodeDecodeError):
                continue
            if isinstance(variables, dict):
                names[vars_path] = variables.get("friendly_resource_name")

    index = {}
    for vars_path, friendly in names.items():
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
        except OpaUnavailableError:
            raise
        except (PolicyLintError, OSError, UnicodeDecodeError) as exc:
            findings.append(Finding(service_folder, resource_type, "_vars",
                                    "lint-error", str(exc)))

    for rego_path in sorted(resource_dir.glob(f"*{REGO_EXT}")):
        if rego_path.name == VARS_FILE:
            continue
        try:
            findings += _lint_policy_file(root, platform, service_folder, resource_type,
                                          rego_path, policies_root, identity_key)
        except OpaUnavailableError:
            raise
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
                # The service folder exists, so the name is plausible — this is
                # usually a resource whose policies have not been written yet, not
                # a typo. Marked so the portal can treat it as "nothing to lint".
                raise TargetError(
                    f"no policies directory {platform}/{service}/{parts[2]}/ "
                    f"({len(resources)} resource type(s) in that service)",
                    marker="no-policies-dir")
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
                             "'<platform>/<Service folder>/<resource_type>'. "
                             "Exit 2 means the target does not exist; when the "
                             "resource type simply has no policies/ directory yet "
                             "the stderr line reads "
                             "'[ERROR] no-policies-dir: <target> (...)'.")
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
            marker = f"{exc.marker}: " if exc.marker else ""
            print(f"[ERROR] {marker}{target}: {exc}", file=sys.stderr)
            usage_error = True
        except OpaUnavailableError as exc:
            # One environment error for the whole run, not one per policy file.
            print(f"[ERROR] policy_lint could not run: {exc}", file=sys.stderr)
            return 2

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
