##
## EPITECH PROJECT, 2025
## B-FUN-400-NAN-4-1-wolfram-albane.merian
## File description:
## Makefile
##

NAME = wolfram

COVLOC = .stack-work/install/*/*/*/hpc/$(PNAME)/$(UNIT)/*.tix

UNIT = wolfram-test

PNAME = wolfram

all: $(NAME)

$(NAME):
	stack build
	cp `stack path --local-install-root`/bin/$(NAME) .

re: fclean all

clean:
	stack clean

fclean: clean
	rm -f $(NAME)
	rm -rf *.cabal
	rm -rf *.lock
	rm -rf .stack-work

norm:
	rm -f *.hi *.o
	rm -f $(NAME)
	coding-style . .
	cat coding-style-reports.log

tests_run: fclean
	stack test --coverage
	mkdir -p test/coverage
	mv $(COVLOC) test/coverage
