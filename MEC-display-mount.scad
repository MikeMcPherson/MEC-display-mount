include <BOSL/constants.scad>
use <BOSL/shapes.scad>

export_box=true;
export_walls=true;
export_lid=true;
board_ghost=false;

$fn=64;
bool_allowance=0.01;
fillet_radius=0;

bar_x=60;
bar_y=15;
bar_z=15;
cutout_x=bar_x-20;
cutout_y=(bar_y*0.3);
cutout_z=bar_z;
insert_z=4;
insert_hole_diameter=4;
insert_hole_y=10;
mount_diameter=3.5;

// Main box
difference(){
    // Bar
    cuboid([bar_x,bar_y,bar_z],
        center=true, 
        fillet=fillet_radius, 
        edges=EDGES_BOTTOM+EDGES_Z_ALL);
    // Cutout
    translate([0,(((bar_y-cutout_y)/2)-bool_allowance),-bool_allowance]) 
    cuboid([cutout_x,(cutout_y+(bool_allowance*4)),
        (cutout_z+(bool_allowance*4))],
        center=true, 
        fillet=fillet_radius, 
        edges=EDGES_BOTTOM+EDGES_Z_ALL);
    // Mini-PC mounting holes (for M3 heat insert nuts)
//    for(i=[-1,1]) {
//        for(j=[-1,1]) {
//            translate([((bar_x/2)+(i*mount_spacing*1.5)),
//                ((bar_y/2)+(j*mount_spacing*1.5)),-bool_allowance]) {
//                    zcyl(h=(wall_thickness+insert_z+
//                        (bool_allowance*2)),
//                        d=insert_hole_diameter,
//                        center=false);
//                }
//        }
//    }
    // TV mounting holes (for M3 passthrough)
//    for(i=[0:1]) {
//        for(j=[0:1]) {
//            translate([
//                max((corner_diameter/2),
//                (((wall_thickness*2)-(corner_diameter/2)+void_x)*i)),
//                max((corner_diameter/2),
//                (((wall_thickness*2)-(corner_diameter/2)+void_y)*j)),
//                ((void_z-insert_hole_y)+
//                wall_thickness+bool_allowance)]) 
//                zcyl(h=insert_hole_y,
//                    d=insert_hole_diameter,center=false);
//        }
//    }
}
