use<inc/compartmentBox.scad>
use<inc/ruler.scad>

include<inc/ruler-include.scad>

lh=0.32; // layer height

rotate([0,0,90]) 
box_arr_module(
  	compx=15.0, // Size of compartments, X
	compy=74, // Size of compartments, Y
	compz=30, 
	countx=16,
	wall=1.25,  // 1.2 results to 1.45 //wall thickness
	m=[0.75,0.75,0.75,0.75,0.75,0.75,1.00,1.00,0.75,0.75,1.00,1.00,1.00,0.90,1.00,1.00],
	h=[   3,   3,   3,   3,   3,   3,   3,   3,   2,   2,   2,   2,   2,   1,   1,   1]
  );