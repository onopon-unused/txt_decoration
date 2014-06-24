package lib::DecorationFrame;

use strict;
use warnings;
use Data::Dumper;

sub new { 
    my $class = shift;
    my $self = {
        decoration_list => [],
    };
    return bless $self, $class;
}


=head2
 add_decoration_rule()
 先頭の文字列の規則によって、どのメソッドを動かすかを決定する
=cut
sub add_decoration_rule{
    my ($self, $params) = @_;
    	push ($self->{decoration_list}, {rule=>$params});
}

sub convert{
	my ($self) = @_;
	my @a = $self->{decoration_list};

	for (my $i = 0; $i < @a; $i++ ){
		my $rule = $self->{decoration_list}[$i];
		print Dumper $rule->{rule};
	}
#	foreach my $rule ($self->{decoration_list}){
#		print Dumper $self->{decoration_list}[0]->{key};
#	}
}

1;
