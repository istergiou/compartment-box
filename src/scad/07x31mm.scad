use<inc/compartmentBox.scad>
use<inc/ruler.scad>

include<inc/ruler-include.scad>

lh=0.32; // layer height

rotate([0,0,90])
  box_arr_module(
  	compx=31.25, // Size of compartments, X
	compy=74, // Size of compartments, Y
	compz=30, 
	countx=7,
	wall=1.25,  // 1.2 results to 1.45 //wall thickness
	m=[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
	h=[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
  );
  