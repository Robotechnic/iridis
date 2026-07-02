VERSION := $(shell sed -n 's/^version\s*=\s*"\(.*\)"/\1/p' typst.toml)
PACKAGE_NAME := $(shell sed -n 's/^name\s*=\s*"\(.*\)"/\1/p' typst.toml)
TARGET_DIR=./$(PACKAGE_NAME)/$(VERSION)

link :
	mkdir -p ~/.cache/typst/packages/preview/$(PACKAGE_NAME)
	ln -s "$(CURDIR)" ~/.cache/typst/packages/preview/$(PACKAGE_NAME)/$(VERSION)

clean-link:
	rm -rf ~/.cache/typst/packages/preview/$(PACKAGE_NAME)

module:
	mkdir -p $(TARGET_DIR)
	cp ./typst.toml $(TARGET_DIR)/typst.toml
	cp ./LICENSE $(TARGET_DIR)/LICENSE
	cp ./README.md $(TARGET_DIR)/README.md
	cp ./*.typ $(TARGET_DIR)/
	sed -i "s/\/master\//\/$(VERSION)\//g" $(TARGET_DIR)/README.md
	sed -i '/<!--EXCLUDE-->/,/<!--END-->/d' $(TARGET_DIR)/README.md
