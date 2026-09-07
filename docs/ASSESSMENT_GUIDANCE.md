# Assessment Guidance: How to Think About `security_impact`

Your task, for every argument of a Terraform resource type, is to decide
`security_impact` (`true`/`false`) and write a `rationale`. This document teaches you how
to reason your way to a defensible answer. It deliberately does **not** contain the
answers — the reasoning is the skill being assessed, and it is yours to do.

---

## 1. The mission

We are building a library of **generic, platform-level security policies** for an
imaginary multi-tenant enterprise: many teams, hundreds of projects, and — crucially —
**we know nothing about any particular team**. No project names, no key IDs, no email
addresses, no bucket names.

For each argument, the question you are answering is:

> **Would a generic policy constraining this argument make the resource more secure?**

*Generic* means the policy could be written once and applied to every team without
knowing anything team-specific. If the only way to enforce something is to hardcode a
value that belongs to one team, that is not a platform policy — it's overreach.

`true` means "this argument is a worthwhile target for such a policy."
`false` means it is not. Both verdicts require a reason you can defend.

---

## 2. Do the research

The single biggest differentiator between strong and weak assessments is whether the
author actually found out what the argument does.

- **Read the Terraform description critically.** It is often one vague sentence written
  for people who already know the service. Treat it as a starting point, not an answer.
- **When it's thin, go to the source.** Look up the argument in the underlying cloud
  service's own documentation. What does this setting actually change in the running
  service? What happens when it's unset? What is the default, and is the default safe?
- **Check what values the platform accepts before claiming a risk.** It is easy to
  imagine an insecure configuration that the platform doesn't actually allow. If every
  accepted value is equally safe, a policy constraining the choice buys nothing.
- **Know whose job it is.** Our policies secure *this* resource's configuration. An
  argument that merely points at some other resource, or encodes a choice that belongs to
  the team operating it, may be real and important — and still not ours to police.
  Learning to see that boundary is part of the exercise.

---

## 3. Questions to ask of any argument

Work through these honestly for every argument — they are the analysis:

1. **What does this argument actually control?** Not what its name suggests — what does
   it *do*, in this resource, on this platform?
2. **Who would a policy on it constrain?** Would the constraint hold for every team in
   the org, or does it only make sense for some teams, some workloads, some values?
3. **Does enforcing it change the security posture?** Or does it only affect operations,
   cost, performance, or naming? "Important" and "security-relevant" are not synonyms.
4. **Could the policy be written without knowing any team-specific value?** If you can't
   state the rule without inventing a name, key, or address, reconsider.
5. **Is this resource's security what's at stake?** Or are you reaching into
   configuration that another resource, or another team, is responsible for?

If you can answer all five with evidence, the verdict usually falls out on its own.

### An example of the *process* (not a verdict)

Suppose you meet a boolean whose entire Terraform description is "Enables tiered request
handling." That tells you nothing. A strong assessment would: search the cloud provider's
docs for the feature; establish what actually changes when it's on versus off; check the
default; then run the questions above — does the off state expose anything, or is this
purely a capacity/cost lever? Whatever you find *is* your rationale. A weak assessment
guesses from the name, and it shows immediately.

---

## 4. What a good rationale looks like

The rationale is where you prove the work happened. It must:

- **Show you understand what the argument does in this resource's context** —
  especially where the Terraform docs are vague. If the docs were unclear and your
  rationale is just as unclear, you haven't added anything.
- **For security-relevant arguments, say what a policy would actually enforce** — the
  shape of the rule, the direction it pushes, without hardcoding specifics. "This is
  security related" is not a rationale; it's the absence of one.
- **Give a real why (or why-not).** A `false` verdict still needs to say what the
  argument controls and why constraining it wouldn't improve security.

Be proportionate: a genuinely trivial field deserves one precise sentence, not padding.
But note well — **a poor rationale costs marks even when the `true`/`false` call is
right.** A correct verdict with a hollow justification tells us you may have guessed, or
copied. Either way, the assessed skill wasn't demonstrated.

---

## 5. On doing your own analysis

To be plain about it: the analysis is what is being assessed, not the final booleans.
Verdicts are checked, rationales are read, and reviewers are experienced at spotting
prose that describes an argument without understanding it — including the fluent,
confident, generically-worded kind. A rationale that doesn't demonstrate genuine
engagement with what the argument does *in this resource* will not pass, whatever the
verdict says.

The good news: the process above is not long. Read the docs, chase the vague bits, ask
the five questions, write down what you found. Do that, and both the verdict and the
rationale take care of themselves.
