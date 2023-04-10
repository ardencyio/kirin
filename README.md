# K i r i n

exlploring edgedb, rust and error testing with fixtures, cases and mocks.

## features
- edgedb
- clean architecture
- modular application
- custom errors
- mocks using mockall
- fixtures, cases using rstest

## edgedb setup

run the following commands in the project folder

```sh
# create a new edgedb project
$ edgedb project init
# launch the admin ui
$ edgedb ui
```
note this codebase connects to the database assuming local instance and not using `dsn` or other `credentials` via the config `Builder`.

```sh
# list available commands
$ just -l

# outputs following
Available recipes:
bacon   # use bacon code checker
bc      # alias for `bacon`
build   # build project
b       # alias for `build`
check   # run cargo check
c       # alias for `check`
clippy  # everyone's favorite animate paper clip
grcov   # code coverage
g       # alias for `grcov`
nextest # run tests with nextest
nt      # alias for `nextest`
pl      # git pull
ps      # git push
run     # run application
test    # run tests
t   
```

## useful links
- [edgedb-rust](https://github.com/edgedb/edgedb-rust)
- [rstests](https://github.com/la10736/rstest)
- [mockall](https://github.com/asomers/mockall)
