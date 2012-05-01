use strict;
use warnings;
use utf8;
use Getopt::Long;

my $input = "";
my $output = "";

GetOptions('input=s' => \$input, 'output=s' => \$output);

if ($output eq "") {
	$output = $input;
}

open INPUT, "<", $input or die$!;
my @wordlist;
while(<INPUT>) {
	my $word = $_;
	chomp($word);
	push(@wordlist, $word);
}
close(INPUT);

#remove multiple occurences of the same word
my %wordlistHash = ();
foreach my $word (@wordlist) {
	$wordlistHash{$word} = 1;
}

@wordlist = keys(%wordlistHash);
@wordlist = sort(@wordlist); 

open OUTPUT, ">", $output or die$!;
for my $word (@wordlist) {
	print OUTPUT $word . "\n";
}
close(OUTPUT);