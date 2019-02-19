NAME ?= Genom

DATE := $(shell date "+%Y%m%d-%H%M")

CODE := Kernel-MIUI-tulip

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
	@rm -vf zImage
	@rm -vf modules/system/lib/modules/*.ko
	@rm -vf modules/vendor/lib/modules/qca_cld3/*.ko
	@echo "Done."


