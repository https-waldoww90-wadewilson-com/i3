#!perl
# vim:ts=4:sw=4:expandtab

use i3test;
use X11::XCB 'WINDOW_CLASS_INPUT_OUTPUT';

my $original_rect = X11::XCB::Rect->new(x => 0, y => 0, width => 30, height => 30);

my $window = $x->root->create_child(
    class => WINDOW_CLASS_INPUT_OUTPUT,
    rect => $original_rect,
    override_redirect => 1,
    background_color => '#C0C0C0',
);

isa_ok($window, 'X11::XCB::Window');

is_deeply($window->rect, $original_rect, "rect unmodified before mapping");

$window->map;

my $new_rect = $window->rect;
isa_ok($new_rect, 'X11::XCB::Rect');

is_deeply($new_rect, $original_rect, "window untouched");

done_testing;
