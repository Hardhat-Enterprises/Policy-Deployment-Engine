import argparse
import json
import sys
from pathlib import Path


REPO_ROOT = Path(__file__).resolve().parents[2]

sys.path.insert(0, str(REPO_ROOT))

from scripts.linters._service_slug import service_slug


DOCS_DIR = REPO_ROOT / "docs"
INPUTS_DIR = REPO_ROOT / "inputs"
POLICIES_DIR = REPO_ROOT / "policies"
TEMPLATES_DIR = REPO_ROOT / "templates"

TF_TEMPLATE_FILES = [
    "compliant.tf",
    "nonCompliant.tf",
    "config.tf",
]


def parse_target(target):
    parts = target.split("/", 2)

    if len(parts) != 3:
        raise ValueError(
            "Target must be in the format: cloud/service/resource"
        )

    return parts


def load_resource_document(cloud, service, resource):
    resource_file = DOCS_DIR / cloud / service / f"{resource}.json"

    if not resource_file.exists():
        raise FileNotFoundError(
            f"Resource documentation not found:\n{resource_file}"
        )

    with resource_file.open("r", encoding="utf-8") as file:
        return json.load(file)


def find_security_impact_arguments(document):
    arguments = document.get("arguments", {})

    return [
        argument_name
        for argument_name, argument_data in arguments.items()
        if argument_data.get("security_impact") is True
    ]


def get_required_paths(cloud, service, resource, argument):
    input_dir = (
        INPUTS_DIR
        / cloud
        / service
        / resource
        / argument
    )

    policy_dir = (
        POLICIES_DIR
        / cloud
        / service
        / resource
    )

    return {
        "compliant.tf": input_dir / "compliant.tf",
        "nonCompliant.tf": input_dir / "nonCompliant.tf",
        "config.tf": input_dir / "config.tf",
        "policy.rego": policy_dir / f"{argument}.rego",
        "_vars.rego": policy_dir / "_vars.rego",
    }


def check_argument_files(cloud, service, resource, argument):
    paths = get_required_paths(
        cloud,
        service,
        resource,
        argument,
    )

    return {
        name: path.exists()
        for name, path in paths.items()
    }


def render_template(
    template,
    destination,
    service=None,
    resource=None,
    policy_name=None,
):
    """
    Create a file from a PDE template without overwriting existing work.

    Structural placeholders are replaced automatically.
    Security policy logic remains for the contributor to complete.
    """
    if destination.exists():
        return False

    if not template.exists():
        raise FileNotFoundError(
            f"Template not found: {template}"
        )

    content = template.read_text(
        encoding="utf-8"
    )

    if service:
        rego_service = service_slug(service)

        content = content.replace(
            "<service>",
            rego_service,
        )

    if resource:
        content = content.replace(
            "<resource_type>",
            resource,
        )

        content = content.replace(
            "RESOURCE_TYPE",
            resource,
        )

        content = content.replace(
            '"resource_type":  ""',
            f'"resource_type": "{resource}"',
        )

    if policy_name:
        content = content.replace(
            "<policy_name>",
            policy_name,
        )

    destination.parent.mkdir(
        parents=True,
        exist_ok=True,
    )

    destination.write_text(
        content,
        encoding="utf-8",
    )

    return True


def generate_argument_skeleton(
    cloud,
    service,
    resource,
    argument,
):
    template_dir = TEMPLATES_DIR / cloud

    if not template_dir.exists():
        raise FileNotFoundError(
            f"No template directory found for cloud: {cloud}\n"
            f"Expected: {template_dir}"
        )

    paths = get_required_paths(
        cloud,
        service,
        resource,
        argument,
    )

    created = []
    skipped = []

    # Terraform fixture files
    for file_name in TF_TEMPLATE_FILES:
        destination = paths[file_name]
        template = template_dir / file_name

        was_created = render_template(
            template,
            destination,
            resource=resource,
        )

        if was_created:
            created.append(destination)
        else:
            skipped.append(destination)

    # Rego policy file
    policy_template = (
        template_dir / "policy.rego"
    )

    policy_created = render_template(
        policy_template,
        paths["policy.rego"],
        service=service,
        resource=resource,
        policy_name=argument,
    )

    if policy_created:
        created.append(
            paths["policy.rego"]
        )
    else:
        skipped.append(
            paths["policy.rego"]
        )

    # _vars.rego should exist once per resource
    vars_template = (
        template_dir / "_vars.rego"
    )

    vars_created = render_template(
        vars_template,
        paths["_vars.rego"],
        service=service,
        resource=resource,
    )

    if vars_created:
        created.append(
            paths["_vars.rego"]
        )
    else:
        skipped.append(
            paths["_vars.rego"]
        )

    return created, skipped


