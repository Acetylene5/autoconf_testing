FC = @F77@
ACLOCAL_AMFLAGS = -I ./m4

OBJECTS = test.f junk.f

COMMON = Stuff.com

all:	test

test: $(OBJECTS)
	$(FC) $(OBJECTS) -o test $(LAPACK_LIBS) $(BLAS_LIBS) $(LIBS) $(FLIBS)

clean:; 	rm *.o	;