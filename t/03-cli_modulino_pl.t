use Test::More;
plan tests => 6;

use Capture::Tiny ':all';

use FindBin;

my $example_dir = "$FindBin::Bin/../examples";
my $script      = $example_dir . "/moodulino.pl";

TODO: {
    local $TODO = 'system() might not be a new process';

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
}

my $out = `$script --custom_opt=foo`;
like( $out, qr/caller-stack is empty/,     'caller-stack was empty' );
like( $out, qr/running from command line/, 'ran from command line' );
like( $out, qr/custom_opt/,                'custom opt set from command line' );

exit;

__END__

