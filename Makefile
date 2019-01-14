NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m
XC_ARCH = "darwin/amd64 darwin/386 linux/amd64 linux/386 windows/amd64 windows/386"

all: fmt test build

build:
	@echo "$(OK_COLOR)==> Building orange-cat$(NO_COLOR)"
	@go install ./...
	@echo "$(OK_COLOR) => Done$(NO_COLOR)"

fmt:
	@echo "$(OK_COLOR)==> Fmt'ing source codes$(NO_COLOR)"
	@if scripts/gofmt.sh; \
		then echo "$(OK_COLOR) => Done$(NO_COLOR)"; \
		else echo "$(WARN_COLOR) => Fmt'ed$(NO_COLOR)"; exit 1; \
	fi

test:
	@echo "$(OK_COLOR)==> Testing modules$(NO_COLOR)"
	@go test -ginkgo.v
	@echo "$(OK_COLOR) => Done$(NO_COLOR)"


xctoolchain:
	@gox -osarch=$(XC_ARCH) -build-toolchain

xc: gox
	@echo "$(OK_COLOR)==> Compiling into multiple targets$(NO_COLOR)"
	@go get github.com/mitchellh/gox
	@gox -osarch=$(XC_ARCH) -output="./out/{{.OS}}_{{.Arch}}/orange" ./cmd/orange
	@scripts/zip_output.sh
	@echo "$(OK_COLOR) => Done$(NO_COLOR)"

clean:
	@echo "$(OK_COLOR)==> Cleaning$(NO_COLOR)"
	@rm -rf ./out
	@echo "$(OK_COLOR) => Done$(NO_COLOR)"
