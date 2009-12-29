#!/usr/bin/perl

my $pattern = $ARGV[0];

while($_=<STDIN>)
{
   if ( $_ =~ m/\+coltrace\+/ .. $_ =~ m/-coltrace-/)
   {
      print $_  unless $_ =~ m/[+-]$pattern[+-]/
   }
}
