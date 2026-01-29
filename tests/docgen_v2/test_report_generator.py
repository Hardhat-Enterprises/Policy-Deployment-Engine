"""
Property-based tests for ReportGenerator.

These tests verify that change reports are generated correctly and completely
using property-based testing with Hypothesis.
"""

import tempfile
from pathlib import Path
from hypothesis import given, strategies as st
from scripts.docgen_v2.lib.models import ArgumentChange, ChangeReport
from scripts.docgen_v2.lib.report_generator import ReportGenerator


# Strategies for generating test data

@st.composite
def argument_change_strategy(draw):
    """
    Generate random ArgumentChange objects.
    
    Args:
        draw: Hypothesis draw function
    
    Returns:
        ArgumentChange: Randomly generated argument change
    """
    argument_path = draw(st.text(min_size=1, max_size=50, alphabet=st.characters(blacklist_categories=('Cc', 'Cs'))))
    field = draw(st.sampled_from(['description', 'required', 'deprecated']))
    
    # Generate appropriate old/new values based on field type
    if field == 'description':
        old_value = draw(st.text(min_size=1, max_size=100, alphabet=st.characters(blacklist_categories=('Cc', 'Cs'))))
        new_value = draw(st.text(min_size=1, max_size=100, alphabet=st.characters(blacklist_categories=('Cc', 'Cs'))))
    elif field == 'required':
        old_value = draw(st.one_of(st.booleans(), st.none()))
        new_value = draw(st.one_of(st.booleans(), st.none()))
    else:  # deprecated
        old_value = draw(st.booleans())
        new_value = draw(st.booleans())
    
    return ArgumentChange(
        argument_path=argument_path,
        field=field,
        old_value=old_value,
        new_value=new_value
    )


@st.composite
def change_report_strategy(draw, resource_name=None, old_version=None, new_version=None):
    """
    Generate random ChangeReport objects.
    
    Args:
        draw: Hypothesis draw function
        resource_name: Optional fixed resource name
        old_version: Optional fixed old version
        new_version: Optional fixed new version
    
    Returns:
        ChangeReport: Randomly generated change report
    """
    if resource_name is None:
        resource_name = draw(st.text(min_size=1, max_size=50, alphabet=st.characters(blacklist_categories=('Cc', 'Cs'))))
    
    if old_version is None:
        old_version = draw(st.text(min_size=1, max_size=20, alphabet=st.characters(blacklist_categories=('Cc', 'Cs'))))
    
    if new_version is None:
        new_version = draw(st.text(min_size=1, max_size=20, alphabet=st.characters(blacklist_categories=('Cc', 'Cs'))))
    
    # Generate added arguments (exclude control characters)
    num_added = draw(st.integers(min_value=0, max_value=5))
    added_arguments = [
        draw(st.text(min_size=1, max_size=50, alphabet=st.characters(blacklist_categories=('Cc', 'Cs'))))
        for _ in range(num_added)
    ]
    
    # Generate removed arguments (exclude control characters)
    num_removed = draw(st.integers(min_value=0, max_value=5))
    removed_arguments = [
        draw(st.text(min_size=1, max_size=50, alphabet=st.characters(blacklist_categories=('Cc', 'Cs'))))
        for _ in range(num_removed)
    ]
    
    # Generate modified arguments
    num_modified = draw(st.integers(min_value=0, max_value=5))
    modified_arguments = [
        draw(argument_change_strategy())
        for _ in range(num_modified)
    ]
    
    return ChangeReport(
        resource_name=resource_name,
        old_version=old_version,
        new_version=new_version,
        added_arguments=added_arguments,
        removed_arguments=removed_arguments,
        modified_arguments=modified_arguments
    )


# Property-based tests

@given(st.lists(change_report_strategy(), min_size=1, max_size=10))
def test_property_34_summary_reports_list_all_changes(change_reports):
    """
    Feature: terraform-json-generator, Property 34: Summary reports list all changes
    
    For any batch processing run with updates, the summary report should list
    all resources that were changed.
    
    Validates: Requirements 9.8
    """
    generator = ReportGenerator()
    
    # Generate summary report
    summary = generator.generate_summary_report(change_reports)
    
    # Verify summary is generated
    assert summary is not None
    assert len(summary) > 0
    
    # Verify summary contains header
    assert "# Change Summary" in summary
    
    # Filter to only reports with actual changes
    changed_reports = [r for r in change_reports if r.has_changes()]
    
    # Verify all changed resources are listed in the summary
    for report in changed_reports:
        assert report.resource_name in summary, \
            f"Changed resource {report.resource_name} should be listed in summary"
    
    # Verify overall statistics are present
    assert "Overall Statistics" in summary
    assert "Resources Changed:" in summary
    
    # Verify the count of changed resources is correct
    expected_count = len(changed_reports)
    assert f"Resources Changed:** {expected_count}" in summary, \
        f"Summary should show {expected_count} changed resources"
    
    # Verify total counts are present
    total_added = sum(len(r.added_arguments) for r in changed_reports)
    total_removed = sum(len(r.removed_arguments) for r in changed_reports)
    total_modified = sum(len(r.modified_arguments) for r in changed_reports)
    
    assert f"Total Arguments Added:** {total_added}" in summary
    assert f"Total Arguments Removed:** {total_removed}" in summary
    assert f"Total Arguments Modified:** {total_modified}" in summary


