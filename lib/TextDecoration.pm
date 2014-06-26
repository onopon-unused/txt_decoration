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

=head2
タイトルを生成する
=cut
sub title {
	my ($self, $text) = @_;
	$text =~ s/【//;
	$text = "　　　$text　　　";
	my $length = length(decode('utf-8', $text));
	my $deco;
	my $deco_length = 0;
	for (my $i = 0; $i < $length; $i++){
		$deco .= "＝";
	}
	my $title = "|$text|";
	$deco = "*$deco*";
	return ("\n",$deco,$title,$deco);
}

=head2
コメントを生成する
=cut
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
	return ("\n",$deco,$comment,$deco);
}
1;
