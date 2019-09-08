#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    require_ok('MooX::Role::Modulino') || print "Bail out!\n";
}

diag("Testing MooX::Role::Modulino $MooX::Role::Modulino::VERSION, Perl $], $^X"
);

exit;
__END__
