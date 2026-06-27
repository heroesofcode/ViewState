---
name: open-pr
description: Generates a PR summary from local git changes and opens the pull request on GitHub automatically. Use when the user asks to open, create, or submit a PR.
---

# Open Pull Request

Generates a PR description from local changes and creates the pull request on GitHub using `gh`.

## Workflow

1. **Gather change context**
   - Run `git status` to get the current branch name.
   - Run `git log origin/main..HEAD --oneline` to see commits on the branch.
   - Run `git diff origin/main..HEAD` to understand what changed.

2. **Ensure changes are on a feature branch**
   - If the current branch is `main` (or the default branch):
     - Inspect the unstaged/staged changes (via `git diff` and `git status`) to infer a branch name in kebab-case that matches the type of change (e.g. `docs/update-readme`, `feat/add-login`, `fix/crash-on-startup`).
     - Run `git checkout -b <inferred-branch-name>` to create and switch to the new branch.
     - Stage all changed files with `git add -A` and commit them with an appropriate conventional-commit message.
     - Continue with the rest of the workflow from the new branch.
   - If there are no commits ahead of `main` **and** no staged/unstaged changes, inform the user and stop.

3. **Infer the PR title**
   - Use the most recent commit message as the PR title (it is already in conventional commit format).

4. **Infer type of change**
   From the diff and file list, choose one or more types that fit:
   - **Enhancement** – improvements to existing behavior
   - **Bug fix** – fixes to incorrect behavior
   - **Security fix** – security-related changes
   - **Breaking change** – API or behavior changes that break compatibility
   - **New feature** – new functionality
   - **New release** – version/release bumps or release notes
   - **Documentation** – docs, comments, README only
   - **Refactor** – restructuring without changing behavior

5. **Write the summary as topic bullets**
   - Use only bullet points, one short line per change.
   - e.g. "add ...", "fix ...", "update ...", "remove ...".

6. **Push and create the PR**
   - Push the branch to the remote: `git push -u origin <branch>`.
   - Create the PR with `gh pr create` using `--title`, `--head`, `--base main`, and `--body` with the generated description.
   - Return the PR URL to the user.

## Output Template (PR body)

Use this exact structure. Do NOT include a "Suggested Commit" section.

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

## Notes

- Do NOT include a "Suggested Commit" section in the PR body.
- Never push directly to `main`. If the current branch is `main`, automatically create a feature branch, commit the changes, and continue.
- If there are no commits ahead of `main` and no local changes exist, inform the user and stop.
- If the branch is already up-to-date on the remote, skip the push step.
- If a PR already exists for the branch, inform the user of the existing PR URL instead of creating a new one.
