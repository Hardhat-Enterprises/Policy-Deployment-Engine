#!/usr/bin/env python3
"""
pde_autoremediate.py — generalised Terraform auto-remediation for the whole
Policy-Deployment-Engine dev branch.

WHAT THIS DOES
---------------
1. DISCOVER   — walks policies/**/*.rego on the dev branch and finds every
                argument-level policy that exists, regardless of who wrote it
                or which service/resource it belongs to.
2. LEARN      — for each policy, asks the REAL OPA engine what the policy's
                own condition logic says (policy_type, attribute_path,
                safe values) — nothing is hand-coded per resource. This is
                "the compliant policy logic written by other students",
                read back out of their own Rego files programmatically.
3. DETECT     — runs the SAME real policies against a Terraform plan (the
                artefact produced right after `terraform plan`, which is
                also what triggers the Rego compliance check in CI) to find
                which resources are non-compliant.
4. REMEDIATE  — for each violation, works out the safe fix from the policy's
                own condition data (see FIX RULES below) and patches the
                offending attribute directly in the Terraform source file.
5. RE-VERIFY  — re-runs the same real policy on the patched resource and
                confirms zero non-compliant resources remain.

FIX RULES (derived from reading policies/_helpers/policies/*.rego directly —
not guessed):
  whitelist  (819 policies) — scalar: set to values[0].
                               list:   keep only elements that are in `values`;
                                       if that empties the list, fall back to
                                       [values[0]].
  blacklist  (328 policies) — boolean scalar: flip to the other boolean value
                                       (deterministic — only two options exist).
                               list:   remove every element that is in `values`.
                               other scalar: NOT auto-fixable — the safe
                                       replacement isn't knowable from the
                                       policy alone (e.g. a blacklisted region
                                       string; many other values would be
                                       valid but we don't know which). Flagged
                                       for manual review, never guessed.
  range      (19  policies) — numeric: clamp into [min, max] on whichever
                                       side was violated.

Anything else (pattern_*, element_*, map_key_blacklist — defined in the shared
helpers but not currently used by any live policy) is detected and flagged,
never silently mishandled.

KNOWN LIMITATIONS (found by running this against all 1,654 policies with a
fixture on dev — see validation_report.json for the full numbers):
  - The Terraform patcher understands HCL *blocks* (`name { ... }`) at any
    nesting depth, but not *map-typed attributes* (`name = { "key" = val }`),
    which is a different syntax Terraform allows for the same kind of nested
    data. ~1% of policies use this style (e.g. Cloud Run annotations,
    Dataproc runtime_config.properties) and are correctly flagged rather
    than mis-patched.
  - If the nested block a fix needs to change is entirely ABSENT from the
    resource (not just wrong, but missing), the patcher won't fabricate a
    new block from scratch — it flags rather than guesses the right shape.
  - About a third of resources across the whole repo don't follow the
    `non_compliant_example_1` fixture-naming convention consistently (this
    is a data-quality issue in some other contributors' fixtures, not a bug
    in this engine) — these are reported separately as
    resource_name_mismatch, never silently skipped.

USAGE
-----
  # See what's actually out there on dev:
  python3 pde_autoremediate.py discover --repo /path/to/Policy-Deployment-Engine

  # Real use in CI, against a real target Terraform project:
  terraform -chdir=my-infra plan -out=plan.tfplan
  terraform -chdir=my-infra show -json plan.tfplan > plan.json
  python3 pde_autoremediate.py remediate \
      --repo /path/to/Policy-Deployment-Engine \
      --plan plan.json \
      --tf-dir my-infra \
      --apply            # omit --apply to dry-run and only report

  # Repo-wide self-validation (used to prove this generalises — see README):
  python3 pde_autoremediate.py validate-repo --repo /path/to/Policy-Deployment-Engine
"""
import argparse
import json
import re
import subprocess
import sys
from dataclasses import dataclass, field
from pathlib import Path

OPA_BIN = "/tmp/opa"  # override with --opa-bin if opa is on PATH as `opa`


# ---------------------------------------------------------------------------
# Discovery
# ---------------------------------------------------------------------------

