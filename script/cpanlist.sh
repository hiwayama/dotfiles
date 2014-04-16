#!/bin/sh

# for perlbrew
# $ curl -L http://install.perlbrew.pl | bash
# $ perlbrew init

# for cpanm
# $ perlbrew install-cpanm
=======
#curl -L http://install.perlbrew.pl | bash
#perlbrew init

# for cpanm
perlbrew install-cpanm
perlbrew install 5.16.3
perlbrew use 5.16.3

# WebFW
cpanm Amon2
cpanm Teng

# Development
cpanm Carton
cpanm Perl::Tidy
cpanm Env::Config
cpanm Data::Dumper
cpanm Term::ANSIColor

