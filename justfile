#!/usr/bin/env -S just --justfile
# ^ A shebang isn't required, but allows a justfile to be executed
#   like a script, with `./justfile test`, for example.


# aliases
alias bc := bacon
alias b := build
alias t := test
alias c := check
alias nt := nextest
alias g := grcov

# export environment variables
export CARGO_INCREMENTAL := '0' 
export RUSTFLAGS := '-Cinstrument-coverage' 
export LLVM_PROFILE_FILE := './profiles/tenchi-%p-%m.profraw' 


# use bacon code checker
bacon:
	bacon

# build project
build:
	cargo build
		
# run cargo check
check:
	cargo check

# everyone's favorite animate paper clip
clippy:
  cargo clippy --all --all-targets --all-features

# code coverage
grcov:
	grcov . \
		--binary-path ./target/debug/ \
		-s . \
		-t html \
		--branch \
		--ignore-not-existing \
		-o ./coverage/

# git push
ps:
	git push origin $(git rev-parse --abbrev-ref HEAD)
# git pull
pl:
	git pull origin $(git rev-parse --abbrev-ref HEAD)

# run tests
test:
	cargo test

# run application
run:
	cargo run

# run tests with nextest
nextest:
	cargo nextest run