#!/usr/bin/env python3
"""Extract content-bearing attribute values from a Terraform plan JSON.

Walks ``planned_values.root_module.resources[].values`` and collects every
string value whose attribute key matches a registered content type
(see registry.json). Handles single blocks and list-of-blocks (arrays of
objects) uniformly, so ``after_agent_callbacks[0].python_code`` and
``python_function.python_code`` are both found.

Output: a JSON array with one entry per code snippet:
    {
      "resource_type": "google_ces_agent",
      "resource_name": "compliant_example_1",
      "attribute_path": ["after_agent_callbacks", 0, "python_code"],
      "language": "python",
      "code": "import hashlib\n..."
    }
"""
import argparse
import json
from pathlib import Path


def load_registry(registry_path):
    with open(registry_path, encoding="utf-8") as fh:
        return json.load(fh)


def attribute_key_map(registry):
    """Return {attribute_key: language} for every registered content type."""
    mapping = {}
    for ct in registry.get("content_types", []):
        for key in ct.get("attribute_keys", []):
            mapping[key] = ct.get("name", key)
    return mapping


def walk(obj, path, key_map, resource_type, resource_name, out):
    """Recursively find attribute keys matching a registered content type."""
    if isinstance(obj, dict):
        for key, value in obj.items():
            child_path = path + [key]
            if key in key_map and isinstance(value, str) and value.strip():
                out.append({
                    "resource_type": resource_type,
                    "resource_name": resource_name,
                    "attribute_path": child_path,
                    "language": key_map[key],
                    "code": value,
                })
            else:
                walk(value, child_path, key_map, resource_type, resource_name, out)
    elif isinstance(obj, list):
        for idx, item in enumerate(obj):
            walk(item, path + [idx], key_map, resource_type, resource_name, out)


def extract(plan, key_map):
    """Return all extracted code snippets for a parsed plan JSON."""
    out = []
    root = plan.get("planned_values", {}).get("root_module", {})
    for res in root.get("resources", []):
        walk(res.get("values", {}), [], key_map, res.get("type"), res.get("name"), out)
    return out


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("plan_json", help="terraform show -json plan output")
    parser.add_argument("--registry", default=str(Path(__file__).parent / "registry.json"))
    parser.add_argument("--output", "-o", help="write JSON array here (default: stdout)")
    args = parser.parse_args(argv)

    with open(args.plan_json, encoding="utf-8") as fh:
        plan = json.load(fh)
    results = extract(plan, attribute_key_map(load_registry(args.registry)))

    text = json.dumps(results, indent=2)
    if args.output:
        Path(args.output).write_text(text + "\n", encoding="utf-8")
    else:
        print(text)


if __name__ == "__main__":
    main()
