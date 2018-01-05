use <VectorMath_v2.scad>

module sup(r=10,lh=0.32) {
	cylinder(r=r, h=lh);
}

module box(x,y,z,wall) {
  difference() {
    translate([0,0,0]) cube([wall+x+wall,wall+y+wall,wall+z]);
    translate([wall,wall,wall]) cube([x,y,z+0.1]);
  }
}
//function sumv(v,i,s=0) = (i==s ? v[i] : v[i] + sumv(v,i-1,s));
function sumto(v,t) = (t==-1 ? 0 : v[t] + sumto(v,t-1));

//box(compx, compy, compz, wall);
module box_arr(compx, compy, compz, wall, countx, m, h) {
  for(x=[0:countx-1]) {
    //echo("x", x);
    box_count_in_y=h[x];
    //echo("box_count_in_y", box_count_in_y);
    box_size_in_y=(compy-wall*(box_count_in_y-1))/box_count_in_y;
    //echo("box_size_in_y", box_size_in_y);
    offset_in_x = sumto(m,x-1);
    //echo("offset_in_x", offset_in_x);
    for(y=[0:box_count_in_y-1]) {
      //box_x=compy/box_count_in_y;
      box_offset_in_y = y*box_size_in_y+y*wall;
      //echo("box_offset_in_y", box_offset_in_y);
      box_offset_in_x = offset_in_x*compx+wall*x;
      //echo("box_offset_in_x", box_offset_in_x);
      translate([box_offset_in_x,box_offset_in_y,0]) 
	    box(compx*m[x], box_size_in_y, compz, wall);
	}
  }
}

module box_arr_module(
	compx=10, // Size of compartments, X
	compy=30, // Size of compartments, Y
	compz=2,  // Hight of compartments
	countx=4, // count of compartments in X
	wall=1.00, // wall thickness
	lh=0.30,   // layer height
	m=[2,1,1,1,1,1,1,1,1,1,1,1], // compartment multiplier
	h=[1,2,4,8,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], // count of compartments
	supp_rad=10
) {
	translate([0,0,0]) 
	{
		box_arr(compx, compy, compz, wall,countx,m,h);
		// SUPPORT EDGES
		maxx=sumto(m,countx-1)*compx+wall*(countx+1);
		//echo("maxx",maxx);
		translate([0,0,0]) sup(r=supp_rad, lh=lh);
		translate([maxx,0,0]) sup(r=supp_rad, lh=lh);
		translate([0,compy+wall*2,0]) sup(r=supp_rad, lh=lh);
		translate([maxx,compy+wall*2,0]) sup(r=supp_rad, lh=lh);
		// 
		echo("box [x,y]",[compy, maxx]);
		echo("max_printer [x,y]",[ compy+supp_rad*2, maxx+supp_rad*2 ] );
	}	
}
