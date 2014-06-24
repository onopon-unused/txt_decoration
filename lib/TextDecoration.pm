package lib::TextDecoration;

use strict;
use warnings;
use lib::DecorationFrame;

use base qw(lib::DecorationFrame);

sub new {
	my $class = shift;
	my $self = $class->SUPER::new;
	$self->add_decoration_rule({"【"=>"title"});
	$self->add_decoration_rule({"<<"=>"comment"});
	return $self;
}


1;
