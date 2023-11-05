include <base.scad>;

width = 100;
length = 50;
thickness = 3;

base_height = 25;
plate_height = 5;
height = base_height + plate_height;

corner_radius = 3;

jack_mount_diameter = 6;
usb_mount_diameter = 12;

screw_diameter = 3;
screw_head_diameter = 4;
screw_head_height = 2;
screw_offest = 4;

fn = 100;

base();
