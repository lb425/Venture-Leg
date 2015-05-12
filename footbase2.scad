
numberOfScrewHoles = 4;

//Base Parameters
    radius = 14  ;
    height = 5.9 ;
	
	lowerThickness = 2 ;
//Diameter of Screw bolt
	screwSize = 3.1 ;
//Diameter of head size
	headSize = 6.8;

totalThickness=30;


module foot ()
{
//millimeters


//Hole distance for the center
	distFromCenter = 12;
//	translate([-2,-8,0])
//		cube([4, 16,3], center=false);

	difference() {
		cylinder(r=radius,h=height,center=false,$fn=100);
		holePattern( numberOfScrewHoles, lowerThickness, screwSize/2, headSize/2, distFromCenter );
		translate([0,0,height])
			rotate(a=[180,0,45])
				baseScrews();
}


//	difference() {
//		cylinder(r=radius,h=height,center=false,$fn=100);
//		cylinder(r=25/2,h=height,center=false,$fn=100);
//		holePattern( numberOfScrewHoles, lowerThickness, screwSize/2, headSize/2, distFromCenter );
//		translate([4.5,-15,0])
//			cube([20, 30,7], center=false);
//		mirror([1,0,0])
//			translate([4.5,-15,0])
//				cube([20, 30,7], center=false);
//	}
}

module screwHole (screwSize, headSize, lowerThickness)
{
	////Hole models are 13 mm
	cylinder(r=screwSize, h=totalThickness, center = false, $fn=100);
		translate([0,0,lowerThickness])
			cylinder(r=headSize, h=totalThickness-lowerThickness, center = false, $fn=100);
}

//module mountHoles (number, lowerThickness, screwSize, headSize)
module holePattern (number, lowerThickness, screwSize, headSize, distFromCenter)
{
	////Hole models are 13 mm
	totalThickness=13;
	for ( i = [0:number-1] ) {
		rotate(i*360/number)
			translate([distFromCenter,0,0]) 
				screwHole (screwSize, headSize, lowerThickness);
	}
}
//screwHole(1,2,5);
//holePattern(4,7,1,2,5);
foot();
//sphere(2, $fn=100);

//translate([0,0,-6])
//	cylinder(h= 6, r1 = 5, r2 = 8, center = false, $fn=100);
//translate([0,0,-36])
//	cylinder(h= 30, r1 = 4, r2 = 5, center = false, $fn=100);
//translate([0,0,-40])
//	sphere(7, $fn=100, center = false); 


module screwHead()
{
	color([1,0,0]);
	//Screw 5.6 mm diameter, thickness 1.5 mm  (plus .2 mm wiggle room)
	cylinder(h= 0.8, r = 5.8/2, center = false, $fn=100);
	translate([0,0,-1.0])
		cylinder(h= 1.0, r1 = 4.1/2, r2 = 5.8/2, center = false, $fn=100);
}

//screwHead();

module baseScrews()
{
	difference() {
		rotate(a=[0,0,0])
		{
			rotate(a=[90,-90,90])
			{
				translate([0,-3,-25])
				{
					cube([1, 6,50], center=false);
					translate([1,.5,0])
						cube([1, 5,50], center=false);
					translate([1,1,0])
						cylinder(r=1, h=50, center = false, $fn=100);
					translate([1,5,0])
						cylinder(r=1, h=50, center = false, $fn=100);
				}
			}
			rotate(a=[90,-90,00])
			{
				translate([0,-3,-25])
				{
					cube([1, 6,50], center=false);
					translate([1,.5,0])
						cube([1, 5,50], center=false);
					translate([1,1,0])
						cylinder(r=1, h=50, center = false, $fn=100);
					translate([1,5,0])
						cylinder(r=1, h=50, center = false, $fn=100);
				}
			}
		}
		difference() {
			cylinder(r=100,h=100,center=true,$fn=100);
			cylinder(r=radius-1.5,h=100,center=true,$fn=100);
		}
	}
}