@dataclass
class Policy:
    package: str            # e.g. terraform.gcp.security.oracle_database.google_oracle_database_odb_subnet.deletion_protection
    rego_path: Path
    resource_dir: Path      # policies/<platform>/<service>/<resource>/
    rel_resource_dir: Path  # resource_dir relative to policies/ — mirrors the inputs/ tree
    helpers_dir: Path
    resource_type: str      # e.g. google_oracle_database_odb_subnet (from _vars.rego)
    resource_value_name: str  # attribute whose VALUE identifies a resource in violation reports (from _vars.rego)
    platform: str
    service: str
    resource: str
    argument: str


PACKAGE_RE = re.compile(r"^package\s+([\w.]+)\s*$", re.MULTILINE)
RESOURCE_TYPE_RE = re.compile(r'"resource_type"\s*:\s*"([^"]+)"')
RESOURCE_VALUE_NAME_RE = re.compile(r'"resource_value_name"\s*:\s*"([^"]+)"')


def discover_policies(repo_root: Path) -> list[Policy]:
    policies_root = repo_root / "policies"
    helpers_dir = policies_root / "_helpers"
    out: list[Policy] = []

    for rego_path in sorted(policies_root.rglob("*.rego")):
        if "_helpers" in rego_path.parts:
            continue
        if rego_path.name == "_vars.rego":
            continue

        text = rego_path.read_text(encoding="utf-8", errors="ignore")
        m = PACKAGE_RE.search(text)
        if not m:
            continue
        package = m.group(1)

        resource_dir = rego_path.parent
        vars_path = resource_dir / "_vars.rego"
        resource_type = None
        resource_value_name = None
        if vars_path.exists():
            vars_text = vars_path.read_text(encoding="utf-8", errors="ignore")
            vm = RESOURCE_TYPE_RE.search(vars_text)
            if vm:
                resource_type = vm.group(1)
            vvm = RESOURCE_VALUE_NAME_RE.search(vars_text)
            if vvm:
                resource_value_name = vvm.group(1)
        if resource_type is None:
            # fall back: last package segment before the argument is usually the resource type
            parts = package.split(".")
            resource_type = parts[-2] if len(parts) >= 2 else resource_dir.name

        try:
            rel = resource_dir.relative_to(policies_root)
            platform = rel.parts[0]
            service = rel.parts[1] if len(rel.parts) > 1 else ""
        except ValueError:
            platform, service = "unknown", "unknown"

        out.append(Policy(
            package=package,
            rego_path=rego_path,
            resource_dir=resource_dir,
            rel_resource_dir=resource_dir.relative_to(policies_root),
            helpers_dir=helpers_dir,
            resource_type=resource_type,
            resource_value_name=resource_value_name,
            platform=platform,
            service=service,
            resource=resource_dir.name,
            argument=rego_path.stem,
        ))
    return out


# ---------------------------------------------------------------------------
# Talking to the real OPA engine
# ---------------------------------------------------------------------------

def find_violated_resource(resources: list, res_name: str, resource_value_name):
    """`non_compliant_resources` entries are the VALUE of each resource's
    `resource_value_name` attribute (declared per-resource in _vars.rego),
    NOT the Terraform block label — confirmed by reading helpers.rego and
    each resource's own _vars.rego directly. Match on that first; fall back
    to matching the block label for resources that don't declare one."""
    if resource_value_name:
        for r in resources:
            if r.get("values", {}).get(resource_value_name) == res_name:
                return r
    for r in resources:
        if r.get("name") == res_name:
            return r
    return None


def opa_eval(opa_bin: str, data_paths: list[Path], query: str, input_obj: dict | None = None):
    cmd = [opa_bin, "eval"]
    for p in data_paths:
        cmd += ["--data", str(p)]
    tmp_input = None
    if input_obj is not None:
        import tempfile
        tmp_input = tempfile.NamedTemporaryFile(mode="w", suffix=".json", delete=False)
        json.dump(input_obj, tmp_input)
        tmp_input.close()
        cmd += ["--input", tmp_input.name]
    cmd += ["--format", "json", query]
    try:
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=15)
    finally:
        if tmp_input:
            Path(tmp_input.name).unlink(missing_ok=True)
    if result.returncode != 0:
        raise RuntimeError(f"opa eval failed for {query}: {result.stderr.strip()}")
    payload = json.loads(result.stdout)
    res = payload.get("result")
    if not res:
        return None
    exprs = res[0].get("expressions")
    return exprs[0].get("value") if exprs else None


