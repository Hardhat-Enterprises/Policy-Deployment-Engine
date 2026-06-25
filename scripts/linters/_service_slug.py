"""Shared helpers for the Service/<platform>/<service_slug>/<resource> branch scheme.

A docs service folder name (e.g. "Cloud Run (v2 API)") contains spaces/parens that
are illegal in git branch names, so branches encode it as an underscore *slug*
("cloud_run_v2_api"). The slug is unique across the docs/<platform>/ folders, so it
maps back to exactly one folder. Resource type names are already git-ref-safe and
are used verbatim.
"""
import os
import re


def service_slug(folder_name: str) -> str:
    """Underscore slug of a docs service folder name (lowercase, non-alphanumerics
    collapsed to single underscores, trimmed)."""
    return re.sub(r"_+", "_", re.sub(r"[^a-z0-9]+", "_", folder_name.lower())).strip("_")


def slug_to_folder(docs_root: str, platform: str) -> dict:
    """Return ``{service_slug: docs_folder_name}`` for ``docs/<platform>/``.

    Raises ``ValueError`` if two folders collapse to the same slug — the slug
    must map back to exactly one folder for the branch scheme to be unambiguous.
    """
    base = os.path.join(docs_root, platform)
    out = {}
    if os.path.isdir(base):
        for name in sorted(os.listdir(base)):
            if os.path.isdir(os.path.join(base, name)):
                slug = service_slug(name)
                if not slug:
                    raise ValueError(
                        f"Service folder {name!r} in docs/{platform}/ slugs to an empty "
                        "string (all non-alphanumeric); rename it to something git-ref-safe."
                    )
                if slug in out:
                    raise ValueError(
                        f"Ambiguous service slug '{slug}' in docs/{platform}/: "
                        f"both {out[slug]!r} and {name!r} map to it. Rename one folder."
                    )
                out[slug] = name
    return out


def resource_doc_path(docs_root: str, platform: str, folder: str, resource_type: str) -> str:
    """Path to ``docs/<platform>/<folder>/<resource_type>.json`` (may not exist)."""
    return os.path.join(docs_root, platform, folder, f"{resource_type}.json")
