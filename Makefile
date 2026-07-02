VERSION := $(shell sed -n 's/^version\s*=\s*"\(.*\)"/\1/p' typst.toml)
PACKAGE_NAME := $(shell sed -n 's/^name\s*=\s*"\(.*\)"/\1/p' typst.toml)

link :
	mkdir -p ~/.cache/typst/packages/preview/$(PACKAGE_NAME)
	ln -s "$(CURDIR)" ~/.cache/typst/packages/preview/$(PACKAGE_NAME)/$(VERSION)

clean-link:
	rm -rf ~/.cache/typst/packages/preview/$(PACKAGE_NAME)

module:
	sh ./generate_images.sh
	mkdir -p ./$(PACKAGE_NAME)
	cp ./typst.toml ./$(PACKAGE_NAME)/typst.toml
	cp ./LICENSE ./$(PACKAGE_NAME)/LICENSE
	cp ./*.typ ./$(PACKAGE_NAME)/
	awk '/<!--EXCLUDE-->/, /<!--END-->/ {next} 1' ./README.md > ./$(PACKAGE_NAME)/README.md
