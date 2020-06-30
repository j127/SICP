# Structure and Interpretation of Computer Programs

To run a `.scm` script from the terminal:

```text
$ scheme < script.scm
```

To suppress the REPL, do this:

```text
$ scheme --quiet < script.scm
```

Readline support:

```text
$ sudo apt update && sudo apt install rlwrap
$ rlwrap scheme
```

Edwin editor:

```text
alias edwin="mit-scheme -eval \"(edit 'console)\""
```
