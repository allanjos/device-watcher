#!/usr/bin/perl

# Allann Jones

use strict;
use warnings;

my $fs_path = '/sys/kernel/debug/usb/devices';

open(my $file_handle, "<", $fs_path) or die "Can't open $fs_path: $!";

while (my $line = <$file_handle>) {
    chomp $line;

    print $line, "\n";

    if ($line =~ /^T:/) {
        print "BUS ID\n";

        $line =~ s/^T:\s*//;
        $line =~ s/=\s+/=/g;

        if ($line =~ /Bus\s*=\s*([0-9]+)\s+Lev\s*=\s*([0-9]+)\s+Prnt\s*=\s*([0-9]+)\s+Port\s*=\s*([0-9]+)\s+Cnt\s*=\s*([0-9]+)\s+Dev#\s*=\s*([0-9]+)\s*Spd\s*=\s*([0-9]+(?:\.[0-9]+)*)\s+MxCh\s*=\s*([0-9]+)/) {
            print "Bus=$1\n";
            print "Lev=$2\n";
            print "Prnt=$3\n";
            print "Port=$4\n";
            print "Cnt=$5\n";
            print "Dev#=$6\n";
            print "Spd=$6\n";
            print "MxCh=$6\n";
        }
        else {
            print "ERROR at ", $line, "\n";
            exit 1;
        }
    }
    elsif ($line =~ /^P:/) {
        print "PRODUCT\n";

        $line =~ s/^P:\s*//;
        $line =~ s/=\s+/=/g;

        if ($line =~ /Vendor\s*=\s*([0-9]+)\s+ProdID\s*=\s*([0-9]+)\s+Rev\s*=\s*([0-9]+)/) {
            print "Bus=$1\n";
            print "Lev=$2\n";
            print "Prnt=$3\n";
            print "Port=$4\n";
            print "Cnt=$5\n";
            print "Dev#=$6\n";
            print "Spd=$6\n";
            print "MxCh=$6\n";
        }
        else {
            print "ERROR at ", $line, "\n";
            exit 1;
        }
    }
}

close($file_handle);
