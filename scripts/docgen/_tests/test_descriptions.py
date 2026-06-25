"""Tests for markdown gating + description fallback."""

import sys
from pathlib import Path

project_root = Path(__file__).parent.parent.parent
sys.path.insert(0, str(project_root))

from scripts.docgen.lib.descriptions import (
    MarkdownProcessor,
    extract_arg_descriptions,
    extract_documented_names,
    extract_inherited_resources,
)

IAM_MD = """
## Argument Reference

The following arguments are supported:

* `bucket` - (Required) Used to find the parent resource to bind the IAM policy to

* `member/members` - (Required) Identities that will be granted the privilege in `role`.
  Each entry can have one of the following values:
  * **allUsers**: anyone on the internet.

* `role` - (Required) The role that should be applied. Only one
    binding can be used per role.
"""

# A doc where `pool` is documented but has no description, plus a nested block.
POOL_MD = """
## Argument Reference

* `name` - (Required) The cluster name.

The `address_pools` block supports:

* `pool` - (Optional)

* `addresses` - (Required) The addresses that are part of this pool.
"""


def test_extract_strips_flags_and_joins_continuation():
    d = extract_arg_descriptions(IAM_MD)
    assert d["bucket"] == "Used to find the parent resource to bind the IAM policy to"
    assert d["role"] == "The role that should be applied. Only one binding can be used per role."


def test_slash_names_split_in_descriptions_and_names():
    d = extract_arg_descriptions(IAM_MD)
    assert d["member"] == d["members"]
    names = extract_documented_names(IAM_MD)
    assert {"bucket", "member", "members", "role"} <= names
    assert "condition" not in names  # not documented anywhere


def test_documented_names_includes_block_intro():
    names = extract_documented_names(POOL_MD)
    assert {"name", "address_pools", "pool", "addresses"} <= names


def test_ambiguous_name_dropped():
    md = "* `x` - First meaning\n\n* `x` - Different meaning\n"
    assert "x" not in extract_arg_descriptions(md)


def _leaf(desc="", req=False, type_="string"):
    return {"description": desc, "required": req, "type": type_,
            "security_impact": "true/false", "rationale": ""}


def _block(desc=""):
    return {"type": "block", "description": desc, "required": False}


def _processor(md_text, tmp_path):
    md = tmp_path / "r.html.markdown"
    md.write_text(md_text, encoding="utf-8")

    class FakeRM:
        def get_resource_markdown_path(self, repo_path, resource_name):
            return md

        def read_resource_markdown(self, repo_path, resource_name):
            return self.get_resource_markdown_path(repo_path, resource_name).read_text(encoding="utf-8")

    return MarkdownProcessor(FakeRM(), tmp_path)


def test_undocumented_block_is_omitted(tmp_path):
    proc = _processor(IAM_MD, tmp_path)
    args = {
        "bucket": _leaf(),
        "members": _leaf(type_="set(string)"),
        "role": _leaf(),
        "condition": _block(),
        "condition.expression": _leaf(),
        "condition.title": _leaf(),
    }
    out, stats = proc.process("google_x_iam_binding", args)
    assert set(out.keys()) == {"bucket", "members", "role"}   # condition.* gone
    assert stats["omitted"] == 3


def test_iam_descriptions_filled_from_markdown(tmp_path):
    proc = _processor(IAM_MD, tmp_path)
    args = {"bucket": _leaf(), "members": _leaf(type_="set(string)"), "role": _leaf()}
    out, stats = proc.process("google_x_iam_binding", args)
    assert out["bucket"]["description"].startswith("Used to find")
    assert out["members"]["description"].startswith("Identities")
    assert stats["na"] == 0


def test_documented_without_description_gets_na(tmp_path):
    proc = _processor(POOL_MD, tmp_path)
    args = {
        "name": _leaf(desc="The cluster name."),
        "address_pools": _block(),
        "address_pools.pool": _leaf(),          # documented, no description -> N/A
        "address_pools.addresses": _leaf(type_="list(string)"),
        "address_pools.undocumented": _leaf(),  # not in markdown -> omitted
    }
    out, stats = proc.process("google_x", args)
    assert out["address_pools.pool"]["description"] == "N/A"
    assert "address_pools.undocumented" not in out
    assert "address_pools" in out               # block kept (has documented children)
    assert stats["na"] == 1


def test_block_kept_only_for_documented_children(tmp_path):
    proc = _processor(POOL_MD, tmp_path)
    args = {
        "name": _leaf(desc="x"),
        "ghost": _block(),                # name not documented
        "ghost.child": _leaf(),           # name not documented -> omitted -> block dropped
    }
    out, _ = proc.process("google_x", args)
    assert "ghost" not in out and "ghost.child" not in out


# A block documented only by its own bullet; its sub-fields are mentioned inline
# (backticked) inside that bullet rather than as their own `* `name`` bullets — the
# shape that produced childless blocks (e.g. google_bigtable_table.automated_backup_policy).
INLINE_BLOCK_MD = """
## Argument Reference

* `name` - (Required) The table name.

* `automated_backup_policy` - (Optional) Defines a policy specified by `retention_period`
  and `frequency`. The policy also accepts an optional `locations` list.
"""


