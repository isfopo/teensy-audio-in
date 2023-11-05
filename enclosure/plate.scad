use <index.scad>;
use <rounded_cube.scad>;

module plate()
{
	difference()
	{
		body();
		screw_hole([ screw_offest, screw_offest ]);
		screw_hole([ screw_offest, length + (thickness * 2) - screw_offest ]);
		screw_hole([ width + (thickness * 2) - screw_offest, length + (thickness * 2) - screw_offest ]);
		screw_hole([ width + (thickness * 2) - screw_offest, screw_offest ]);
	}
}

module body()
{
	doubled_thickness = thickness * 2;
	linear_extrude(height = plate_height)
	{
		translate([ corner_radius, corner_radius, 0 ])
		minkowski()
		{
			square([ width + thickness - corner_radius, length + thickness - corner_radius ]);
			circle(corner_radius, $fn = 100);
		}
	}
}

module screw_hole(location = [ 0, 0 ])
{

	translate([ location[0], location[1], 0 ])
	union()
	{
		cylinder(d2 = screw_diameter, d1 = screw_head_diameter, h = screw_head_height, $fn = fn);
		cylinder(h = plate_height, d = screw_diameter, $fn = fn);
	}
}
