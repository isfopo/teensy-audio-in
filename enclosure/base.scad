use <index.scad>;
use <rounded_cube.scad>;

module base()
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