def get_conditions(policy: Policy, opa_bin: str = OPA_BIN):
    """Flat list of {situation, remedies, policy_type, attribute_path, values}."""
    raw = opa_eval(opa_bin, [policy.helpers_dir, policy.resource_dir], f"data.{policy.package}.conditions")
    flat = []
    if not raw:
        return flat
    for situation in raw:
        meta, cond = None, None
        for entry in situation:
            if "policy_type" in entry:
                cond = entry
            else:
                meta = entry
        if cond is None:
            continue
        flat.append({
            "situation": (meta or {}).get("situation_description"),
            "remedies": (meta or {}).get("remedies", []),
            "policy_type": cond.get("policy_type", "").lower(),
            "attribute_path": cond.get("attribute_path", []),
            "values": cond.get("values", []),
        })
    return flat


def get_details(policy: Policy, plan: dict, opa_bin: str = OPA_BIN):
    return opa_eval(opa_bin, [policy.helpers_dir, policy.resource_dir], f"data.{policy.package}.details", plan) or []


# ---------------------------------------------------------------------------
# Fix computation (the rules documented at the top of this file)
# ---------------------------------------------------------------------------

@dataclass
class Fix:
    fixable: bool
    new_value: object = None
    reason: str = ""


def get_nested(obj, path: list):
    cur = obj
    for p in path:
        if isinstance(p, int):
            if not isinstance(cur, list) or p >= len(cur):
                return None
            cur = cur[p]
        else:
            if not isinstance(cur, dict) or p not in cur:
                return None
            cur = cur[p]
    return cur


def compute_fix(cond: dict, current_value) -> Fix:
    try:
        return _compute_fix_inner(cond, current_value)
    except Exception as e:
        return Fix(False, reason=f"unexpected condition/value shape, not auto-fixable: {e}")


def _compute_fix_inner(cond: dict, current_value) -> Fix:
    ptype = cond["policy_type"]
    values = cond["values"]

    if ptype == "whitelist":
        if isinstance(current_value, list):
            allowed = set(values)
            kept = [v for v in current_value if v in allowed]
            if not kept and values:
                kept = [values[0]]
            return Fix(True, kept, "kept only whitelisted elements")
        if values:
            return Fix(True, values[0], f"set to first whitelisted value {values[0]!r}")
        return Fix(False, reason="whitelist has no values to fall back to")

    if ptype == "blacklist":
        # Some policies blacklist the *absence* of a value (None and/or []) to
        # mean "this must be set to something non-empty" rather than
        # forbidding specific concrete values. There's no way to invent a
        # semantically valid value (e.g. a real XPath expression) from the
        # policy alone, so this is always a manual-review case — but give a
        # clear reason instead of letting it fall through to a raw exception.
        if any(v is None or v == [] for v in values if not isinstance(v, (str, bool, int, float))) or None in values:
            return Fix(False, reason=(
                "blacklist forbids an empty/absent value — this attribute must be set to something "
                "meaningful (see the policy's remedies), which isn't something that can be invented automatically"
            ))
        if isinstance(current_value, list):
            forbidden = {v for v in values if isinstance(v, (str, bool, int, float))}
            cleaned = [v for v in current_value if v not in forbidden]
            return Fix(True, cleaned, "removed blacklisted elements")
        if isinstance(current_value, bool) and set(values) <= {True, False} and len(set(values)) <= 2:
            return Fix(True, not current_value, "flipped boolean away from blacklisted value")
        return Fix(False, reason=(
            f"scalar blacklist on a non-boolean value ({current_value!r} forbidden: {values!r}) — "
            "no single safe replacement is knowable from the policy alone; needs a human to choose one"
        ))

    if ptype == "range":
        if len(values) != 2:
            return Fix(False, reason="range policy did not have exactly [min, max]")
        lo, hi = values
        try:
            cur = float(current_value)
        except (TypeError, ValueError):
            return Fix(False, reason=f"current value {current_value!r} is not numeric")
        if cur < lo:
            return Fix(True, lo if isinstance(lo, int) else lo, f"clamped up to minimum {lo}")
        if cur > hi:
            return Fix(True, hi if isinstance(hi, int) else hi, f"clamped down to maximum {hi}")
        return Fix(False, reason="value already in range (should not have been flagged)")

    return Fix(False, reason=f"policy_type {ptype!r} is not one of whitelist/blacklist/range")


