TF ?= terraform

init:
	$(TF) init

plan:
	$(TF) plan

apply-approve:
	$(TF) apply -auto-approve

format:
	$(TF) fmt -recursive 


README.md: README.md.template images.yaml
README.md: gomplate ?= gomplate
README.md: 
	$(gomplate) -f README.md.template -d images.yaml -d tags.yaml | tee README.md

.PHONY: README.md
