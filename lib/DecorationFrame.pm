package lib::DecorationFrame;

use strict;
use warnings;
use Data::Dumper;
sub new { 
    my $class = shift;
    my $self = {
        rule_list => [],
        count => 0,
    };
    return bless $self, $class;
}


=head2
 add_decoration_rule()
 先頭の文字列の規則によって、どのメソッドを動かすかを決定する
=cut
sub add_decoration_rule{
    my ($self, $params) = @_;
    	push ($self->{rule_list}, {rule=>$params});
    	$self->{count}++;
}

sub convert{
	my ($self, $file) = @_;
	my @text = (
		"【タイトルだよん",
		"内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容",
		"ヤバい、	ゲシュタルト崩壊しそうw",
		"<<コメントだよん",
		"コメコメ");
	my @after_text;
	foreach my $line (@text){
		my $set_default = 1;
		for (my $i = 0; $i < $self->{count}; $i++ ){
			my $rule = $self->{rule_list}[$i];
			my @keys = keys $rule->{rule};
			my $key = $keys[0];
			#print Dumper $rule->{rule}{$key};
			if ($line =~ /^$key/){
				my $method = $rule->{rule}{$key};
				push (@after_text, $self->$method($line));
				$set_default = 0;
				last;
			}
		}
		if ($set_default){
			my $res = $self->default($line);
			push (@after_text, $res);
		}
	}
	print Dumper @after_text;
}

sub default {
	my ($self, $text) = @_;
	return "default;"
}

1;