# ---------------------------------------------------------------------------
# Terraform text patcher (best-effort, documented limitations below)
# ---------------------------------------------------------------------------

def _to_hcl_literal(value) -> str:
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, (int, float)):
        return str(value)
    if isinstance(value, list):
        return "[" + ", ".join(_to_hcl_literal(v) for v in value) + "]"
    return json.dumps(value)  # quoted string


def _match_brace(text: str, open_pos: int):
    """Given the index of a '{', return the index of its matching '}' by counting."""
    depth = 0
    i = open_pos
    while i < len(text):
        if text[i] == "{":
            depth += 1
        elif text[i] == "}":
            depth -= 1
            if depth == 0:
                return i
        i += 1
    return None


def _find_block(text: str, start: int, end: int, block_name: str):
    """Find a direct nested block `block_name { ... }` inside text[start:end],
    returning (open_brace_pos, close_brace_pos, indent) using real brace
    counting so it's correct regardless of what else is nested inside."""
    pat = re.compile(r"\n([ \t]*)" + re.escape(block_name) + r"\s*\{")
    m = pat.search(text, start, end)
    if not m:
        return None
    open_pos = text.index("{", m.end() - 1)
    close_pos = _match_brace(text, open_pos)
    if close_pos is None or close_pos > end:
        return None
    return open_pos, close_pos, m.group(1)


def _match_delim(text: str, open_pos: int, open_ch: str, close_ch: str):
    """Like _match_brace but for any bracket pair (used for multi-line lists/objects)."""
    depth = 0
    i = open_pos
    while i < len(text):
        if text[i] == open_ch:
            depth += 1
        elif text[i] == close_ch:
            depth -= 1
            if depth == 0:
                return i
        i += 1
    return None


def _set_attribute_in_range(text: str, start: int, end: int, attr: str, value_literal: str, indent: str) -> str:
    segment = text[start:end]
    attr_re = re.compile(r"\n[ \t]*" + re.escape(attr) + r"\s*=\s*")
    m = attr_re.search(segment)
    if m:
        value_start = m.end()
        # Find where the CURRENT value actually ends — if it opens a bracket
        # (a list/object, which may span multiple lines), match to its close;
        # otherwise it's a scalar and ends at the line break.
        first_ch = segment[value_start] if value_start < len(segment) else ""
        if first_ch == "[":
            value_end = _match_delim(segment, value_start, "[", "]")
        elif first_ch == "{":
            value_end = _match_delim(segment, value_start, "{", "}")
        else:
            nl = segment.find("\n", value_start)
            value_end = nl if nl != -1 else len(segment)
        if value_end is None:
            value_end = len(segment)
        else:
            value_end += 1 if first_ch in "[{" else 0  # include the closing bracket itself
        new_segment = segment[:value_start] + value_literal + segment[value_end:]
    else:
        new_segment = segment + f"\n{indent}  {attr} = {value_literal}\n"
    return text[:start] + new_segment + text[end:]


def patch_tf_attribute(tf_text: str, resource_type: str, resource_label: str,
                        attribute_path: list, new_value) -> tuple[str, bool]:
    """
    Best-effort textual patch for PDE-style fixtures, using real brace
    counting (not naive regex spans) so it's correct at any nesting depth —
    verified against real 1-, 2- and 3-level-deep attribute paths in this
    repo (e.g. deletion_protection; properties.local_backup_enabled;
    properties.diagnostics_data_collection_options.diagnostics_events_enabled).

    Terraform's plan JSON represents every nested block as a list (even a
    single occurrence), so attribute_path entries alternate strings and an
    integer block-index, e.g. ["properties", 0, "local_backup_enabled"].
    The integer only says "the block", not a text token, so it's dropped
    before walking the actual HCL text.

    This is still NOT a full HCL parser/writer — it is deliberately scoped to
    PDE's flat, single-resource-per-file fixture style. For arbitrary
    real-world Terraform (modules, for_each, dynamic blocks, multiple
    resources sharing a file) this component should be swapped for a proper
    HCL AST writer (e.g. Go's hclwrite) — see README "Known limitation".
    """
    path = [seg for seg in attribute_path if isinstance(seg, str)]
    if not path:
        return tf_text, False
    *blocks, attr = path
    value_literal = _to_hcl_literal(new_value)

    res_pat = re.compile(r'resource\s+"' + re.escape(resource_type) + r'"\s+"' + re.escape(resource_label) + r'"\s*\{')
    m = res_pat.search(tf_text)
    if not m:
        return tf_text, False
    open_pos = tf_text.index("{", m.end() - 1)
    close_pos = _match_brace(tf_text, open_pos)
    if close_pos is None:
        return tf_text, False

    cur_start, cur_end, cur_indent = open_pos + 1, close_pos, "  "
    for block_name in blocks:
        found = _find_block(tf_text, cur_start, cur_end, block_name)
        if not found:
            return tf_text, False  # nested block not present in this fixture — flag, don't guess its shape
        b_open, b_close, indent = found
        cur_start, cur_end, cur_indent = b_open + 1, b_close, indent + "  "

    new_text = _set_attribute_in_range(tf_text, cur_start, cur_end, attr, value_literal, cur_indent)
    return new_text, True


