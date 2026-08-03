# Neovim config review plan

## Problem
Review the Neovim configuration in this repository (.config/nvim) and produce actionable improvements and fixes, with emphasis on AI integrations and TypeScript/JavaScript workflows.

## Proposed approach
- Inventory current config files and plugins
- Perform static analysis (Lua linting) and runtime checks (headless Neovim) to detect errors
- Evaluate startup performance and plugin loading strategy
- Audit plugin sources for security and maintenance
- Assess AI integrations (Copilot, copilot-cmp, cloud credentials), privacy and telemetry
- Validate TypeScript/JavaScript LSP, completion, and formatting (tsserver/typescript-language-server, eslint, prettier)
- Propose prioritized fixes and implement minimal changes
- Document recommendations and open PR(s) for changes

## Workplan
- [ ] Inventory files and plugins (list files, plugin manager and plugin list)
- [ ] Identify AI-related plugins and configuration (copilot.lua, copilot-cmp, related settings)
- [ ] Check for any credentials, tokens, or credential-loading patterns in config; recommend secure handling
- [ ] Run static analysis (luacheck or equivalent) on Lua config
- [ ] Run Neovim headless to surface runtime errors
- [ ] Verify completion pipeline: nvim-cmp, copilot-cmp, luasnip integration and source priorities
- [ ] Validate TypeScript/JavaScript LSP setup (tsserver / typescript-language-server), ESLint integration, and conform/prettier formatting on save
- [ ] Measure startup time and identify slow plugins or eager loads
- [ ] Audit plugin sources and pin versions where appropriate
- [ ] Propose prioritized improvements and implement small fixes (minimal surgical edits)
- [ ] Verify changes do not break config; update documentation

## Notes / considerations
- Located at: .config/nvim/init.lua
- User note: primary use is TypeScript and JavaScript development
- AI focus: Copilot and cloud AI setup, credential handling, and completion integration are in-scope

## Status
- Plan saved. Awaiting confirmation to start the review and which tasks to prioritize next (e.g., start with correctness/runtime checks or AI credential audit).
