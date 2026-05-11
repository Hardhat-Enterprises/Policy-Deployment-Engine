"""
Automate PR review stage labels (first review, second review, third review).
Detects reviewer feedback events & trigger label updates automatically
"""

import os
from github import Github

def get_review_count(pr):
    reviews = pr.get_reviews()

    seen_users = {}
    
    for r in reviews:
        # count latest review per user
        seen_users[r.user.login] = r.state

    valid_states = {"APPROVED", "CHANGES_REQUESTED"}

    count = 0
    for state in seen_users.values():
        if state in valid_states:
            count += 1

    return count


def apply_label(pr, count):
    label_map = {
        1: "1st review",
        2: "2nd review",
        3: "3rd review",
        4: "4th review"
    }

    desired_label = label_map.get(count)

    if not desired_label:
        return

    existing_labels = [l.name for l in pr.get_labels()]

    if desired_label in existing_labels:
        print("Label already correct, skipping")
        return
    
    # To remove old review labels
    for l in existing_labels:
        if "review" in l:
            pr.remove_from_labels(l)

    pr.add_to_labels(desired_label)

def main():
    token = os.getenv("GITHUB_TOKEN")
    repo_name = os.getenv("REPO")
    pr_number = int(os.getenv("PR_NUMBER"))

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