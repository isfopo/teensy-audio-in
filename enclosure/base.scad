use <index.scad>;
use <rounded_cube.scad>;

module base()
{
	union()
	{
		body();
		screw_mounts([ screw_offest, screw_offest ]);
		screw_mounts([ screw_offest, length + (thickness * 2) - screw_offest ]);
		screw_mounts([ width + (thickness * 2) - screw_offest, length + (thickness * 2) - screw_offest ]);
		screw_mounts([ width + (thickness * 2) - screw_offest, screw_offest ]);
	}
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
