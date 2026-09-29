# Instructions for AI assistants

## Only change what you were assigned
Your portal card lists the arguments you own for your resource type. Those are the only doc leaves, policies
(`policies/.../<argument>.rego`) and fixture folders (`inputs/.../<argument>/`) you may add or edit.
- Everything else in your resource type's folder was finished before you were assigned. Do not edit it, even
  if it looks wrong — not the policy, not its fixtures, not its `true`/`false` or rationale in the doc.
- A policy and its fixture folder are one unit. If you changed either by mistake, put **both** back exactly
  as they are on `dev`; restoring only one makes the policy check fail.
- Spotted a real mistake in existing content? Leave it as it is and raise a fix request on the portal
  (on your assignment card: "Spotted a mistake in something that was already done?"). If it is accepted you will be given a separate branch for it.
- AI assistants: treat every path outside the assigned arguments as read-only. Do not "fix while you are
  there".

For everything else — repository layout, branch naming, pre-commit hooks, local testing and CI — read
[README.md](../README.md).
