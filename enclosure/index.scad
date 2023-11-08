include <base.scad>;
include <plate.scad>;

width = 100;
length = 60;
thickness = 3;

base_height = 40;
plate_height = 2;
height = base_height + plate_height;

corner_radius = 3;

jack_mount_diameter = 10;
usb_mount_diameter = 24;

screw_diameter = 2;
screw_head_diameter = 6;
screw_head_height = 3;
screw_offest = 5;

fn = 100;

base();

//plate();
