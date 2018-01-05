use<inc/compartmentBox.scad>
use<inc/ruler.scad>

include<inc/ruler-include.scad>

lh=0.32; // layer height

rotate([0,0,90]) 
box_arr_module(
  	compx=15.4, // Size of compartments, X
	compy=74, // Size of compartments, Y
	compz=30, 
	countx=18,
	wall=1.00,  // 1.2 results to 1.45 //wall thickness
	m=[0.75,0.75,0.75,0.75,0.75,0.75,0.75,0.75,0.75,0.75,0.75,0.75,0.75,0.75,0.75,0.75,0.75,0.75, 0.75],
	h=[   3,   3,   3,   3,   3,   3,   3,   3,   3,   2,   2,   2,   2,   2,   2,   2,   2,   2,    3],
	supp_rad=12.5
  );