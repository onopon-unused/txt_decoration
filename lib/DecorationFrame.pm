package lib::DecorationFrame;

use strict;
use warnings;
use Data::Dumper;
sub new { 
    my $class = shift;
    my $self = {
        rule_list => [],
        rule_count => 0,
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
    $self->{rule_count}++;
}

=head2
rule_listのルールに則って、ファイルデータを書き換える
その後、outputメソッドを呼び出し、指定したファイルパスに書き出す
=cut
sub convert{
	my ($self, $file, $after_file_path) = @_;
	open(TXT_DATA, "< $file") or die("error :$!");
	my @after_text;
	while (my $line = <TXT_DATA>){
 	 	chomp($line);
  		my $set_default = 1;
		for (my $i = 0; $i < $self->{rule_count}; $i++ ){
			my $rule = $self->{rule_list}[$i];
			my @keys = keys $rule->{rule};
			my $key = $keys[0];
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
	close TXT_DATA;
	$self->output($after_file_path, @after_text);
}

=head2
convert時、ルールがない時に呼ばれるメソッド
=cut
sub default {
	my ($self, $text) = @_;
	return "$text";
}

=head2
指定したファイルパスにテキストの配列を1行ずつ書き出す
=cut
sub output {
	my ($self, $after_file_path, @after_text) = @_;
	#ファイルが既に存在していたら削除
	unlink $after_file_path;
	if (!@after_text){
		die("Please convert until output!!");
	}

	open(TXT_DATA, ">> $after_file_path") or die("error :$!");
	for (my $i = 0; $i < @after_text; $i++){
		print TXT_DATA "$after_text[$i]\n";
	}
	close TXT_DATA;
	print "Success making '$after_file_path'！\n";
}

1;
