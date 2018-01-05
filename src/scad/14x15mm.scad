use<inc/compartmentBox.scad>
use<inc/ruler.scad>

include<inc/ruler-include.scad>

lh=0.32; // layer height

rotate([0,0,90]) 
  box_arr_module(
  	compx=15.25, // Size of compartments, X
	compy=74, // Size of compartments, Y
	compz=30, 
	countx=14,
	wall=1.50,  // 1.2 results to 1.45 //wall thickness
	m=[ .9, .9, .9, .9,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1],
	h=[  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1]
  );
  