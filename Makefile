NAME ?= GenomKernel

DATE := $(shell date "+%Y%m%d-%H%M")

CODE := Pie-CAF

ZIP := $(NAME)-$(CODE)-$(DATE).zip

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


