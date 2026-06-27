---
name: code-review
description: Analyzes local git changes and generates a detailed code review report as an HTML file (code-review.html) with the project's dark GitHub-style theme.
context: fork
agent: general-purpose
---

# Code Review → HTML Report

Performs a thorough code review of the local diff and writes the result to `code-review.html` in the repository root using the project's established dark-theme HTML format.

## Workflow

### 1. Gather context

Run these commands to understand the changes:

```bash
git status
git diff HEAD          # unstaged + staged vs last commit
git diff --staged      # staged only (use if diff HEAD is empty)
git log -5 --oneline  # recent commits for context
```

Also read the files that are new or heavily changed (use the Read tool) to understand surrounding code, not just the diff lines.

### 2. Analyse findings

Categorise every finding into one of four types:

| Type        | Tag class | When to use |
|-------------|-----------|-------------|
| **Good**    | `good`    | Positive patterns worth calling out — good abstractions, idiomatic code, nice refactors |
| **Issue**   | `fix`     | Bugs, correctness problems, security issues, broken behaviour — should be fixed |
| **Warning** | `warn`    | Code smells, non-idiomatic patterns, fragile assumptions, missing tests — worth addressing |
| **Suggestion** | `info` | Nice-to-haves, ergonomic improvements, optional refactors — take or leave |

Aim for at least 1–2 findings per type when the diff warrants it. Count each category's findings for the summary badges.

### 3. Generate `code-review.html`

Write the full HTML file to `code-review.html` at the repository root.
Use **exactly** the CSS variables, class names, and structure shown in the template below. Do not alter the design — only fill in the content.

Fill in dynamic values:
- `{REPO}` — repository name from `git remote get-url origin` or directory name
- `{BRANCH}` — current branch from `git branch --show-current`
- `{DATE}` — today's date (YYYY-MM-DD)
- `{FILES_CHANGED}` — number of files with changes
- Badge counts — number of findings per category
- Cards — one `<div class="card">` per finding

For code snippets inside cards: use `<span class="line-del">` for removed lines, `<span class="line-add">` for added lines, `<span class="line-neu">` for context lines.
Escape HTML entities in code (`<` → `&lt;`, `>` → `&gt;`, `&` → `&amp;`).

### 4. Open the file (macOS)

After writing the file, run:

```bash
open code-review.html
```

### 5. Confirm to the user

Tell the user:
- The file was written to `code-review.html`
- A one-line summary of findings (e.g. "2 issues, 3 warnings, 1 suggestion, 2 positives")

---

## HTML Template

