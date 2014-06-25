package lib::TextDecoration;

use strict;
use warnings;
use lib::DecorationFrame;
use Encode qw(decode);
use base qw(lib::DecorationFrame);

sub new {
	my $class = shift;
	my $self = $class->SUPER::new;
	$self->add_decoration_rule({"【"=>"title"});
	$self->add_decoration_rule({"<<"=>"comment"});
	return $self;
}

sub title {
	my ($self, $text) = @_;
	$text =~ s/【//;
#	my $length = length $text;
	my $length = length(decode('utf-8', $text));
	my $deco;
	for (my $i = 0; $i < $length; $i++){
		$deco .= "〜";
	}
	my $title = "|$text|";
	$deco = "*$deco*";
	return ($deco,$title,$deco);
}

sub comment {
	my ($self, $text) = @_;
	$text =~ s/<<//;
#	my $length = length $text;
	my $length = length(decode('utf-8', $text));
	my $deco;
	for (my $i = 0; $i < $length; $i++){
		$deco .= "〜";
	}
	my $comment = "|$text|";
	$deco = "*$deco*";	
	return ($deco,$comment,$deco);
}
1;
