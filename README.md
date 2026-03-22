# Bubblesort in Assembly Language

A bubble sort implementation written in x86-64 NASM assembly for Linux.

## How It Works

The program sorts a hardcoded array of 10 integers using the bubble sort algorithm, then prints the sorted result to stdout. It uses raw Linux syscalls with no C library dependencies.

## Build & Run

```bash
make        # assemble and link
make run    # build and run
make clean  # remove build artifacts
```

## Requirements

- [NASM](https://www.nasm.us/) (Netwide Assembler)
- `ld` (GNU linker)
- Linux x86-64
