use <index.scad>;
use <rounded_cube.scad>;

module base()
{
	jack_spacing = length / 2.5;
	difference()
	{
		union()
		{
			body();
			screw_mounts([ screw_offest, screw_offest ]);
			screw_mounts([ screw_offest, length + (thickness * 2) - screw_offest ]);
			screw_mounts([ width + (thickness * 2) - screw_offest, length + (thickness * 2) - screw_offest ]);
			screw_mounts([ width + (thickness * 2) - screw_offest, screw_offest ]);
		}
		mount_hole(diameter = usb_mount_diameter, location = "left", offset = (length / 2) + thickness);
		mount_hole(diameter = jack_mount_diameter, location = "right",
		           offset = ((length / 2) + thickness) + jack_spacing / 2);
		mount_hole(diameter = jack_mount_diameter, location = "right",
		           offset = ((length / 2) + thickness) - jack_spacing / 2);
	}

	module body()
	{
		doubled_thickness = thickness * 2;

		difference()
		{
			rounded_cube([ width + doubled_thickness, length + doubled_thickness, base_height + thickness ],
			             radius = corner_radius, apply_to = "zmin");
			translate([ thickness, thickness, thickness ])
			rounded_cube([ width, length, base_height ], radius = corner_radius, apply_to = "zmin");
		}
	}

	module screw_mounts(location = [ 0, 0 ])
	{
		translate([ location[0], location[1], thickness ])
		difference()
		{
			cylinder(d = corner_radius * 2, h = base_height, $fn = fn);
			cylinder(d = screw_diameter, h = base_height, $fn = fn);
		}
	}

	module mount_hole(diameter = 3, location = "front", offset = width / 2)
	{
		front_or_back = (location == "front" || location == "back");
		left_or_right = (location == "left" || location == "right");
		x = front_or_back ? offset : location == "left" ? 0 : width + thickness;
		y = left_or_right ? offset : location == "front" ? 0 : height + thickness;
		translate([ x, y, (base_height / 2) + thickness ])
		rotate([ front_or_back ? -90 : 90, 0, (location == "left" || location == "right") ? 90 : 0 ])
		cylinder(d = diameter, h = thickness, $fn = fn);
	}
}
