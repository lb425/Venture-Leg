

module foot ()
{
//millimeters

//Base Parameters
    radius = 14  ;
    height = 5.9 ;
	numberOfScrewHoles = 4;
	lowerThickness = 2 ;
//Diameter of Screw bolt
	screwSize = 3 ;
//Diameter of head size
	headSize = 6.7;

//Hole distance for the center
	distFromCenter = 12;
	translate([-2,-8,0])
		cube([4, 16,3], center=false);


	difference() {
		cylinder(r=radius+1,h=height,center=false,$fs = 0.01);
		cylinder(r=radius/1.8,h=height,center=false,$fs = 0.01);
		holePattern( numberOfScrewHoles, lowerThickness, screwSize/2, headSize/2, distFromCenter );
		translate([4.5,-15,0])
			cube([20, 30,7], center=false);
		mirror([1,0,0])
			translate([4.5,-15,0])
				cube([20, 30,7], center=false);
	}
}

module screwHole (screwSize, headSize, lowerThickness)
{
	////Hole models are 13 mm
	totalThickness=30;
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















