Macaulay2 merge
===============

The programs in this package are designed to make it possible to incorporate
Macaulay2 code into a TeX file.  The code, delimited by "<<<" and ">>>" in the
input file, is automatically submitted to Macaulay2, and the results are
incorporated into the output file.

## Usage

Ensure that a C compiler is installed as ```cc``` and that the program
```make``` installed.

Put your TeX file, ```foo.tex```, say, formatted the way ```sample.tex``` is,
in this directory and run the following command.
```
    make foo-m2.pdf
```
The resulting file ```foo-m2.pdf``` should be ready for viewing or printing.
