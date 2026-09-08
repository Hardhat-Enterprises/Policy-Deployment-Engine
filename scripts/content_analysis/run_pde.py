#!/usr/bin/env python3
"""Content Security Analysis runner for PDE (standalone, Option B).

Pipeline: terraform plan -> extract -> bandit -> normalize -> inject findings
-> opa eval (content_security helper via get_multi_summary) -> PASS / FAIL.

Deliberately separate from scripts/auto_test/auto_test.py; can later be folded
into it (Option A) without changing the core pipeline.

Usage:
  python3 scripts/content_analysis/run_pde.py --fixtures <dir> --policy <file>.rego
"""
import argparse
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))

import extract
import analyze
import normalize

REPO_ROOT = Path(__file__).resolve().parents[2]
CLI_CONFIG_FILE = REPO_ROOT / ".terraform-cache" / "cli.tfrc"
REGISTRY = Path(__file__).resolve().parent / "registry.json"

COMPLIANT_RE = re.compile(r"^compliant_example_\d+$")
NON_COMPLIANT_RE = re.compile(r"^non_compliant_example_\d+$")


def run_terraform(input_dir):
    creds_fd, creds_name = tempfile.mkstemp(suffix=".json", prefix="fake-creds-")
    with os.fdopen(creds_fd, "w") as fh:
        fh.write('{"type": "service_account", "project_id": "fake-project"}')
    env = os.environ.copy()
    env.update({
        "GOOGLE_APPLICATION_CREDENTIALS": creds_name,
        "GOOGLE_PROJECT": "fake-project",
        "GOOGLE_REGION": "us-central1",
        "TF_CLI_CONFIG_FILE": str(CLI_CONFIG_FILE),
    })
    try:
        for cmd in (["terraform", "init", "-backend=false"],
                    ["terraform", "plan", "-refresh=false", "-lock=false",
                     "-input=false", "-out=plan"]):
            p = subprocess.run(cmd, cwd=input_dir, capture_output=True, text=True, env=env)
            if p.returncode != 0:
                raise RuntimeError(f"terraform failed ({' '.join(cmd)}):\n{p.stderr[-800:]}")
        p = subprocess.run(["terraform", "show", "-json", "plan"],
                           cwd=input_dir, capture_output=True, text=True, env=env)
        if p.returncode != 0:
            raise RuntimeError(f"terraform show failed:\n{p.stderr[-800:]}")
        return json.loads(p.stdout)
    finally:
        try:
            os.unlink(creds_name)
        except OSError:
            pass
        for name in ("plan", ".terraform.lock.hcl"):
            try:
                (input_dir / name).unlink()
            except OSError:
                pass
        try:
            shutil.rmtree(input_dir / ".terraform")
        except OSError:
            pass


def parse_policy_package(policy_file):
    for line in policy_file.read_text(encoding="utf-8").splitlines():
        m = re.match(r"^\s*package\s+(\S+)\s*$", line)
        if m:
            return m.group(1).strip()
    raise RuntimeError(f"no package declaration in {policy_file}")


def opa_eval_message(policy_file, plan):
    registry = extract.load_registry(REGISTRY)
    key_map = extract.attribute_key_map(registry)
    plan["content_security_findings"] = normalize.normalize_all(
        analyze.analyze_snippets(extract.extract(plan, key_map), registry))

    input_path = "/tmp/csa_run_pde_input.json"
    Path(input_path).write_text(json.dumps(plan), encoding="utf-8")

    pkg = parse_policy_package(policy_file)
    data_paths = [str(REPO_ROOT / "policies" / "_helpers"), str(policy_file.parent.resolve())]
    cmd = ["opa", "eval"]
    for p in data_paths:
        cmd += ["--data", p]
    cmd += ["--input", input_path, "--format", "json", f"data.{pkg}.message"]

    proc = subprocess.run(cmd, capture_output=True, text=True)
    if proc.returncode != 0:
        raise RuntimeError(f"opa eval failed:\n{proc.stderr[-800:]}")
    value = json.loads(proc.stdout)["result"][0]["expressions"][0]["value"]
    return value if isinstance(value, list) else [value]


def flatten(x):
    out = []
    if isinstance(x, list):
        for item in x:
            out.extend(flatten(item))
    else:
        out.append(str(x))
    return out


def get_resources(plan):
    out = []
    for r in plan["planned_values"]["root_module"]["resources"]:
        label = r.get("name")
        if not label:
            continue
        idents = {label}
        for v in (r.get("values") or {}).values():
            if isinstance(v, str) and v:
                idents.add(v)
        out.append({"label": label, "identifiers": idents})
    return out


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__,
                                     formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--fixtures", required=True)
    parser.add_argument("--policy", required=True)
    args = parser.parse_args(argv)

    plan = run_terraform(Path(args.fixtures).resolve())
    messages = opa_eval_message(Path(args.policy).resolve(), plan)

    print("=== OPA message ===")
    for m in messages:
        print(m if isinstance(m, str) else json.dumps(m, indent=2))

    resources = get_resources(plan)
    id_to_label = {i: r["label"] for r in resources for i in r["identifiers"]}
    flagged = set()
    for line in flatten(messages):
        m = re.match(r"Non-Compliant Resources:\s*(.*)", line)
        if m and m.group(1).strip() != "None - All passed":
            for n in (x.strip() for x in m.group(1).split(",") if x.strip()):
                if n in id_to_label:
                    flagged.add(id_to_label[n])

    compliant = {r["label"] for r in resources if COMPLIANT_RE.fullmatch(r["label"])}
    non_compliant = {r["label"] for r in resources if NON_COMPLIANT_RE.fullmatch(r["label"])}
    false_positives = compliant & flagged
    misses = non_compliant - flagged

    print("\n=== Result ===")
    print(f"resources: {sorted(r['label'] for r in resources)}")
    print(f"flagged:   {sorted(flagged)}")
    if false_positives:
        print(f"FAIL: compliant wrongly flagged: {sorted(false_positives)}")
    if misses:
        print(f"FAIL: non-compliant not flagged: {sorted(misses)}")
    ok = (not false_positives) and (not misses)
    print("PASS" if ok else "FAIL")
    sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
