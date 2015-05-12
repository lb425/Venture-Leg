

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
	headSize = 5.6;

//Hole distance for the center
	distFromCenter = 12;


	difference() {
		cylinder(r=radius,h=height,center=false,$fs = 0.01);
		cylinder(r=radius/1.8,h=height,center=false,$fs = 0.01);
		holePattern( numberOfScrewHoles, lowerThickness, screwSize/2, headSize/2, distFromCenter );
	}
}

module screwHole (screwSize, headSize, lowerThickness)
{
	////Hole models are 13 mm
	totalThickness=30;
	cylinder(r=screwSize, h=totalThickness, center = false, $fs = 0.01);
		translate([0,0,lowerThickness])
			cylinder(r=headSize, h=totalThickness-lowerThickness, center = false, $fs = 0.01);
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