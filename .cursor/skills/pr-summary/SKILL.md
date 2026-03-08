# PR Summary Skill

Generate a pull request summary by reviewing local git changes and writing a structured description following the project template.

## Steps

1. **Gather change context** by running git commands:
   ```
   git diff main --stat
   git diff main
   git log main..HEAD --oneline
   ```

2. **Infer type of change** from the diff and file list:
   - `feat` / Feature – new functionality added
   - `fix` / Bug Fix – incorrect behaviour corrected
   - `refactor` – internal restructuring without behaviour change
   - `docs` – documentation only changes
   - `test` – test additions or updates
   - `chore` – maintenance, tooling, or dependency updates

3. **Write summary as topic bullets** – one short bullet per logical change, grouped by area (e.g. Sources, Tests, CI, Documentation).

4. **Output in template format** (see below).

5. **Deliver the result** in a markdown code block and write the content to `pr-description.md` in the repository root.

---

## Output Template

```markdown
## Type of change

- [ ] Bug fix
- [ ] New feature
- [ ] Refactoring
- [ ] Documentation
- [ ] Tests
- [ ] Chore / maintenance

## Description

<!-- What was changed and why -->

## Changes

- 

## Testing

- [ ] Existing tests pass
- [ ] New tests added / updated
```

---

## Example Usage

Ask Cursor:

> "Summarize my current PR changes"

Cursor will:
1. Run the git commands above to collect the diff, file list, and commit log.
2. Determine the change type from the modified files and diff content.
3. Produce a filled-in version of the template as a markdown code block.
4. Write the same content to `pr-description.md` at the repository root.