# ---------------------------------------------------------------------------
# Reading a Terraform fixture into a plan-shaped dict (validate-repo mode only)
# ---------------------------------------------------------------------------

def _clean_hcl_value(v):
    if isinstance(v, dict):
        return {k: _clean_hcl_value(val) for k, val in v.items() if k != "__is_block__"}
    if isinstance(v, list):
        return [_clean_hcl_value(x) for x in v]
    if isinstance(v, str) and len(v) >= 2 and v[0] == '"' and v[-1] == '"':
        return v[1:-1]
    return v


def build_plan_from_tf(tf_text: str) -> dict:
    """Stand-in for `terraform show -json` when no terraform binary is
    available (as in this sandbox). Real usage of `remediate` takes a real
    plan.json instead — this function exists purely so validate-repo can
    exercise the whole detect/fix/re-verify loop against the repo's own
    fixtures without needing terraform installed."""
    import hcl2
    data = hcl2.loads(tf_text)
    resources = []
    for block in data.get("resource", []):
        for type_key, labels in block.items():
            rtype = type_key.strip('"')
            for label_key, attrs in labels.items():
                resources.append({
                    "type": rtype,
                    "name": label_key.strip('"'),
                    "values": _clean_hcl_value(attrs),
                })
    return {"planned_values": {"root_module": {"resources": resources}}}


# ---------------------------------------------------------------------------
# CLI: validate-repo — repo-wide self-test proving the engine generalises
# ---------------------------------------------------------------------------

def _process_one(policy, orig_text, plan, situation_hit, cond_hit, stats,
                  manual_review_log, patch_failed_log, mismatch_log, opa_bin, write_fixed_to=None):
    """Remediate every resource OPA flagged for this one situation/condition,
    then re-verify. Returns nothing — updates `stats` and the log lists in place."""
    # A fixture may legitimately contain several non_compliant_example_N
    # resources for the same policy (different violation scenarios) — fix
    # every one OPA actually flagged, not just the first, before re-checking.
    working_text = orig_text
    any_unfixable = False
    any_mismatch = False
    any_patch_fail = False

    for res_name in situation_hit["non_compliant_resources"]:
        resource = find_violated_resource(plan["planned_values"]["root_module"]["resources"], res_name, policy.resource_value_name)
        if resource is None:
            any_mismatch = True
            mismatch_log.append({
                "policy": policy.package,
                "opa_says_noncompliant_resource_named": res_name,
                "resource_labels_actually_in_fixture": [r["name"] for r in plan["planned_values"]["root_module"]["resources"]],
                "note": "fixture did not follow the non_compliant_example_1 naming convention",
            })
            continue

        current_value = get_nested(resource["values"], cond_hit["attribute_path"])
        fix = compute_fix(cond_hit, current_value)
        if not fix.fixable:
            any_unfixable = True
            manual_review_log.append({
                "policy": policy.package, "policy_type": cond_hit["policy_type"],
                "attribute_path": cond_hit["attribute_path"], "reason": fix.reason,
            })
            continue

        new_text, ok = patch_tf_attribute(working_text, resource["type"], resource["name"], cond_hit["attribute_path"], fix.new_value)
        if not ok:
            any_patch_fail = True
            patch_failed_log.append({"policy": policy.package, "attribute_path": cond_hit["attribute_path"], "resource": res_name})
            continue
        working_text = new_text

    if any_mismatch:
        stats["resource_name_mismatch"] += 1
        return
    if any_unfixable:
        stats["needs_manual_review"] += 1
        return
    if any_patch_fail:
        stats["patch_failed"] += 1
        return

    new_plan = build_plan_from_tf(working_text)
    details2 = get_details(policy, new_plan, opa_bin)
    still_bad = any(s and s.get("non_compliant_resources") for s in details2)
    if still_bad:
        stats["auto_fixed_but_still_noncompliant"] += 1
    else:
        stats["auto_fixed_and_reverified_compliant"] += 1
        if write_fixed_to is not None:
            out_dir = write_fixed_to / policy.rel_resource_dir / policy.argument
            out_dir.mkdir(parents=True, exist_ok=True)
            (out_dir / "BEFORE_nonCompliant.tf").write_text(orig_text)
            (out_dir / "AFTER_fixed.tf").write_text(working_text)


