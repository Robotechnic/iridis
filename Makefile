link :
	mkdir -p ~/.cache/typst/packages/preview/iridis
	ln -s "$(CURDIR)" ~/.cache/typst/packages/preview/iridis/0.1.0

clean-link:
	rm -rf ~/.cache/typst/packages/preview/iridis

module:
    sh ./generate_images.sh
	mkdir -p ./iridis
	cp ./typst.toml ./iridis/typst.toml
	cp ./LICENSE ./iridis/LICENSE
	cp ./lib.typ ./iridis/lib.typ
	awk '/<!--EXCLUDE-->/, /<!--END-->/ {next} 1' ./README.md > ./iridis/README.md
