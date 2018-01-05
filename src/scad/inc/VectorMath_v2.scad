
// VectorMath.scad
// Version 2
VectorMathVersion=2;
// Released to the Public Domain

// maxv  - return the maximum element in a vector
// usage   maxv(a-vector
//             <,<m=>a-minimum-start-value default=big-negative>  {usually not used}
//             <,<s=>a-working-variable-for-recursion-maybe-useful-to-start-later-in-vector-?>)
//				{zero based elements}
// example maxv([3,7,4,9,1,8]);  // = 9      maxv([-100,-50,5,-30]);  // = 5
function maxv(v,m=-999999999999,s=0) = (s==len(v) ? m : (m>v[s] ? maxv(v,m,s+1) : maxv(v,v[s],s+1)));


// minv  - return minimum element in a vector
// usage   minv(a-vector
//             <,<m=>a-maximum-start-value default=big-number>  {usually not used}
//             <,<s=>a-working-variable-for-recursion-maybe-useful-to-start-later-in-vector-?>)
//				{zero based elements}
// example minv([3,7,4,9,1,8]);  // = 1      minv([-100,-50,5,-30]);  // = -100
function minv(v,m=999999999999,s=0) = (s==len(v) ? m : (m<v[s] ? minv(v,m,s+1) : minv(v,v[s],s+1)));


// sumv  - sum the elements in a vector, up to an element #, or optionaly start at element #
// usage   sumv(a-vector)
//            
// example sumv([10,20,30,40]); // = 100   
//function sumv(v,i=0) = (i==len(v) ? 0 : v[i] + sumv(v,i+1));
function sumv(v,i,s=0) = (i==s ? v[i] : v[i] + sumv(v,i-1,s));

// sumvmin - sum the elements of a vector, but sum a minimum value
//           ie any element less than Min use Min instead
// usage     sumvmin(a-vector
//			       <,<l=>sum-to-this-element>   {use len(v)-1 for all}
//                 <,<s=>starting-element default=0>
//				   <,<m=>minimum-element-value>);  
//                  {zero based elements}
// example sumvmin([3,7,4,9,1,8],m=4); // = 36
//function sumvmin(v,l=0,s=0,m=-999999999999) = (s==len(v) ? 0 : ((l!=0 && s>l) ? 0 : max(v[s],m) + sumvmin(v,l,s+1,m)));
function sumvmin(v,l=0,s=0,m=-999999999999) = (l==s ? max(v[l],m) : max(v[s],m) + sumvmin(v,l,s+1,m));
// sumvmax - sum the elements of a vector, but sum a maximum value
//           ie any element greater than max use max instead
// usage     sumvmax(a-vector
//			       <,<l=>sum-to-this-element>	{use len(v)-1 for all}
//                 <,<s=>starting-element default=0>
//				   <,<m=>maximum-element-value>);  
//                  {zero based elements}
// simple call sumvmin(v,m=minimim);
// example sumvmax([3,7,4,9,1,8],m=7); // = 29
function sumvmax(v,l=0,s=0,m=-999999999999) = (l==s ? min(v[l],m) : min(v[s],m) + sumvmax(v,l,s+1,m));

// test VectorMath - next is normally 0 but can be set to 1 for testing
VectorMathTest=1;
if (VectorMathTest==1) TestVectorMath();

module TestVectorMath() {
	// 0,1,2,3,4,5 element #
	v=[7,3,9,3,5,6];
	//v=[[10,20],[30,40],[50,60]];
	vl=len(v);
	tot=0;
	echo(v, vl);
	echo("sum",sumv(v));
	echo("sum",sumv(v,vl-1));
	for (i= [0 : vl-1]) {
		echo("sum first",i,"elements",sumv(v,i));	
	}
	echo("sum 1-2",sumv(v,2,1));
	echo("sum 2-4",sumv(v,4,2));
	echo("sum 4-5",sumv(v,5,4));

	echo("max",maxv(v));
	echo("min",minv(v));

	echo(sumv([10,20,30,40],2)); // = 60      
	echo(sumv([10,20,30,40],3,2)); // = 70

	echo("sumvmin 5",sumvmin(v,vl-1,m=5));
	echo("sumvmin 2-4",sumvmin(v,4,2,5));
	echo("sumvmin([3,7,4,9,1,8],m=4)",sumvmin([3,7,4,9,1,8],vl-1,m=4));
	
	for (i = [0 : vl-1]) {
		echo("sumvmin first",i,"elements", sumvmin(v,i,m=4));
	}

	echo("sumvmax 7",sumvmax(v,vl-1,m=7));
	echo("sumvmax([3,7,4,9,1,8],m=7)",sumvmax([3,7,4,9,1,8],vl-1,m=7));
}