def test_childless_documented_block_restores_schema_subtree(tmp_path):
    proc = _processor(INLINE_BLOCK_MD, tmp_path)
    args = {
        "name": _leaf(desc="The table name."),
        "automated_backup_policy": _block(desc="Defines a policy."),
        "automated_backup_policy.frequency": _leaf(desc="How often."),
        "automated_backup_policy.locations": _leaf(type_="list(string)"),
        "automated_backup_policy.retention_period": _leaf(desc="How long."),
    }
    out, _ = proc.process("google_bigtable_table", args)
    # The block is documented but none of its children are bullet-documented; the schema
    # subtree is restored rather than emitting a childless block.
    assert "automated_backup_policy" in out
    assert {
        "automated_backup_policy.frequency",
        "automated_backup_policy.locations",
        "automated_backup_policy.retention_period",
    } <= set(out)


def test_genuinely_empty_block_stays_childless(tmp_path):
    # A documented presence-marker block with no schema children must not gain phantom args.
    md = "## Argument Reference\n\n* `name` - (Required) x\n\n* `automatic_update_policy` - (Optional) Enable auto-update.\n"
    proc = _processor(md, tmp_path)
    args = {"name": _leaf(desc="x"), "automatic_update_policy": _block()}
    out, _ = proc.process("google_x", args)
    assert "automatic_update_policy" in out
    assert not any(k.startswith("automatic_update_policy.") for k in out)


def test_partial_block_not_expanded(tmp_path):
    # When at least one child IS bullet-documented, the block is not childless, so gating
    # is respected as-is — undocumented siblings stay dropped (no subtree restoration).
    proc = _processor(POOL_MD, tmp_path)
    args = {
        "name": _leaf(desc="The cluster name."),
        "address_pools": _block(),
        "address_pools.addresses": _leaf(type_="list(string)"),  # documented
        "address_pools.undocumented": _leaf(),                   # not documented
    }
    out, _ = proc.process("google_x", args)
    assert "address_pools.addresses" in out
    assert "address_pools.undocumented" not in out


def test_childless_repair_recurses_into_nested_blocks(tmp_path):
    # A documented block whose only children are themselves nested blocks/leaves none of
    # which are bullet-documented: the whole subtree is restored, not just direct leaves.
    md = "## Argument Reference\n\n* `master_auth` - (Optional) Authentication config.\n"
    proc = _processor(md, tmp_path)
    args = {
        "master_auth": _block(),
        "master_auth.client_certificate_config": _block(),
        "master_auth.client_certificate_config.issue_client_certificate": _leaf(),
    }
    out, _ = proc.process("google_container_cluster", args)
    assert set(out) == set(args)


def test_extract_inherited_resources():
    md = "In addition to these, all arguments from `google_compute_instance` are supported"
    assert extract_inherited_resources(md) == {"google_compute_instance"}
    # a plain cross-reference link is NOT inheritance
    assert extract_inherited_resources("See also `google_compute_instance` for details.") == set()


def test_extract_inherited_resources_block_link():
    md = ("* `node_config` - (Optional) Parameters used in creating the node pool. See "
          "[google_container_cluster](container_cluster.html#nested_node_config) for schema.")
    assert extract_inherited_resources(md) == {"google_container_cluster"}
    # a link without a schema/fields/structure hint is just a cross-reference, not inheritance
    assert extract_inherited_resources("For more info see [google_project](project.html).") == set()


def test_inheritance_merges_base_doc(tmp_path):
    # base resource documents can_ip_forward; the *_from_template doc inherits by reference
    base = tmp_path / "compute_instance.html.markdown"
    base.write_text("## Argument Reference\n\n* `can_ip_forward` - (Optional) Whether to allow forwarding.\n", encoding="utf-8")
    derived = tmp_path / "compute_instance_from_template.html.markdown"
    derived.write_text(
        "## Argument Reference\n\n* `source_instance_template` - (Required) The template.\n\n"
        "In addition to these, all arguments from `google_compute_instance` are supported\n",
        encoding="utf-8",
    )

    class FakeRM:
        def get_resource_markdown_path(self, repo_path, resource_name):
            return base if resource_name == "google_compute_instance" else derived

        def read_resource_markdown(self, repo_path, resource_name):
            return self.get_resource_markdown_path(repo_path, resource_name).read_text(encoding="utf-8")

    proc = MarkdownProcessor(FakeRM(), tmp_path)
    args = {
        "source_instance_template": _leaf(),
        "can_ip_forward": _leaf(),           # only documented on the base resource
        "undocumented_field": _leaf(),       # nowhere -> omitted
    }
    out, _ = proc.process("google_compute_instance_from_template", args)
    assert "can_ip_forward" in out           # inherited from base doc
    assert out["can_ip_forward"]["description"] == "Whether to allow forwarding."
    assert "source_instance_template" in out
    assert "undocumented_field" not in out


def test_fail_open_when_no_markdown(tmp_path):
    class FakeRM:
        def get_resource_markdown_path(self, repo_path, resource_name):
            raise FileNotFoundError("no doc")

    proc = MarkdownProcessor(FakeRM(), tmp_path)
    args = {"a": _leaf(desc="keep me")}
    out, stats = proc.process("google_x", args)
    assert out == args and stats["omitted"] == 0
