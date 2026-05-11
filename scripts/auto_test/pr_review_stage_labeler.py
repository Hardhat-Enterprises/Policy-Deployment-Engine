"""
Automate PR review stage labels (first review, second review, third review).
Detects reviewer feedback events & trigger label updates automatically
"""

import os
from github import Github

def get_review_count(pr):
    reviews = pr.get_reviews()

    valid_states = {"APPROVED", "CHANGES_REQUESTED"}

    seen_users = set()
    valid_reviews = []

    for r in reviews:
        if r.state in valid_states and r.user.login not in seen_users:
            valid_reviews.append(r)
            seen_users.add(r.user.login)

    return len(valid_reviews)


def apply_label(pr, count):
    label_map = {
        1: "first review",
        2: "second review",
        3: "third review"
    }

    label = label_map.get(count, f"{count}th review")

    # To remove old review labels
    for l in pr.get_labels():
        if "review" in l.name:
            pr.remove_from_labels(l.name)

    pr.add_to_labels(label)
    print(f"Applied label: {label}")


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