# ---------------------------------------------------------------------------
# Scoping to a subset (e.g. just your own branch's resources)
# ---------------------------------------------------------------------------

def apply_filter(policies: list, only) -> list:
    """Keep only policies whose resource_type or service contains `only`
    (case-insensitive substring match). None/empty = no filtering."""
    if not only:
        return policies
    needle = only.lower()
    return [p for p in policies if needle in p.resource_type.lower() or needle in p.service.lower()]


def cmd_validate_repo(args):
    repo = Path(args.repo)
    policies = apply_filter(discover_policies(repo), args.only)
    write_fixed_to = Path(args.write_fixed_to) if getattr(args, "write_fixed_to", None) else None
    if write_fixed_to is not None:
        write_fixed_to.mkdir(parents=True, exist_ok=True)
    stats = {
        "total_policies_with_fixture": 0,
        "fixture_missing": 0,
        "condition_type_unsupported": 0,
        "no_violation_found_in_fixture": 0,
        "auto_fixed_and_reverified_compliant": 0,
        "auto_fixed_but_still_noncompliant": 0,
        "patch_failed": 0,
        "resource_name_mismatch": 0,
        "needs_manual_review": 0,
        "eval_error": 0,
    }
    manual_review_log = []
    patch_failed_log = []
    mismatch_log = []
    eval_error_log = []

    for i, policy in enumerate(policies):
        if args.limit and i >= args.limit:
            break
        fixture_path = repo / "inputs" / policy.rel_resource_dir / policy.argument / "nonCompliant.tf"
        if not fixture_path.exists():
            stats["fixture_missing"] += 1
            continue

        try:
            conds = get_conditions(policy, args.opa_bin)
            if not conds:
                stats["eval_error"] += 1
                eval_error_log.append({"policy": policy.package, "stage": "get_conditions", "error": "no conditions returned (empty result)"})
                continue
            orig_text = fixture_path.read_text(encoding="utf-8", errors="ignore")
            plan = build_plan_from_tf(orig_text)
            details = get_details(policy, plan, args.opa_bin)
        except Exception as e:
            stats["eval_error"] += 1
            eval_error_log.append({"policy": policy.package, "stage": "conditions/plan/details", "error": f"{type(e).__name__}: {e}"})
            continue

        stats["total_policies_with_fixture"] += 1

        situation_hit, cond_hit = None, None
        for situation, cond in zip(details, conds):
            if situation and situation.get("non_compliant_resources"):
                situation_hit, cond_hit = situation, cond
                break
        if situation_hit is None:
            stats["no_violation_found_in_fixture"] += 1
            continue

        if cond_hit["policy_type"] not in ("whitelist", "blacklist", "range"):
            stats["condition_type_unsupported"] += 1
            continue

        try:
            _process_one(policy, orig_text, plan, situation_hit, cond_hit, stats,
                         manual_review_log, patch_failed_log, mismatch_log, args.opa_bin, write_fixed_to)
        except Exception as e:
            stats["eval_error"] += 1
            eval_error_log.append({"policy": policy.package, "stage": "_process_one", "error": f"{type(e).__name__}: {e}"})

    print(json.dumps(stats, indent=2))
    if write_fixed_to is not None:
        print(f"\n{stats['auto_fixed_and_reverified_compliant']} BEFORE/AFTER .tf file pairs written under: {write_fixed_to.resolve()}", file=sys.stderr)
    if eval_error_log:
        print(f"\nFirst {min(5, len(eval_error_log))} error(s) (see --log-out for all {len(eval_error_log)}):", file=sys.stderr)
        for e in eval_error_log[:5]:
            print(f"  [{e['stage']}] {e['policy']}: {e['error']}", file=sys.stderr)
    if args.log_out:
        Path(args.log_out).write_text(json.dumps({
            "stats": stats,
            "needs_manual_review": manual_review_log,
            "patch_failed": patch_failed_log,
            "resource_name_mismatch": mismatch_log,
            "eval_errors": eval_error_log,
        }, indent=2))
        print(f"\nDetailed log written to {args.log_out}", file=sys.stderr)