def print_resource_header(
    cloud,
    service,
    resource,
    security_arguments,
):
    print()
    print(
        "PDE Security Impact Skeleton Generator"
    )
    print("=" * 50)

    print(f"Cloud    : {cloud}")
    print(f"Service  : {service}")
    print(f"Resource : {resource}")

    print()

    print(
        "Security-impacting leaf arguments: "
        f"{len(security_arguments)}"
    )

    print("=" * 50)


def print_argument_status(
    cloud,
    service,
    resource,
    argument,
):
    print()
    print(argument)
    print("-" * len(argument))

    status = check_argument_files(
        cloud,
        service,
        resource,
        argument,
    )

    for file_name, exists in status.items():
        symbol = "✓" if exists else "✗"

        print(
            f"  [{symbol}] {file_name}"
        )


def main():
    parser = argparse.ArgumentParser(
        description=(
            "Generate PDE skeleton files for "
            "security-impacting leaf arguments."
        )
    )

    parser.add_argument(
        "target",
        help=(
            "Resource target in the format "
            "'cloud/service/resource'"
        ),
    )

    parser.add_argument(
        "--generate",
        action="store_true",
        help=(
            "Create missing skeleton files. "
            "Existing files are never overwritten."
        ),
    )

    args = parser.parse_args()

    try:
        cloud, service, resource = parse_target(
            args.target
        )

        document = load_resource_document(
            cloud,
            service,
            resource,
        )

        security_arguments = (
            find_security_impact_arguments(
                document
            )
        )

        print_resource_header(
            cloud,
            service,
            resource,
            security_arguments,
        )

        if not security_arguments:
            print(
                "No security-impacting leaf "
                "arguments found."
            )
            return

        total_created = 0

        for argument in security_arguments:
            print_argument_status(
                cloud,
                service,
                resource,
                argument,
            )

            if args.generate:
                created, skipped = (
                    generate_argument_skeleton(
                        cloud,
                        service,
                        resource,
                        argument,
                    )
                )

                total_created += len(created)

                for path in created:
                    relative_path = (
                        path.relative_to(
                            REPO_ROOT
                        )
                    )

                    print(
                        f"      CREATED: "
                        f"{relative_path}"
                    )

        print()
        print("=" * 50)

        if args.generate:
            print(
                f"Created {total_created} "
                "missing file(s)."
            )

            if total_created == 0:
                print(
                    "Nothing to generate. "
                    "Resource is already complete."
                )

            else:
                print()
                print(
                    "Skeleton generation complete."
                )
                print(
                    "Existing files were not "
                    "overwritten."
                )
                print()
                print(
                    "Next steps:"
                )
                print(
                    "  1. Complete the Terraform fixtures."
                )
                print(
                    "  2. Complete friendly_resource_name "
                    "and resource_value_name in _vars.rego."
                )
                print(
                    "  3. Implement the security policy logic."
                )
                print(
                    "  4. Run the PDE auto-test workflow."
                )

        else:
            print(
                "Inspection only. "
                "No files were created."
            )

            print(
                "Use --generate to create "
                "missing skeleton files."
            )

    except (
        ValueError,
        FileNotFoundError,
        json.JSONDecodeError,
    ) as error:
        print()
        print(
            f"Error: {error}"
        )


if __name__ == "__main__":
    main()