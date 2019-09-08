use Test::More;
plan tests => 3;

use Capture::Tiny ':all';

use FindBin;

my $example_dir = "$FindBin::Bin/../examples";
my $script      = $example_dir . "/moodulino.pl";

my ( $stdout, $stderr, $exit ) = capture {
    system($script );
};

like( $stdout, qr/caller-stack is empty/,     'caller-stack was empty' );
like( $stdout, qr/running from command line/, 'ran from command line' );

my @args = ( '--custom_opt=foo', );

( $stdout, $stderr, $exit ) = capture {
    system( $script, @args );
};
like( $stdout, qr/custom_opt/, 'custom opt set from command line' );

exit;

__END__

