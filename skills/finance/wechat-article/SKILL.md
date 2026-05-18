---
name: wechat-article
description: "Create WeChat public account articles from research and analysis. Covers full workflow: draft, Strict Scrutiny scoring, optimize, deliver as Feishu doc with diagrams. Used when user asks to write articles for WeChat publishing or format analysis for public readership."
metadata:
  hermes:
    tags: [wechat, article, publishing, writing, diagram]
    triggers:
      - "写一篇公众号"
      - "微信公众号发表"
      - "发公众号"
      - "公众号文章"
      - "配合核心的图片"
      - "优化到"
---

# WeChat Article Creation

## When to Use

User wants to produce a WeChat public account article from research, analysis, or conversation. This skill covers the end-to-end workflow from first draft to publish-ready Feishu document with diagrams.

Also load `feishu-card-message` for the Feishu document creation step (`lark-cli docs +create`).

## Workflow

### Phase 1: Draft

Write the article as a Markdown file. Follow WeChat formatting rules:

- **Short paragraphs**: 2-3 sentences max. Mobile readers scroll fast.
- **Bold key sentences**: Every ~3 paragraphs, bold a standalone sentence as a "hook."
- **Tables**: Use simple tables (max 4-5 columns) for comparisons. WeChat doesn't render Markdown tables natively -- warn user they'll need screenshots.
- **Blockquotes** (`>`): Use for key takeaways. 1-2 per section max.
- **Dividers** (`---`): Use between major sections. WeChat has a built-in divider component that looks better.
- **Emoji**: Use sparingly for visual anchors. Fully supported in WeChat.
- **Pull quotes**: Standalone bold lines that can work as WeChat "quote cards".

### Phase 2: Strict Scrutiny Scoring (5 Dimensions)

After drafting, score the article on 5 dimensions (0-10 scale):

| Dimension | Weight | What It Measures |
|-----------|:------:|-----------------|
| 逻辑严密性 (Logical Rigor) | 25% | Is the argument sound? Any selection bias? Counter-arguments addressed? |
| 数据支撑度 (Data Support) | 25% | Are claims backed by numbers? Sources cited? Financial data present? |
| 叙事力量 (Narrative Power) | 20% | Is it compelling? Hooks? Rhythm? Emotional arc? |
| 原创洞察 (Original Insight) | 20% | Does it say something non-obvious? Fresh framework or repackaging? |
| 公众号适配 (WeChat Readiness) | 10% | Paragraph length, table usability, mobile readability |

Present score as a table + progress bar: `▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░ 7.1 / 10`

For each dimension, list what's working and hard flaws with specific fix suggestions.

### Phase 3: Optimize (Target: 9.0+)

Common upgrade paths:

| Score Gap | Typical Fix |
|-----------|------------|
| Data < 5 | Add financial data table (3-year) + peer comparison + valuation sensitivity |
| Logic < 7 | Add counter-case / bear scenario / "where it could die" section |
| Narrative < 7 | Shorten paragraphs, add more standalone bold hooks |
| Insight < 7 | Add a non-obvious framework, a unique contrast pair, or a personal data point |
| WeChat < 7 | Break long sections, add emoji anchors |

**The 9.5 gap**: To go from 9.0 to 9.5+, add:
1. A custom dark-themed SVG diagram the reader can't find anywhere else
2. A non-consensus insight -- something the author uniquely owns

### Phase 4: Diagrams

When the user says "配合核心的图片", create dark-themed SVG diagrams:

**Diagram types:**
1. **Battle maps** -- Company in center, competitors attacking from angles. Directional arrows with colors.
2. **Comparison tables** -- Side-by-side visual (e.g., Founder Present vs Absent).
3. **Promise vs Reality** -- Bar charts showing gap between stated and actual.
4. **Timeline/evolution** -- Company's strategic shifts over time.

**SVG design system:**
- Background: `#0a0e17` (dark slate)
- Font: `PingFang SC`, `Microsoft YaHei`
- Box fills: `#1e293b`
- Accent: green `#22c55e` = positive, red `#ef4444` = negative, amber `#eab308` = warning
- Arrow markers with matching colors
- Dashed lines for competition/conflict arrows

Save SVGs to `/tmp/` and note in the article where each one goes: `[ 配图：描述 ]`

**WeChat note**: SVGs must be converted to PNG/JPG. Options:
- **A**: Open SVG in browser, screenshot, crop, upload
- **B**: `rsvg-convert -w 1200 file.svg -o file.png` (if available)

### Phase 5: Deliver as Feishu Doc

Use `lark-cli docs +create --api-version v2 --doc-format markdown` (see `feishu-card-message` skill). Always:
- `cd /tmp` first (relative path required)
- Use `LARK_CLI_NO_PROXY=1`
- Use v2 API (v1 can fail with MCP EOF)
- Return doc URL with article structure summary

## Quality Standards

- **Data sources**: Every table must cite source. Distinguish "确定的事实" from "经验判断" at article end.
- **Counter-arguments**: Every bullish thesis must have a bear case. Every bear thesis must acknowledge the bull case.
- **User's voice**: If the user shared a personal data point or original phrase during conversation, it MUST appear in the article. This is highest-value content.
- **Risk disclosure**: End with "本文不构成任何投资建议" for finance articles.
- **Series coherence**: If part of a series, include a series overview table linking to prior articles.

## Content Patterns That Work

### The Mirror Pair

Contrast two companies on the same dimension: Tencent ("不敢为天下先", founder present, 4 battlefields, waiting) vs Alibaba ("什么都想做", founder absent, 8 battlefields, fighting everywhere).

### The Personal Data Point

A user's firsthand experience: "千问 Coding Plan 承诺 1200次/小时，实际 400次宕机" -- more powerful than any analyst note.

### The Founder's Empty Chair

The single most discriminating question for Chinese tech in the AI era: "Is the founder still at the table?" This determines faith-level resource allocation capability.

### The Structure That Converts

- Opening: Hook (3 lines), then "what we're doing" (3 lines), then first data table
- Middle: Case studies, counter-case, framework
- End: Scoring/ranking, risk acknowledgment, one-sentence conclusion
