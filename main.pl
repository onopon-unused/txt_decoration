use strict;
use warnings;

use lib::ParamUtils;
use lib::TextDecoration;

my $text_deco = lib::TextDecoration->new;
$text_deco->convert("./sample.txt","./sample_deco.txt");
