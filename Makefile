# put your tex file "foo.tex" in this directory and run "make foo-m2.pdf"

all: sample-m2.pdf
M2 = M2
%.pdf: %.tex
	pdflatex -interaction=nonstopmode $*
	pdflatex -interaction=nonstopmode $*
.SUFFIXES: -m2.tex .m2-out -tex.m2
.PRECIOUS: %-m2.tex %.out %.m2 %.dvi %.pdf %-tex.m2 %.m2-out
%-tex.m2: %.tex process
	./process $< >$@.tmp
	mv $@.tmp $@
%-m2.tex: %.tex %.m2-out merge
	./merge -w 77 $*.tex $*.m2-out >$@.tmp
	mv $@.tmp $@
%.m2-out: %-tex.m2
	@if [ -f $@ ] && cmp -s $^ $^.old ;			\
	 then touch $^-out ;					\
	 else							\
	   echo "--differences forcing M2 to be re-run:";	\
	   (set -x ; diff -u $^ $^.old);			\
	   echo "--running M2 on $^";				\
	   (set -x; ./multiprocess $(M2) <$^ >$@.tmp &&		\
	   mv $@.tmp $@ &&					\
	   cp $^ $^.old ) ||					\
	   exit 1 ;						\
	 fi
clean:; rm -f merge process *.aux *.log *.out *-m2.pdf *-tex.m2 *.m2-out *.old *-m2.tex
