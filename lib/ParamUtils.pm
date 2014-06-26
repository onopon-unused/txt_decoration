package lib::ParamUtils;

use strict;
use warnings;
=head2
 get_param()
 データがあればそのまま返し、無ければundefを返す
=cut
sub get_param {
    my ($self,$param) = shift;
    return $param if $param;
    return;
}

=head2
 exist_params()
 任意のデータが全て存在するか確認する
 1つでもデータが無ければdieする
 まだ未完成
=cut
#sub exist_params {
#    my ($self, @params) = @_;
#    foreach my $param (@params){
#        die if !$param;
#    }
#}

1;
