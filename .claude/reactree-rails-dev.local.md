---
enabled: true
feature_id: null
workflow_phase: idle

# Smart Detection Configuration
smart_detection_enabled: true
detection_mode: suggest
annoyance_threshold: medium

# Quality control
quality_gates_enabled: true
test_coverage_threshold: 85

# Memory settings
working_memory_enabled: true
episodic_memory_enabled: true

# Skill inventory (auto-populated)
available_skills:
  core: [codebase-inspection, rails-conventions, rails-error-prevention]
  data: [activerecord-patterns]
  service: [api-development-patterns, service-object-patterns]
  async: [sidekiq-async-patterns]
  ui: [accessibility-patterns, hotwire-patterns, requirements-engineering, requirements-writing, tailadmin-patterns, user-experience-design, viewcomponents-specialist]
  i18n: [localization]
  testing: [rspec-testing-patterns]
  infrastructure: []
  requirements: []
  domain: [action-cable-patterns, code-quality-gates, context-compilation, implementation-safety, rails-context-verification, reactree-patterns, refactoring-workflow, ruby-oop-patterns, smart-detection]

# Automation
auto_commit: false
auto_create_pr: false
---

# ReAcTree Rails Development Configuration

**Project**: vene
**Skills Discovered**: Fri Feb  6 23:18:52 IST 2026
**Plugin Version**: 2.8.5

## Smart Detection

Smart detection analyzes your prompts and suggests appropriate workflows:

- **Feature requests** -> /reactree-dev or /reactree-feature
- **Debugging tasks** -> /reactree-debug
- **Refactoring tasks** -> /reactree-dev with refactor focus
- **TDD requests** -> /reactree-feature with test-first mode

### Utility Agents

The plugin also routes to specialized utility agents:

- **file-finder** - Find files by pattern or name
- **code-line-finder** - Find method definitions and usages
- **git-diff-analyzer** - Analyze changes and git history
- **log-analyzer** - Parse Rails server logs

### Configuration Options

- `smart_detection_enabled`: Enable/disable smart detection (default: true)
- `detection_mode`:
  - `suggest` - Show suggestion message (default)
  - `inject` - Automatically inject workflow context
  - `disabled` - Turn off smart detection
- `annoyance_threshold`:
  - `low` - Only trigger for very explicit requests
  - `medium` - Skip simple questions (default)
  - `high` - Trigger for most Rails-related prompts

## Memory Systems

- Working memory: `.claude/reactree-memory.jsonl`
- Episodic memory: `.claude/reactree-episodes.jsonl`
- Feedback queue: `.claude/reactree-feedback.jsonl`

Plugin active and ready.
