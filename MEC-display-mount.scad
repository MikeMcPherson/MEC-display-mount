include <BOSL/constants.scad>
use <BOSL/shapes.scad>

export_box=true;
export_walls=true;
export_lid=true;
board_ghost=false;

$fn=64;
bool_allowance=0.01;
fillet_radius=2;

mount_spacing=116;
insert_spacing=74;
pc_screw_length=10;
tv_screw_length=15;
bar_x=mount_spacing+20;
bar_y=tv_screw_length-3;
bar_z=15;
cutout_x=bar_x-40;
cutout_y=bar_y-pc_screw_length;
cutout_z=bar_z;
insert_y=4;
insert_hole_diameter=4;
insert_hole_y=10;
mount_hole_diameter=3.5;

// Main box
difference(){
    // Bar
    cuboid([bar_x,bar_y,bar_z],
        center=true, 
        fillet=fillet_radius, 
        edges=EDGES_ALL);
    // Cutout
    translate([0,(((bar_y-cutout_y)/2)-bool_allowance),-bool_allowance]) 
        cuboid([cutout_x,(cutout_y+(bool_allowance*4)),
            (cutout_z+(bool_allowance*4))],
            center=true);
    // Mini-PC mounting holes (for M3 heat insert nuts)
    for(i=[-1,1]) {
        translate([(i*insert_spacing/2),
            -bool_allowance,-bool_allowance]) {
                ycyl(h=(bar_y+(bool_allowance*4)),
                    d=mount_hole_diameter,
                    center=true);
        }
        translate([(i*insert_spacing/2),
            ((insert_y/2)-bool_allowance),-bool_allowance]) {
                ycyl(h=(insert_y*1.2),
                    d=insert_hole_diameter,
                    center=true);
        }
    }
    // TV mounting holes (for M3 passthrough)
    for(i=[-1,1]) {
        translate([(i*mount_spacing/2),
            -bool_allowance,-bool_allowance]) {
                ycyl(h=(bar_y+(bool_allowance*4)),
                    d=mount_hole_diameter,
                    center=true);
        }
    }
}
