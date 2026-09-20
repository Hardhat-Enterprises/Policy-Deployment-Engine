# Feature Handover: Prevent APC Comment Clutter

## 1. Feature Overview

**Feature:** Prevent APC Comment Clutter  
**Related Issue:** [#405](https://github.com/Hardhat-Enterprises/Policy-Deployment-Engine/issues/405)  
**Contribution PR:** [#810](https://github.com/Hardhat-Enterprises/Policy-Deployment-Engine/pull/810)  
**Contributor:** Gemma A. Opeña  
**Current Status:** Implemented, tested, and submitted for review

This feature improves how the Automated Policy Check (APC) workflow presents its results on a pull request. Previously, repeated workflow runs could post multiple APC result comments, causing outdated results to accumulate in the pull request conversation.

The new implementation keeps one APC-managed comment for each pull request. The first workflow run creates the comment, while subsequent runs update the same comment with the latest `PASSED` or `FAILED` result, a link to the relevant workflow run, and an `Updates` count.

The feature identifies the APC-managed comment through a hidden marker. This allows the script to update only its own comment while leaving comments written by reviewers and other contributors unchanged.

This handover guide explains the purpose of the feature, how it works, and what future contributors should consider when maintaining or extending it.

## 2. Original Problem

The APC workflow reports policy-check results directly in the conversation of a pull request. Before this feature was introduced, each workflow run could post a new APC result comment instead of updating the result that had already been posted.

A pull request may trigger the APC workflow several times as contributors push new commits or correct their work. As a result, multiple APC comments could accumulate in the same pull request. Some comments could display older results, while newer comments showed the current status.

This behaviour created several problems:

- The pull request conversation became cluttered after repeated workflow runs.
- Reviewers had to search through multiple comments to identify the latest result.
- Outdated `PASSED` or `FAILED` results remained visible and could cause confusion.
- The history of APC updates was spread across separate comments.
- Human discussions and review feedback became harder to follow among the automated messages.

Issue [#405](https://github.com/Hardhat-Enterprises/Policy-Deployment-Engine/issues/405) proposed keeping one persistent APC comment on each pull request and updating it whenever the workflow ran again. The change needed to preserve the existing APC result information while ensuring that comments written by reviewers and other contributors were not modified.

## 3. Implemented Solution

The feature introduces create-or-update behaviour for APC pull-request comments. Instead of publishing a separate result comment after every workflow run, the APC workflow now maintains one identifiable comment and refreshes it with the latest information.

The implemented solution provides the following behaviour:

- On the first APC run, the script creates a new comment containing the current `PASSED` or `FAILED` result.
- On subsequent runs, the script locates the existing APC-managed comment and updates it instead of creating another one.
- The updated comment displays the latest APC result and includes a link to the relevant GitHub Actions workflow run.
- An `Updates` count records how many times the original APC comment has been refreshed. A newly created comment begins at `Updates: 0`.
- A hidden marker is embedded in the APC comment so the script can reliably identify the comment it manages.
- Comments that do not contain the marker, including comments written by reviewers and other contributors, are left unchanged.
- The existing APC evaluation and pull-request labelling behaviour remains separate from the comment-management logic.

This solution keeps the latest APC result visible in one location, reduces repeated automated messages, and preserves the pull-request conversation for human review and collaboration.

## 4. How the Feature Works

The feature separates the APC policy result from the process of displaying that result on a pull request. The existing APC process determines whether the policy check has passed or failed, while `manage_pr_comment.py` manages how the result is presented in the PR conversation.

### Step 1: Receive the workflow information

After the APC process produces a result, the workflow provides the comment-management script with the information required to access the pull request and prepare the comment. This includes the repository details, pull-request number, APC outcome, workflow-run link, and GitHub authentication token.

### Step 2: Retrieve the pull-request comments

The script requests the existing comments from the pull request. It supports paginated results so that it can continue searching even when a PR contains more comments than can be returned in one API response.

### Step 3: Locate the APC-managed comment

The script searches the retrieved comments for a unique hidden marker embedded in the APC comment. This marker identifies the comment managed by the script.

Ordinary comments written by contributors and reviewers do not contain this marker. Therefore, they are ignored by the search and remain unchanged.

### Step 4: Create the comment on the first run

If the script does not find an existing comment containing the hidden marker, it creates a new APC comment. The first comment includes:

- the current `PASSED` or `FAILED` result;
- a link to the relevant workflow run;
- the time of the latest check;
- the commit associated with the result;
- an initial `Updates: 0` count; and
- the hidden marker used for future identification.

### Step 5: Update the comment on later runs

If an APC-managed comment already exists, the script reads its current `Updates` value and increases it by one. It then replaces the content of that same comment with the latest result, workflow information, timestamp, commit details, and updated count.

For example:

```text
First run:  Updates: 0
Second run: Updates: 1
Third run:  Updates: 2
```

The update is applied to the existing APC comment rather than creating an additional comment.

### Step 6: Preserve human comments

Because the script updates only the comment containing the hidden APC marker, human comments remain separate from the automated result. Posting a human comment does not increase the `Updates` count because the count represents updates made to the APC-managed comment only.

### Result

At the end of each run, the pull request contains one current APC result comment. Reviewers can see the latest status and follow its workflow link without searching through several outdated automated comments.

## 5. Files Involved

The feature is implemented through three related files:

| File | Role in the Feature |
| --- | --- |
| `.github/workflows/policy_check_PR.yaml` | Integrates the comment-management script into the APC workflow and provides the information required to create or update the pull-request comment. |
| `scripts/auto_test/manage_pr_comment.py` | Contains the main feature logic for locating the APC-managed comment, creating it on the first run, and updating it on later runs. |
| `scripts/auto_test/_tests/test_manage_pr_comment.py` | Contains the automated tests that verify the expected comment-management behaviour, including comment creation, updates, marker detection, formatting, pagination, and error handling. |

These files should be reviewed together when maintaining or extending the feature because the workflow calls the script, while the test file verifies that the script continues to behave as expected.

## 6. Maintenance Notes

When modifying or extending this feature, future contributors should consider the following:

- Preserve the hidden marker used to identify the APC-managed comment. Removing or changing it without updating the search logic may cause the workflow to create duplicate comments.
- Keep the `Updates` count format consistent with the parsing logic in `manage_pr_comment.py`.
- Ensure that the script updates only the APC-managed comment and does not modify comments written by contributors or reviewers.
- Maintain the required GitHub Actions permissions so the workflow can read, create, and update pull-request comments.
- If the APC comment format is changed, update the related tests in `scripts/auto_test/_tests/test_manage_pr_comment.py`.
- Run both the focused feature tests and the relevant repository tests before submitting changes.
- Test both the first-run creation behaviour and later-run update behaviour.
- Confirm that `PASSED` and `FAILED` results are displayed correctly without changing the existing APC evaluation or labelling logic.

## 7. Suggested Next Steps

The current implementation addresses Issue [#405](https://github.com/Hardhat-Enterprises/Policy-Deployment-Engine/issues/405) by maintaining one APC-managed comment and updating it after later workflow runs. Future contributors may consider the following optional improvements:

- **Improve the comment presentation:** Refine the layout of the APC comment to make the latest result, workflow link, commit, timestamp, and update count easier to read.
- **Add clearer error reporting:** Provide more specific messages when the script cannot retrieve, create, or update a pull-request comment.
- **Review concurrent workflow behaviour:** Test what happens when two APC workflow runs attempt to update the same comment at nearly the same time.
- **Expand integration testing:** Add automated workflow-level tests covering repeated `PASSED` and `FAILED` results, not only the script's individual functions.
- **Review marker compatibility:** Ensure that future changes to the comment format continue to preserve and recognise the hidden marker.
- **Improve update history:** Consider whether a short summary of previous results would be useful without returning to multiple separate APC comments.
- **Monitor GitHub API changes:** Review the comment-management logic if GitHub changes its API behaviour, authentication requirements, or workflow permissions.
- **Extend the approach to other automated comments:** Assess whether other PDE workflows that repeatedly post comments could safely use the same create-or-update pattern.

These items are suggestions for future development rather than known defects or required changes. Any extension should preserve the feature's main behaviour: one current APC comment, accurate update tracking, and protection of human comments.
