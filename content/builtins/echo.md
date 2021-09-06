---
title: "echo | printf"
date: 2021-08-24T11:34:59-04:00
draft: true
---

`echo` and `printf` are simple, commonly used commands for explicitly printing
a line of output. They demonstrate almost identical functionality when provided
a single argument (the characters to print), although `echo` will automatically append
a newline while `printf` will not. They can be useful within scripts for logging
information as well as quick file creation on the command line.

## Usage Examples

Print a string to standard output.

```bash
$ echo hello
```

Use redirection to quickly create a new file.

```bash
$ echo "file contents" > newfile.txt
```

_(Any existing newfile.txt will be overwritten)._

Print a table to standard output using escape sequences.

```bash
#./echotable.sh

keys=(first second third fourth fifth)
values=(alpha beta gamma delta epsilon)


for i in ${!keys[@]}; do 
  echo -e "${keys[$i]}\t${values[$i]}"
done

#first    alpha
#second   beta
#third    gamma
#....     ....
```

## Notes

- `printf` is the command line version of the C _stdio.h_ function. One can use
`man 3 printf` to read more.
