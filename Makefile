default: all

SRC = $(shell find src -name "*.coffee" -type f | sort)
LIB = $(SRC:src/%.coffee=lib/dog/%.js) lib/dog/parser.js
TESTS = $(shell find test -name "*.coffee" -type f | sort)
ROOT = $(shell pwd)

COFFEE = node_modules/.bin/coffee --bare --compile --print
PEGJS = node_modules/.bin/pegjs --track-line-and-column --cache
MOCHA = node_modules/.bin/mocha --compilers coffee:coffee-script -u exports --require ./test/test_helper.js
MINIFIER = node_modules/.bin/uglifyjs --no-copyright --mangle-toplevel --reserved-names require,module,exports,global,window

all: $(LIB)
build: all
parser: lib/dog/parser.js
minify: $(LIBMIN)

lib:
	mkdir lib/

lib/dog: lib
	mkdir -p lib/dog/

lib/dog/parser.js: src/grammar.pegjs lib/dog
	printf %s "module.exports = " >"$(@:%=%.tmp)"
	$(PEGJS) <"$<" >>"$(@:%=%.tmp)"
	mv "$(@:%=%.tmp)" "$@"

lib/dog/%.min.js: lib/dog/%.js lib/dog
	$(MINIFIER) <"$<" >"$@"

lib/dog/%.js: src/%.coffee lib/dog
	$(COFFEE) "$<" > "$(@:%=%.tmp)" && mv "$(@:%=%.tmp)" "$@"

.PHONY: test coverage install loc clean

test: $(LIB) $(TESTS)
	$(MOCHA) -R nyan

coverage: $(LIB)
	@which jscoverage || (echo "install node-jscoverage"; exit 1)
	rm -rf instrumented
	jscoverage -v lib instrumented
	$(MOCHA) -R dot
	$(MOCHA) -r instrumented/dog/compiler -R html-cov > coverage.html
	@xdg-open coverage.html &> /dev/null

install: $(LIB)
	npm install -g .

loc:
	wc -l src/*

clean:
	rm -rf instrumented
	rm -f coverage.html
	rm -rf lib