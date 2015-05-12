
module leg()
{
	legthickness=4;
	minkowski()
	{
		intersection() 
		{
			union()
			{
				resize([90,140,legthickness])
				{
					difference() {
						cylinder(r=140,h=legthickness,center=false,$fn=100);
						cylinder(r=128,h=legthickness,center=false,$fn=100);
					}
				}
	
				resize([18*2,160,thickness])
				{
					difference() {
						cylinder(r=140,h=legthickness,center=false,$fn=100);
						cylinder(r=118,h=legthickness,center=false,$fn=100);
					}
				}
			
				translate([17,0,0])
				{
					cube([28, 4,legthickness], center=false);
				}
	
				translate([16.5,33,0])
				{
					rotate(a=[0,0,60])
					{
						cube([24, 4,legthickness], center=false);
					}
				}
				translate([16,33,0])
				{
					rotate(a=[0,0,-30])
					{
						cube([27, 4,legthickness], center=false);
					}
				}
				translate([18,3,0])
				{
					rotate(a=[0,0,35])
					{
						cube([28, 4,legthickness], center=false);
					}
				}
			}
			translate([6,0,0])
			{
				cube([50,68,legthickness]);
			}

		}
		rotate(a=[45,45,45])
		{
			sphere(1, center=true);
		}
	}
}
resize([40,70,4])
{
	leg();
}