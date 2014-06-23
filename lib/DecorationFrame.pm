package lib::DecorationFrame;

use strict;
use warnings;

sub new { 
    my $class = shift;
    my $self = {
        decoration_list => [],
    };
    return bless $self, $class;
}

sub decorate{
    my ($self, %params) = @_;
}

sub convert{

}

1;