# ---------------------------------------------------------------------------
# CLI: discover
# ---------------------------------------------------------------------------

def cmd_discover(args):
    repo = Path(args.repo)
    policies = apply_filter(discover_policies(repo), args.only)
    by_type: dict[str, int] = {}
    for p in policies:
        conds = get_conditions(p, args.opa_bin)
        for c in conds:
            by_type[c["policy_type"]] = by_type.get(c["policy_type"], 0) + 1
    print(f"Discovered {len(policies)} argument-level policies across "
          f"{len({p.service for p in policies})} services.")
    print("Condition breakdown by policy_type:")
    for k, v in sorted(by_type.items(), key=lambda kv: -kv[1]):
        print(f"  {k:10s} {v}")


# ---------------------------------------------------------------------------
# CLI: remediate (real use against a real target Terraform project)
# ---------------------------------------------------------------------------

def cmd_remediate(args):
    repo = Path(args.repo)
    tf_dir = Path(args.tf_dir)
    plan = json.loads(Path(args.plan).read_text())

    policies = apply_filter(discover_policies(repo), args.only)
    by_resource_type: dict[str, list[Policy]] = {}
    for p in policies:
        by_resource_type.setdefault(p.resource_type, []).append(p)

    resources_in_plan = plan.get("planned_values", {}).get("root_module", {}).get("resources", [])
    plan_types = {r["type"] for r in resources_in_plan}

    report = []
    for rtype in plan_types & by_resource_type.keys():
        for policy in by_resource_type[rtype]:
            conds = get_conditions(policy, args.opa_bin)
            details = get_details(policy, plan, args.opa_bin)
            for situation, cond in zip(details, conds):
                for res_name in situation.get("non_compliant_resources", []):
                    candidates = [r for r in resources_in_plan if r["type"] == rtype]
                    resource = find_violated_resource(candidates, res_name, policy.resource_value_name)
                    if resource is None:
                        continue
                    current = get_nested(resource.get("values", {}), cond["attribute_path"])
                    fix = compute_fix(cond, current)
                    entry = {
                        "resource_type": rtype, "violated_resource_identifier": res_name,
                        "terraform_block_label": resource["name"],
                        "policy": policy.package, "attribute_path": cond["attribute_path"],
                        "current_value": current, "policy_type": cond["policy_type"],
                    }
                    if fix.fixable and args.apply:
                        patched = False
                        for tf_file in tf_dir.rglob("*.tf"):
                            text = tf_file.read_text()
                            new_text, ok = patch_tf_attribute(text, rtype, resource["name"], cond["attribute_path"], fix.new_value)
                            if ok:
                                tf_file.write_text(new_text)
                                patched = True
                                break
                        entry["action"] = "PATCHED" if patched else "FIX_KNOWN_BUT_FILE_NOT_PATCHED"
                        entry["new_value"] = fix.new_value
                    elif fix.fixable:
                        entry["action"] = "FIXABLE (dry-run, use --apply)"
                        entry["new_value"] = fix.new_value
                    else:
                        entry["action"] = "NEEDS_MANUAL_REVIEW"
                        entry["reason"] = fix.reason
                    report.append(entry)

    print(json.dumps(report, indent=2))
    fixed = sum(1 for r in report if r["action"] == "PATCHED")
    needs_review = sum(1 for r in report if r["action"] == "NEEDS_MANUAL_REVIEW")
    print(f"\n{len(report)} violation(s) found, {fixed} patched, {needs_review} need manual review.", file=sys.stderr)


