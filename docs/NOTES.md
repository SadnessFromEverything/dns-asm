## Weekend 1 — [today's date]
- Set up repo, toolchain (nasm + ld), Makefile
- Wrote banner/help arg parser with -h and -p stubs
- Fought dpkg on WSL; resolved
- Current behavior: `./dnsd -h` prints banner + help, exits 0;
  `./dnsd` exits 1 (deliberate — revisit when daemon path exists)
- Next: socket() + bind() smoke test