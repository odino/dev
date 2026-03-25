REPO_DIR    := $(shell git -C $(dir $(abspath $(lastword $(MAKEFILE_LIST)))) rev-parse --show-toplevel)
SKILLS_SRC  := $(REPO_DIR)/agents/skills
CLAUDE_SKILLS := $(HOME)/.claude/skills

.PHONY: install
install: install-skills install-agent install-memories

.PHONY: install-skills
install-skills:
	@for skill in $(SKILLS_SRC)/*/; do \
		name=$$(basename $$skill); \
		target=$(CLAUDE_SKILLS)/$$name; \
		ln -sfn $$skill $$target && echo "Linked skill: $$name"; \
	done

.PHONY: install-agent
install-agent:
	ln -sfn $(REPO_DIR)/agents/personal.agent.md $(HOME)/personal.agent.md
	@echo "Linked personal.agent.md"
	ln -sfn $(REPO_DIR)/agents/CLAUDE.md $(HOME)/CLAUDE.md
	@echo "Linked CLAUDE.md"
	ln -sfn $(REPO_DIR)/agents/settings.json $(HOME)/.claude/settings.json
	@echo "Linked settings.json"

.PHONY: install-memories
install-memories:
	ln -sfn $(REPO_DIR)/agents/memories $(HOME)/memories
	@echo "Linked memories/"
