BRANCH :=  $(shell cd .. && git branch | grep \* | cut -d ' ' -f2 | cut -d '-' -f1 && cd AnyKernel2)

ifeq ($(BRANCH), pie);
	BRANCH2 :=  -$(shell cd .. && git branch | grep \* | cut -d ' ' -f2 | cut -d '-' -f2 && cd AnyKernel2)
endif

NAME ?= GenomKernel

COMMIT := $(shell cd .. && git rev-parse --short=8 HEAD && cd AnyKernel2)

DATE := $(shell date "+%Y%m%d")

CODE := vince-2.0

ZIP := $(NAME)$(BRANCH2)-$(CODE)-$(DATE)-$(COMMIT).zip

EXCLUDE := Makefile *.git* *.jar* *placeholder* *.md*

normal: $(ZIP)

$(ZIP):
	@echo "Creating ZIP: $(ZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."


clean:
	@rm -vf *.zip*
	@rm -vf kernel/Image.gz
	@rm -vf treble/msm8953-qrd-sku3-e7-treble.dtb
	@rm -vf nontreble/msm8953-qrd-sku3-e7-non-treble.dtb
	@echo "Done."


