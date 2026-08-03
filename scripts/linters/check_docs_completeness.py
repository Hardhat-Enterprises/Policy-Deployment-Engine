#!/usr/bin/env python3
"""
Docs completeness check (pre-commit hook).

The main linter (``linter.py``) accepts the ``"true/false"`` placeholder for
``security_impact`` so that freshly generated docs are not blocked. This stricter
check enforces that a docs JSON is actually *filled in* before it is committed:

  1. Every leaf argument's ``security_impact`` is a real JSON boolean
     (``true``/``false``) — never the ``"true/false"`` placeholder, a string, or
     any other type.
  2. Every leaf argument has a non-empty ``rationale`` string.

Block arguments (``type: "block"``) carry neither field and are skipped.

Usage (pre-commit passes the changed docs JSON files as arguments):

    python scripts/linters/check_docs_completeness.py docs/gcp/<Service>/<res>.json ...

With no file arguments it is a no-op (exit 0). Exit code is 1 if any problem is
found, else 0; a file that cannot be parsed as JSON is exit 1.
"""
import json
import sys


def check_file(path):
    """Return a list of human-readable error strings for one docs JSON file."""
    errors = []
    try:
        with open(path, encoding="utf-8") as fh:
            data = json.load(fh)
    except FileNotFoundError:
        # Staged deletion or moved file — nothing to check.
        return errors
    except (json.JSONDecodeError, OSError) as e:
        return [f"{path}: could not read as JSON ({e})"]

    arguments = data.get("arguments")
    if not isinstance(arguments, dict):
        return [f"{path}: missing or invalid 'arguments' object"]

    for name, spec in arguments.items():
        if not isinstance(spec, dict):
            errors.append(f"{path}: argument '{name}' is not an object")
            continue
        # Block headers have no security_impact / rationale — skip them.
        if spec.get("type") == "block":
            continue

        impact = spec.get("security_impact")
        if not isinstance(impact, bool):
            shown = json.dumps(impact) if impact is not None else "missing"
            errors.append(
                f"{path}: argument '{name}' has security_impact = {shown}; "
                f"it must be a boolean (true or false), not the 'true/false' placeholder"
            )

        rationale = spec.get("rationale")
        if not isinstance(rationale, str) or not rationale.strip():
            errors.append(
                f"{path}: argument '{name}' has an empty or missing rationale"
            )

    return errors


def main(argv=None):
    paths = sys.argv[1:] if argv is None else argv
    if not paths:
        return 0

    all_errors = []
    for path in paths:
        all_errors.extend(check_file(path))

    if all_errors:
        print("[FAIL] docs completeness check:\n")
        for e in all_errors:
            print(f"  [ERROR] {e}")
        print("\nFill in security_impact (a real true/false - boolean) and a rationale for "
              "every argument before committing.")
        return 1

    print("[OK] docs completeness check passed.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
