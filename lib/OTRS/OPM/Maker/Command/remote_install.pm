package OTRS::OPM::Maker::Command::remote_install;

# ABSTRACT: install OTRS packages on a remote OTRS instance

use strict;
use warnings;

use OTRS::OPM::Maker -command;

sub abstract {
    return "install package in OTRS instance";
}

sub usage_desc {
    return "opmbuild remote_install --host <host> --token <token> --user <user> [--test [--format <format>]] <path_to_opm>";
}

sub opt_spec {
    return (
        [ "host=s", "hostname of remote OTRS instance" ],
        [ "token=s", "API token for remote OTRS instance" ],
        [ "user=s", "username for remote OTRS instance" ],
        [ "test", "run tests on remote OTRS instance" ],
        [ "format", "format of test output (TAP or JUnit)" ],
    );
}

sub validate_args {
    my ($self, $opt, $args) = @_;
    
    $self->usage_error( 'need path to .opm' ) if
        !$args ||
        !$args->[0] ||
        !$args->[0] =~ /\.opm\z/ ||
        !-f $args->[0];
}

sub execute {
}

1;

__END__
=pod

=head1 NAME

OTRS::OPM::Maker::Command::remote_install - install OTRS packages on a remote OTRS instance

=head1 VERSION

version 0.02

=head1 AUTHOR

Renee Baecker <module@renee-baecker.de>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Renee Baecker.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=cut

