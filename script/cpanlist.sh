#!/bin/sh

# for perlbrew
# $ curl -L http://install.perlbrew.pl | bash
# $ perlbrew init

# for cpanm
# $ perlbrew install-cpanm

# WebFW
cpanm Amon2
cpanm Teng

# Development
cpanm Carton
cpanm Perl::Tidy
cpanm Env::Config Data::Dumper Reply
cpanm Term::ANSIColor

