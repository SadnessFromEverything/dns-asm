# dns-asm

Purpose of this repo is to design an authoritative DNS server with the most obnoxious language one could choose and thats x86-64 NASM assembly.
The end goal is to have an DNS authoritative server that runs natively on Linux raw system calls and Windows Sockets (Winsock), follow this great adventure of mine, where most if not all of the time I'll be shooting myself into the foot.

## Status
- Weekend 1 of ~16. Repo skeleton + socket smoke test.

## Build
- Linux:   make
- Windows: build.bat

## Run
./dnsd -p 5353 -z zones/example.zone

## Test
- make test

## Control GUI
- python3 gui/dns-gui.py   # connects to localhost:5354

## Docs
- See docs/NOTES.md for the development journal.
- See docs/ARCHITECTURE.md for how it works.
- See docs/RESOURCES.md for the list of literature and resources used in the development.