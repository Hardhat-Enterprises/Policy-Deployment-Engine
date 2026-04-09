"""
Report generator for Terraform resource change documentation.

This module provides functionality to generate human-readable markdown reports
documenting changes between different versions of Terraform resources.
"""

from pathlib import Path
from typing import List
from scripts.docgen_v2.lib.models import ChangeReport
from scripts.docgen_v2.lib.errors import FilesystemError


class ReportGenerator:
    """
    Generates markdown reports documenting changes between resource versions.
    
    This class creates human-readable change reports in markdown format, including
    both individual resource reports and summary reports for batch operations.
    
    Reports are organized by version comparison (e.g., 5.0.0-to-5.1.0) and include
    details about added, removed, and modified arguments.
    """
    
    def generate_resource_report(self, change_report: ChangeReport) -> str:
        """
        Generate a markdown report for a single resource's changes.
        
        Creates a detailed markdown document showing all changes to a resource
        between two versions, including added arguments, removed arguments,
        and modifications to existing arguments.
        
        Args:
            change_report: ChangeReport containing the detected changes
        
        Returns:
            str: Markdown-formatted report content
        
        Example:
            >>> report = ChangeReport(
            ...     resource_name="aws_s3_bucket",
            ...     old_version="5.0.0",
            ...     new_version="5.1.0",
            ...     added_arguments=["new_field"],
            ...     removed_arguments=["old_field"],
            ...     modified_arguments=[]
            ... )
            >>> generator = ReportGenerator()
            >>> markdown = generator.generate_resource_report(report)
            >>> print("# Resource:" in markdown)  # True
        """
        lines = []
        
        # Header
        lines.append(f"# Resource: {change_report.resource_name}")
        lines.append("")
        lines.append(f"**Version Comparison:** {change_report.old_version} → {change_report.new_version}")
        lines.append("")
        
        # Summary statistics
        total_changes = (
            len(change_report.added_arguments) +
            len(change_report.removed_arguments) +
            len(change_report.modified_arguments)
        )
        lines.append("## Summary")
        lines.append("")
        lines.append(f"- **Total Changes:** {total_changes}")
        lines.append(f"- **Added Arguments:** {len(change_report.added_arguments)}")
        lines.append(f"- **Removed Arguments:** {len(change_report.removed_arguments)}")
        lines.append(f"- **Modified Arguments:** {len(change_report.modified_arguments)}")
        lines.append("")
        
        # Added arguments section
        if change_report.added_arguments:
            lines.append("## Added Arguments")
            lines.append("")
            for arg_path in sorted(change_report.added_arguments):
                lines.append(f"- `{arg_path}`")
            lines.append("")
        
        # Removed arguments section
        if change_report.removed_arguments:
            lines.append("## Removed Arguments")
            lines.append("")
            for arg_path in sorted(change_report.removed_arguments):
                lines.append(f"- `{arg_path}`")
            lines.append("")
        
        # Modified arguments section
        if change_report.modified_arguments:
            lines.append("## Modified Arguments")
            lines.append("")
            
            # Group modifications by argument path
            modifications_by_arg = {}
            for change in change_report.modified_arguments:
                if change.argument_path not in modifications_by_arg:
                    modifications_by_arg[change.argument_path] = []
                modifications_by_arg[change.argument_path].append(change)
            
            # Output each argument's modifications
            for arg_path in sorted(modifications_by_arg.keys()):
                lines.append(f"### `{arg_path}`")
                lines.append("")
                
                for change in modifications_by_arg[arg_path]:
                    lines.append(f"- **{change.field}:**")
                    lines.append(f"  - Old: `{change.old_value}`")
                    lines.append(f"  - New: `{change.new_value}`")
                
                lines.append("")
        
        return "\n".join(lines)
    
    def generate_summary_report(self, all_changes: List[ChangeReport]) -> str:
        """
        Generate a summary report listing all changes in a batch run.
        
        Creates a markdown document summarizing all resource changes detected
        during a batch processing run, providing an overview of which resources
        changed and the extent of changes.
        
        Args:
            all_changes: List of ChangeReport objects for all processed resources
        
        Returns:
            str: Markdown-formatted summary report content
        
        Example:
            >>> reports = [
            ...     ChangeReport("aws_s3_bucket", "5.0.0", "5.1.0", ["field1"], [], []),
            ...     ChangeReport("aws_lambda_function", "5.0.0", "5.1.0", [], ["field2"], [])
            ... ]
            >>> generator = ReportGenerator()
            >>> summary = generator.generate_summary_report(reports)
            >>> print("# Change Summary" in summary)  # True
        """
        lines = []
        
        # Filter to only reports with actual changes
        changed_reports = [r for r in all_changes if r.has_changes()]
        
        # Determine version range (assume all reports have same versions)
        if changed_reports:
            old_version = changed_reports[0].old_version
            new_version = changed_reports[0].new_version
        else:
            old_version = "unknown"
            new_version = "unknown"
        
        # Header
        lines.append("# Change Summary")
        lines.append("")
        lines.append(f"**Version Comparison:** {old_version} → {new_version}")
        lines.append("")
        
        # Overall statistics
        total_resources_changed = len(changed_reports)
        total_added = sum(len(r.added_arguments) for r in changed_reports)
        total_removed = sum(len(r.removed_arguments) for r in changed_reports)
        total_modified = sum(len(r.modified_arguments) for r in changed_reports)
        
        lines.append("## Overall Statistics")
        lines.append("")
        lines.append(f"- **Resources Changed:** {total_resources_changed}")
        lines.append(f"- **Total Arguments Added:** {total_added}")
        lines.append(f"- **Total Arguments Removed:** {total_removed}")
        lines.append(f"- **Total Arguments Modified:** {total_modified}")
        lines.append("")
        
        # List of changed resources
        if changed_reports:
            lines.append("## Changed Resources")
            lines.append("")
            
            for report in sorted(changed_reports, key=lambda r: r.resource_name):
                lines.append(f"### {report.resource_name}")
                lines.append("")
                lines.append(f"- Added: {len(report.added_arguments)}")
                lines.append(f"- Removed: {len(report.removed_arguments)}")
                lines.append(f"- Modified: {len(report.modified_arguments)}")
                lines.append("")
        else:
            lines.append("## Changed Resources")
            lines.append("")
            lines.append("No resources were changed in this version update.")
            lines.append("")
        
        return "\n".join(lines)
    
    def write_report(self, path: Path, content: str) -> None:
        """
        Write a markdown report to the filesystem.
        
        Creates the necessary directory structure and writes the report content
        to the specified file path. Creates parent directories if they don't exist.
        
        Args:
            path: Path where the report should be written
            content: Markdown content to write
        
        Raises:
            OSError: If the file cannot be written
        
        Example:
            >>> from pathlib import Path
            >>> import tempfile
            >>> generator = ReportGenerator()
            >>> with tempfile.TemporaryDirectory() as tmpdir:
            ...     report_path = Path(tmpdir) / "report.md"
            ...     generator.write_report(report_path, "# Test Report")
            ...     print(report_path.exists())  # True
        """
        try:
            # Create parent directories if they don't exist
            path.parent.mkdir(parents=True, exist_ok=True)
            
            # Write the report content
            path.write_text(content, encoding='utf-8')
            
        except PermissionError as e:
            raise FilesystemError(
                "Permission denied writing report file",
                file_path=str(path),
                operation="write change report"
            ) from e
            
        except OSError as e:
            raise FilesystemError(
                f"Failed to write report file: {str(e)}",
                file_path=str(path),
                operation="write change report"
            ) from e
