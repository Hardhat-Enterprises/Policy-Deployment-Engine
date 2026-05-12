"""
Automate PR review stage labels (first review, second review, third review).
Detects reviewer feedback events & trigger label updates automatically
"""

import os
from github import Github

def get_review_count(pr):
    labels = [l.name for l in pr.get_labels()]

    if "4th review" in labels:
        return 4
    if "3rd review" in labels:
        return 3
    if "2nd review" in labels:
        return 2
    if "1st review" in labels:
        return 1

    return 0


def apply_label(pr, current_stage):
    next_stage = current_stage + 1

    label_map = {
        1: "1st review",
        2: "2nd review",
        3: "3rd review",
        4: "4th review"
    }

    desired_label = label_map.get(next_stage)

    if not desired_label:
        print("Max review stage reached")
        return

    existing_labels = [l.name for l in pr.get_labels()]

    review_labels = set(label_map.values())

    # To remove old review labels
    for l in existing_labels:
        if l in review_labels:
            pr.remove_from_labels(l)

    pr.add_to_labels(desired_label)

    print(f"Moved to: {desired_label}")

def main():
    token = os.getenv("GITHUB_TOKEN")
    repo_name = os.getenv("REPO")
    pr_number = os.getenv("PR_NUMBER")
    if not pr_number:
        print("Missing PR_NUMBER")
        return
    pr_number = int(pr_number)

    if not token or not repo_name or not pr_number:
        print("Missing environment variables")
        return

    g = Github(token)
    repo = g.get_repo(repo_name)
    pr = repo.get_pull(pr_number)

    count = get_review_count(pr)

    if count == 0:
        print("No valid reviews found")
        return

    apply_label(pr, count)


if __name__ == "__main__":
    main()