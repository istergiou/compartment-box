include<parametric-fan.scad>

d1=1;

module fan_mount_complete() {
	fan_mount_right();
	fan_mount_left();
	// connector bridge
	translate([26,-25, 11]) cube([2,16,4]);
}

// https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/The_OpenSCAD_Language
module fan_mount_right() {
  width=30;
  depth=3;
  mount=24;
  mount_diameter=3.4-0.6;
  corner_radius=3;
  bore_diameter = width - 3;
  th=1;

  translate([6-width/2,-44.5-width/2, 6.2]) rotate([0,0,0]) {
  	// funnel
  	fanmount(width);
  	//
  	translate([width,width-4.5,0]) cube([4,2,10]);
	translate([width+3,width+0.5,6.8]) rotate([0,90,0]) {
		difference() {
			cylinder(r=10/2,h=4,$fn=20);
			translate([0,0,2.3+0.32]) cylinder(r=1.7, h=10, $fn=20);
			cylinder(r=3.35, h=2.3, $fn=6);
		}
	}
	// fan mount
    translate([width/2,width/2-0.5,7]) rotate([10,0,0]) 
	  {
	    difference()
	    {
	      linear_extrude(height=depth, center = true, convexity = 4, twist = 0) 
	      {
	        difference()
	        {
	          square([width, width], center=true);
	          //inside_bore(bore_diameter, width/2 + 2);
	          circle(r=bore_diameter/2,center=true);
	          mounting_holes(mount/2, mount_diameter/2, depth+0.2);
	          round_corners(width/2, corner_radius);
	        }	
	       }
	      }
	    }
  }
}

module fan_mount_left() {
  width=30;
  depth=3;
  mount=24;
  mount_diameter=3.4-0.6;
  corner_radius=3;
  bore_diameter = width - 3;
  th=1;

  mirror([0,1,0]) translate([6-width/2,-12-width/2, 6.2]) rotate([0,0,0]) {
  	// funnel
  	fanmount(width);
  	// 
  	translate([width,width-3.0,0]) cube([4,2,10]);
	#translate([width+3,width+2.0,6.8]) rotate([0,90,0]) {
		difference() {
			cylinder(r=10/2,h=4,$fn=20);
			translate([0,0,2.3+0.32]) cylinder(r=1.7, h=10, $fn=20);
			cylinder(r=3.35, h=2.3, $fn=6);
		}
	}
	// fan mount
    #translate([width/2,width/2-0.5,7]) rotate([10,0,0]) 
	  {
	    difference()
	    {
	      linear_extrude(height=depth, center = true, convexity = 4, twist = 0) 
	      {
	        difference()
	        {
	          square([width, width], center=true);
	          //inside_bore(bore_diameter, width/2 + 2);
	          circle(r=bore_diameter/2,center=true);
	          mounting_holes(mount/2, mount_diameter/2, depth+0.2);
	          round_corners(width/2, corner_radius);
	        }	
	       }
	      }
	    }
    }  	
}
module fanmount(
	width=30, 
	th=1 // thickness
) {
	h=9;
	bw=width; //bottom width
	sw=5; // side width
	dw=width-1; // depth width
	rh=10.5; // rear height
	fh=4.5; // front height
	faces = [
	  [0,1,2,3],  // bottom
	  [4,5,1,0],  // front
	  [7,6,5,4],  // top
	  [5,6,2,1],  // right
	  [6,7,3,2],  // back
	  [7,4,0,3]]; // left
	points=[
		[  0,  0,  0 ],  //0
		[ bw,  0,  0 ],  //1
		[ bw,  dw, 0 ], //2
		[  0,  dw, 0 ], //3
		[  0,  0,  fh ],  //4
		[ bw,  0,  fh ],  //5
		[ bw,  dw,  rh ], //6
		[  0,  dw,  rh ]  // 7
	];
	inner_points=[
		[  0+th,  0+th,  0+th ],  //0
		[ bw-th,  0+th,  0+th ],  //1
		[ bw-th,  dw-th, 0+th ], //2
		[  0+th,  dw-th, 0+th ], //3
		[  0+th,  0+th,  fh+d1 ],  //4
		[ bw-th,  0+th,  fh+d1 ],  //5
		[ bw-th,  dw-th,  rh+d1 ], //6
		[  0+th,  dw-th,  rh+d1 ]  // 7
	];	
  difference () {
	  polyhedron( points, faces );
	  polyhedron( inner_points, faces );
  	  translate([th,18,2]) rotate([-42,0,0])cube([width-2*th, 10,6], center=false);	
  }
}