```html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Code Review — {REPO}</title>
<style>
  :root {
    --bg: #0d1117;
    --surface: #161b22;
    --border: #30363d;
    --text: #e6edf3;
    --muted: #8b949e;
    --green: #3fb950;
    --green-bg: #0f2a1a;
    --yellow: #d29922;
    --yellow-bg: #271d00;
    --red: #f85149;
    --red-bg: #2a0b0b;
    --blue: #58a6ff;
    --blue-bg: #0c1f3d;
    --purple: #bc8cff;
    --purple-bg: #1e0f3d;
    --code-bg: #1c2128;
    --tag-added: #238636;
    --tag-warn: #9e6a03;
    --tag-fix: #da3633;
    --tag-info: #1f6feb;
  }
  * { box-sizing: border-box; margin: 0; padding: 0; }
  body {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif;
    background: var(--bg);
    color: var(--text);
    line-height: 1.6;
    padding: 2rem 1rem;
  }
  .container { max-width: 900px; margin: 0 auto; }
  .header {
    border: 1px solid var(--border);
    border-radius: 10px;
    background: var(--surface);
    padding: 1.5rem 2rem;
    margin-bottom: 2rem;
  }
  .header h1 { font-size: 1.5rem; font-weight: 700; margin-bottom: .4rem; }
  .header p { color: var(--muted); font-size: .9rem; }
  .meta { display: flex; gap: 1.5rem; margin-top: 1rem; flex-wrap: wrap; }
  .meta-item { font-size: .82rem; color: var(--muted); }
  .meta-item span { color: var(--text); font-weight: 600; }
  .summary { display: flex; gap: 1rem; margin-bottom: 2rem; flex-wrap: wrap; }
  .badge {
    display: flex; align-items: center; gap: .4rem;
    padding: .4rem .85rem; border-radius: 6px;
    font-size: .82rem; font-weight: 600; border: 1px solid;
  }
  .badge.good    { background: var(--green-bg);  color: var(--green);  border-color: #238636; }
  .badge.warn    { background: var(--yellow-bg); color: var(--yellow); border-color: #9e6a03; }
  .badge.fix     { background: var(--red-bg);    color: var(--red);    border-color: #da3633; }
  .badge.info    { background: var(--blue-bg);   color: var(--blue);   border-color: #1f6feb; }
  .section-title {
    font-size: 1rem; font-weight: 700; color: var(--muted);
    text-transform: uppercase; letter-spacing: .08em;
    margin-bottom: 1rem; margin-top: 2rem;
  }
  .card {
    border: 1px solid var(--border);
    border-radius: 8px;
    background: var(--surface);
    margin-bottom: 1.2rem;
    overflow: hidden;
  }
  .card-header {
    display: flex; align-items: center; gap: .75rem;
    padding: .85rem 1.2rem;
    border-bottom: 1px solid var(--border);
  }
  .tag {
    font-size: .73rem; font-weight: 700; padding: .2rem .5rem;
    border-radius: 5px; text-transform: uppercase; white-space: nowrap;
  }
  .tag.good  { background: var(--tag-added); color: #fff; }
  .tag.warn  { background: var(--tag-warn);  color: #fff; }
  .tag.fix   { background: var(--tag-fix);   color: #fff; }
  .tag.info  { background: var(--tag-info);  color: #fff; }
  .card-header h3 { font-size: .95rem; font-weight: 600; }
  .file-ref { margin-left: auto; font-size: .78rem; color: var(--muted); font-family: monospace; }
  .card-body { padding: 1rem 1.2rem; }
  .card-body p { color: var(--text); font-size: .9rem; margin-bottom: .75rem; }
  .card-body p:last-child { margin-bottom: 0; }
  .code-block {
    border-radius: 6px;
    background: var(--code-bg);
    border: 1px solid var(--border);
    overflow-x: auto;
    margin: .75rem 0;
  }
  .code-block-label {
    font-size: .72rem; color: var(--muted); font-weight: 600;
    padding: .4rem .8rem;
    border-bottom: 1px solid var(--border);
    text-transform: uppercase; letter-spacing: .05em;
  }
  .code-block-label.before { color: var(--red); }
  .code-block-label.after  { color: var(--green); }
  pre {
    padding: .75rem 1rem;
    font-size: .82rem;
    line-height: 1.55;
    color: var(--text);
    font-family: "SFMono-Regular", Consolas, "Liberation Mono", Menlo, monospace;
  }
  .line-del { color: var(--red);   background: #2a0b0b55; display: block; }
  .line-add { color: var(--green); background: #0f2a1a55; display: block; }
  .line-neu { display: block; }
  hr { border: none; border-top: 1px solid var(--border); margin: 2rem 0; }
  footer { text-align: center; color: var(--muted); font-size: .8rem; margin-top: 3rem; }
</style>
</head>
<body>
<div class="container">

  <!-- Header -->
  <div class="header">
    <h1>Code Review Report</h1>
    <p>Local diff review for the current working changes</p>
    <div class="meta">
      <div class="meta-item">Repository <span>{REPO}</span></div>
      <div class="meta-item">Branch <span>{BRANCH}</span></div>
      <div class="meta-item">Date <span>{DATE}</span></div>
      <div class="meta-item">Changed files <span>{FILES_CHANGED}</span></div>
    </div>
  </div>

  <!-- Summary badges -->
  <div class="summary">
    <div class="badge good">✔ {N_GOOD} Positive</div>
    <div class="badge warn">⚠ {N_WARN} Warnings</div>
    <div class="badge fix">✖ {N_FIX} Issues</div>
    <div class="badge info">ℹ {N_INFO} Suggestions</div>
  </div>

  <!-- ── POSITIVES ─────────────────────────────────────────────────── -->
  <div class="section-title">✔ What looks good</div>

  <!-- One .card per positive finding -->
  <div class="card">
    <div class="card-header">
      <span class="tag good">Good</span>
      <h3>{FINDING TITLE}</h3>
      <span class="file-ref">{file/path · location}</span>
    </div>
    <div class="card-body">
      <p>{Explanation of why this is good.}</p>
    </div>
  </div>

  <hr />

  <!-- ── ISSUES ────────────────────────────────────────────────────── -->
  <div class="section-title">✖ Issues — should fix</div>

  <!-- One .card per issue; include before/after code blocks when helpful -->
  <div class="card">
    <div class="card-header">
      <span class="tag fix">Issue</span>
      <h3>{FINDING TITLE}</h3>
      <span class="file-ref">{file/path · location}</span>
    </div>
    <div class="card-body">
      <p>{Explanation of the problem.}</p>
      <div class="code-block">
        <div class="code-block-label before">Before (current)</div>
        <pre><span class="line-del">// problematic code</span></pre>
      </div>
      <div class="code-block">
        <div class="code-block-label after">After (suggested)</div>
        <pre><span class="line-add">// fixed code</span></pre>
      </div>
    </div>
  </div>

  <hr />

  <!-- ── WARNINGS ──────────────────────────────────────────────────── -->
  <div class="section-title">⚠ Warnings — worth addressing</div>

  <!-- One .card per warning -->

  <hr />

  <!-- ── SUGGESTIONS ──────────────────────────────────────────────── -->
  <div class="section-title">ℹ Suggestions</div>

  <!-- One .card per suggestion -->

  <hr />
  <footer>Generated by Claude Code · local diff review · {REPO}</footer>
</div>
</body>
</html>
```

## Rules

- Omit a section entirely (including its `<hr>`) if there are zero findings for that category.
- Always include the Positives section even for small diffs — find something worth praising.
- Code blocks inside cards are optional for Good/Info findings but strongly recommended for Issue/Warning findings.
- Keep card titles short (one line). Put all detail in `<p>` tags inside `.card-body`.
- Do not truncate the HTML — write the complete file in one Write tool call.
