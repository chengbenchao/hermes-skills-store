# Hermes Skills Store

> 7 个精选 Skill，一套跨机器复用的技能仓库。clone + symlink = 即用。

## 包含的 Skill

| Skill | 用途 |
|-------|------|
| `find-skills` | 最高优先级 skill 发现入口 |
| `skill-vetter` | 安装前安全审查（4 级风险分类） |
| `skillhub-preference` | 优先使用 SkillHub 国内源 |
| `frontend-design` | 生产级前端 UI 设计规范 |
| `debug-pro` | 7 步系统调试协议 |
| `调试伴侣` (debug-companion) | 错误 traceback 自动根因分析 |
| `self-improvement` | 捕获错误/纠正，持续进化 |

## 新机器使用

```bash
# 1. 克隆
git clone https://github.com/chengbenchao/hermes-skills-store.git ~/.hermes/skills-store

# 2. Symlink 到目标 profile
PROFILE="default"  # 或 finance / 其他
mkdir -p ~/.hermes/profiles/$PROFILE/skills
for d in ~/.hermes/skills-store/skills/*/; do
  ln -sf "$(realpath "$d")" ~/.hermes/profiles/$PROFILE/skills/$(basename "$d")
done

# 3. 加载
hermes --profile $PROFILE skills list | grep -E "find-skills|skill-vetter|self-improve"
```

## 添加新 Skill

```bash
cd ~/.hermes/skills-store
skillhub install <slug>
# 自动推送到 GitHub（cron 每 10 分钟检查一次）
```

或手动推送：

```bash
cd ~/.hermes/skills-store
git add -A && git commit -m "add: <skill-name>" && git push
```

## 目录结构

```
skills/
├── find-skills/SKILL.md
├── skill-vetter/SKILL.md
├── skillhub-preference/SKILL.md
├── frontend-design/SKILL.md
├── debug-pro/SKILL.md
├── debug-companion/SKILL.md
└── self-improving-agent/SKILL.md
```
