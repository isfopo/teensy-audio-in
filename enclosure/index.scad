include <base.scad>;
include <plate.scad>;

width = 100;
length = 50;
thickness = 3;

base_height = 25;
plate_height = 2;
height = base_height + plate_height;

corner_radius = 3;

jack_mount_diameter = 6;
usb_mount_diameter = 12;

screw_diameter = 3;
screw_head_diameter = 4;
screw_head_height = 2;
screw_offest = 5;

fn = 100;

plate();
