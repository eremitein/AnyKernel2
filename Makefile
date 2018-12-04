NAME ?= Genom

DATE := $(shell date "+%Y%m%d-%H%M")

CODE := Sakura-MIUI-CAF

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
	@rm -vf kernel/*.gz
	@rm -vf treble/*.dtb
	@rm -vf modules/system/lib/modules/*.ko
	@rm -vf modules/system/vendor/lib/modules/*.ko
	@rm -vf modules/system/vendor/lib/modules/pronto/*.ko
	@echo "Done."