@given(change_report_strategy())
def test_resource_report_includes_all_sections(change_report):
    """
    Test that resource reports include all required sections.
    
    Verifies that individual resource reports contain the resource name,
    version information, and all change categories.
    """
    generator = ReportGenerator()
    
    # Generate resource report
    report = generator.generate_resource_report(change_report)
    
    # Verify report is generated
    assert report is not None
    assert len(report) > 0
    
    # Verify header includes resource name
    assert f"# Resource: {change_report.resource_name}" in report
    
    # Verify version information
    assert change_report.old_version in report
    assert change_report.new_version in report
    
    # Verify summary section exists
    assert "## Summary" in report
    
    # Verify added arguments section if there are additions
    if change_report.added_arguments:
        assert "## Added Arguments" in report
        for arg in change_report.added_arguments:
            assert arg in report
    
    # Verify removed arguments section if there are removals
    if change_report.removed_arguments:
        assert "## Removed Arguments" in report
        for arg in change_report.removed_arguments:
            assert arg in report
    
    # Verify modified arguments section if there are modifications
    if change_report.modified_arguments:
        assert "## Modified Arguments" in report
        for change in change_report.modified_arguments:
            assert change.argument_path in report


@given(st.data())
def test_write_report_creates_file(data):
    """
    Test that write_report creates files correctly.
    
    Verifies that reports are written to the filesystem with proper
    directory creation.
    """
    generator = ReportGenerator()
    
    # Generate a change report with filesystem-safe resource name
    resource_name = data.draw(st.text(
        min_size=1, 
        max_size=50, 
        alphabet=st.characters(min_codepoint=ord('a'), max_codepoint=ord('z'))
    ))
    change_report = data.draw(change_report_strategy(resource_name=resource_name))
    
    # Generate report content
    content = generator.generate_resource_report(change_report)
    
    # Write to temporary location
    with tempfile.TemporaryDirectory() as tmpdir:
        report_path = Path(tmpdir) / "changes" / "1.0.0-to-2.0.0" / f"{change_report.resource_name}.md"
        
        # Write report
        generator.write_report(report_path, content)
        
        # Verify file was created
        assert report_path.exists(), "Report file should be created"
        
        # Verify content matches
        written_content = report_path.read_text(encoding='utf-8')
        assert written_content == content, "Written content should match generated content"


def test_summary_report_with_no_changes():
    """
    Test that summary reports handle cases with no changes gracefully.
    """
    generator = ReportGenerator()
    
    # Create reports with no changes
    reports = [
        ChangeReport(
            resource_name="aws_s3_bucket",
            old_version="5.0.0",
            new_version="5.1.0",
            added_arguments=[],
            removed_arguments=[],
            modified_arguments=[]
        ),
        ChangeReport(
            resource_name="aws_lambda_function",
            old_version="5.0.0",
            new_version="5.1.0",
            added_arguments=[],
            removed_arguments=[],
            modified_arguments=[]
        )
    ]
    
    # Generate summary
    summary = generator.generate_summary_report(reports)
    
    # Verify summary indicates no changes
    assert "Resources Changed:** 0" in summary
    assert "No resources were changed" in summary


def test_resource_report_statistics_accuracy():
    """
    Test that resource report statistics are calculated correctly.
    """
    generator = ReportGenerator()
    
    # Create a report with known counts
    report = ChangeReport(
        resource_name="test_resource",
        old_version="1.0.0",
        new_version="2.0.0",
        added_arguments=["arg1", "arg2"],
        removed_arguments=["arg3"],
        modified_arguments=[
            ArgumentChange("arg4", "description", "old", "new"),
            ArgumentChange("arg5", "required", True, False)
        ]
    )
    
    # Generate report
    markdown = generator.generate_resource_report(report)
    
    # Verify statistics
    assert "Total Changes:** 5" in markdown  # 2 added + 1 removed + 2 modified
    assert "Added Arguments:** 2" in markdown
    assert "Removed Arguments:** 1" in markdown
    assert "Modified Arguments:** 2" in markdown


def test_summary_report_sorts_resources():
    """
    Test that summary reports sort resources alphabetically.
    """
    generator = ReportGenerator()
    
    # Create reports in non-alphabetical order
    reports = [
        ChangeReport("zebra_resource", "1.0.0", "2.0.0", ["field"], [], []),
        ChangeReport("alpha_resource", "1.0.0", "2.0.0", ["field"], [], []),
        ChangeReport("beta_resource", "1.0.0", "2.0.0", ["field"], [], [])
    ]
    
    # Generate summary
    summary = generator.generate_summary_report(reports)
    
    # Find positions of resource names in summary
    alpha_pos = summary.find("alpha_resource")
    beta_pos = summary.find("beta_resource")
    zebra_pos = summary.find("zebra_resource")
    
    # Verify alphabetical order
    assert alpha_pos < beta_pos < zebra_pos, \
        "Resources should be listed in alphabetical order"


def test_resource_report_groups_modifications_by_argument():
    """
    Test that resource reports group multiple modifications to the same argument.
    """
    generator = ReportGenerator()
    
    # Create a report with multiple changes to the same argument
    report = ChangeReport(
        resource_name="test_resource",
        old_version="1.0.0",
        new_version="2.0.0",
        added_arguments=[],
        removed_arguments=[],
        modified_arguments=[
            ArgumentChange("bucket", "description", "old desc", "new desc"),
            ArgumentChange("bucket", "required", True, False),
            ArgumentChange("other_arg", "deprecated", False, True)
        ]
    )
    
    # Generate report
    markdown = generator.generate_resource_report(report)
    
    # Verify both changes to "bucket" are under the same heading
    lines = markdown.split('\n')
    bucket_heading_indices = [i for i, line in enumerate(lines) if '### `bucket`' in line]
    
    # Should only have one heading for "bucket"
    assert len(bucket_heading_indices) == 1, \
        "Multiple modifications to same argument should be grouped under one heading"
    
    # Verify both modifications are present
    assert "description" in markdown
    assert "required" in markdown
