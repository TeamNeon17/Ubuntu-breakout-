#!/usr/bin/env raku

use Term::ReadKey;

my $paddle-width = 5;
my $paddle = '=====';

my $ball-x = 40;
my $ball-y = 20;
my $ball = 'O';

sub draw-paddle($x) {
    print "\e[?25l"; # Hide cursor
    print "\e[$ball-y;${x}H$paddle";
}

sub draw-ball($x, $y) {
    print "\e[$y;${x}H$ball";
}

sub move-ball() {
    $ball-y--;
}

sub handle-input() {
    my $key = Term::ReadKey.readkey;
    if $key eq 'a' {
        $ball-x--;
    } elsif $key eq 'd' {
        $ball-x++;
    }
}

sub MAIN() {
    loop {
        draw-paddle($ball-x - $paddle-width / 2);
        draw-ball($ball-x, $ball-y);
        move-ball();
        handle-input();
        sleep 0.05;
    }
}
