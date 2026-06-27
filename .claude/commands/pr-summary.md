---
name: pr-summary
description: Reviews local git changes and generates a pull request summary following the project template. Use when the user asks to automate PR summary, generate PR description, fill PR template, or review local changes for a PR.
context: fork
agent: general-purpose
---

# PR Summary from Local Changes

Generates a PR description that matches `.github/pull_request_template.md` by analyzing the repository's local changes (staged and/or unstaged).

## Workflow

1. **Gather change context**
   - Run `git status` to see modified/added/deleted files and current branch.
   - Run `git diff --staged` for staged changes; if empty, run `git diff` for unstaged changes (or both if the user wants everything).
   - Optionally run `git log -1 --oneline` or `git log origin/main..HEAD --oneline` to see recent commits on the branch.

2. **Infer type of change**
   From the diff and file list, choose one or more types that fit:
   - **Enhancement** – improvements to existing behavior
   - **Bug fix** – fixes to incorrect behavior
   - **Security fix** – security-related changes
   - **Breaking change** – API or behavior changes that break compatibility
   - **New feature** – new functionality
   - **New release** – version/release bumps or release notes
   - **Documentation** – docs, comments, README only
   - **Refactor** – restructuring without changing behavior

3. **Write the summary as topic bullets**
   - Use only bullet points (topics), no paragraph text.
   - One short line per change, e.g. "add ...", "fix ...", "update ...", "remove ...".
   - No extra explanation; keep each line concise.

4. **Output in template format**
   Use this structure (from the project template). Replace the summary text and check the applicable type(s).

5. **Suggest a commit message**
   Based on the inferred type of change, suggest a conventional commit message:
   - `feat: <short description>` – for new features or enhancements
   - `fix: <short description>` – for bug fixes
   - `refactor: <short description>` – for refactors
   - `docs: <short description>` – for documentation only
   - `chore: <short description>` – for release bumps or maintenance
   - `security: <short description>` – for security fixes

6. **Deliver the result**
   - Reply with the PR summary in a **markdown code block** (so the user can copy it from the chat).
   - **Also write** the same content to `pr-description.md` in the repository root so the user can open the file and copy from there. Tell the user the file path; they can delete the file after pasting into the PR.

## Output Template

Use this exact structure. Under "Summary", list only bullet-point topics (no paragraph). In "Type of Change", check only the box(es) that apply (use `[x]` for checked, `[ ]` for unchecked).

```markdown
## ✨ Summary

- <topic 1>
- <topic 2>
- ...

## 🔧 Type of Change

- [ ] ✨ Enhancement
- [ ] 🐞 Bug fix
- [ ] 🔐 Security fix
- [ ] 💥 Breaking change
- [ ] 🚀 New feature
- [ ] 📦 New release
- [ ] 📚 Documentation
- [ ] ♻️ Refactor

```
