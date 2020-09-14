PYTHON = python3
VENV = .venv
VENV_PIP = $(VENV)/bin/pip
VENV_PYTHON = $(VENV)/bin/python
VENV_DONE = $(VENV)/.done

.PHONY: venv
venv: $(VENV_DONE)

.PHONY: clean
clean:
	git clean -ffdX

$(VENV_DONE): $(MAKEFILE_LIST) requirements.txt
	$(PYTHON) -m venv --system-site-packages $(VENV)
	$(VENV_PIP) install -r requirements.txt
	touch $@