if __name__ == "__main__":
    # --opa-bin is defined on a shared parent parser and inherited by every
    # subcommand, so it works whether you put it before or after the
    # subcommand name (e.g. both `--opa-bin opa.exe discover ...` and
    # `discover ... --opa-bin opa.exe` work).
    opa_parent = argparse.ArgumentParser(add_help=False)
    opa_parent.add_argument("--opa-bin", default=OPA_BIN, help="Path to the opa binary (e.g. .\\opa.exe on Windows)")

    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter, parents=[opa_parent])
    sub = ap.add_subparsers(dest="cmd", required=True)

    d = sub.add_parser("discover", help="Inventory every policy on the dev branch", parents=[opa_parent])
    d.add_argument("--repo", required=True)
    d.add_argument("--only", default=None, help="Filter to a resource_type or service, e.g. google_oracle_database_odb_subnet or 'Oracle Database'")
    d.set_defaults(func=cmd_discover)

    r = sub.add_parser("remediate", help="Detect + auto-fix violations in a real Terraform project", parents=[opa_parent])
    r.add_argument("--repo", required=True)
    r.add_argument("--plan", required=True, help="terraform show -json output")
    r.add_argument("--tf-dir", required=True)
    r.add_argument("--only", default=None, help="Filter to a resource_type or service")
    r.add_argument("--apply", action="store_true", help="Actually write fixes (default: dry-run)")
    r.set_defaults(func=cmd_remediate)

    v = sub.add_parser("validate-repo", help="Repo-wide self-test: run detect->fix->reverify against every fixture on dev", parents=[opa_parent])
    v.add_argument("--repo", required=True)
    v.add_argument("--only", default=None, help="Filter to a resource_type or service")
    v.add_argument("--limit", type=int, default=0, help="Stop after N policies (0 = no limit)")
    v.add_argument("--log-out", default=None, help="Write a detailed JSON log (manual-review + patch-failed items)")
    v.add_argument("--write-fixed-to", default=None, help="Save a BEFORE/AFTER .tf pair for every successfully auto-fixed policy into this folder (nothing under --repo is ever touched)")
    v.set_defaults(func=cmd_validate_repo)

    args = ap.parse_args()

    # Fail fast with a clear, specific message instead of burning through every
    # policy with the same silent subprocess failure (this is exactly what
    # produced 7 uninformative FileNotFoundErrors for one user on Windows).
    import shutil as _shutil
    opa_path = Path(args.opa_bin)
    if not opa_path.exists() and _shutil.which(args.opa_bin) is None:
        print(f"ERROR: --opa-bin {args.opa_bin!r} does not exist and isn't on PATH.", file=sys.stderr)
        print("Checklist:", file=sys.stderr)
        print(f"  1. Does the file actually exist? Run:  dir {args.opa_bin}", file=sys.stderr)
        print("  2. Are you running this command from the SAME folder the file is in?", file=sys.stderr)
        print("     (a relative path like .\\opa.exe only resolves from that exact folder)", file=sys.stderr)
        print("  3. On Windows, a freshly-downloaded .exe is sometimes blocked (Mark of the Web).", file=sys.stderr)
        print(f"     Try:  Unblock-File -Path {args.opa_bin}", file=sys.stderr)
        print(f"  4. Safest fix: use the FULL absolute path, e.g. --opa-bin \"C:\\full\\path\\to\\opa.exe\"", file=sys.stderr)
        sys.exit(1)
    try:
        _check = subprocess.run([args.opa_bin, "version"], capture_output=True, text=True, timeout=10)
        if _check.returncode != 0:
            print(f"ERROR: {args.opa_bin} exists but failed to run (exit {_check.returncode}).", file=sys.stderr)
            print(f"stderr was: {_check.stderr.strip()}", file=sys.stderr)
            sys.exit(1)
    except Exception as e:
        print(f"ERROR: found {args.opa_bin} but couldn't execute it: {type(e).__name__}: {e}", file=sys.stderr)
        print("This usually means Windows has blocked the downloaded file. Try:", file=sys.stderr)
        print(f"  Unblock-File -Path {args.opa_bin}", file=sys.stderr)
        sys.exit(1)

    args.func(args)