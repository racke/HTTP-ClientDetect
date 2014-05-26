# This tag returns a (kind of) compatible object for the purposes of
# the HTTP::ClientDetect package

Usertag dancer_request Routine <<EOR
use Interchange6::Plugin::Interchange5::Request;
sub {
    # do a shallow copy of the env
    my %env = %{::http()->{env}};
    return Interchange6::Plugin::Interchange5::Request->new(env => \%env);
}
EOR
