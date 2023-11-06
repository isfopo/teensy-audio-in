use <index.scad>;
use <rounded_cube.scad>;

module base()
{
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
		mount_hole(diameter = usb_mount_diameter);
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
		x = (location == "front" || location == "back") ? offset : thickness / 2;
		y = (location == "left" || location == "right") ? offset : thickness / 2;
		translate([ x, y, base_height / 2 ])
		rotate([ -90, 0, (location == "left" || location == "right") ? 90 : 0 ])
		cylinder(d = diameter, h = thickness * 2, center = true, $fn = fn);
	}
}
