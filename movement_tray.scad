// Movement tray for lined units
// 5x2 minis, 25mm base, magnets 5x1
// (c) Juan Vera, 2024

// you can modify these parameters from the command linear_extrude
rows=2;
cols=5;
texture="plain";
handle_active=true;

// bases of the minis and magnets
base_r = 25/2+0.25; // base radius
base_h = 3; // base height
base_m = -0.25; // margin around a base
magnet_h = 1.05; // magnet height
magnet_r = 5.5/2; //magnet radius

// handle
handle_height = 16;
handle_width = 6;
handle_length = 2;
handle1_row = 2;
handle2_row = 3;

// Optional handles
module handle(handle_width, handle_height, handle_length) {
    rotate([0,-45,90]){
        union(){
            translate([0,-handle_width/2,0]){
                cube([handle_height,handle_width,handle_length]);
            }
            translate([handle_height,0,0]){
                cylinder (h=handle_length, r=handle_width/1.5, center=false);
            }
            translate([handle_height/2,0,0]){
                cylinder (h=handle_length, r=handle_width/1.5, center=false);
            }
        }
    }
}

// bases holes (to be used in difference)
module base_holes(num_cols, num_rows, base_r, base_h, base_m, magnet_h, magnet_r, tray_height) {
    union() {
        translate([0, 0, tray_height-base_h]) {
            for(i = [0:num_cols-1]) {
                for(j = [0:num_rows-1]) {
                    translate([i*2*(base_r+base_m), j*2*(base_r+base_m), 0]) {
                        union() {
                            // base
                            cylinder(tray_height, r=base_r);
                            // magnet
                            if(magnet_r > 0) {
                                translate([0, 0, -magnet_h]) {
                                    cylinder(2*magnet_h, r=magnet_r, $fn=100);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

// movement tray
module movement_tray_plain(num_cols, num_rows, tray_height, tray_margin, handle_active = true) {
    tray_width = num_cols*2*(base_r+base_m)+2*tray_margin;
    tray_depth = num_rows*2*(base_r+base_m)+2*tray_margin;
    difference() {
        // main tray
        translate([-(base_r+base_m+tray_margin), -(base_r+base_m+tray_margin), 0]) {
            union() {
                cube([tray_width, tray_depth, tray_height]);
                if(handle_active) {
                    translate([2*handle1_row*(base_r+base_m)+tray_margin, (2*num_rows)*(base_r+base_m), tray_height/2]) handle(handle_width, handle_height, handle_length);
                    translate([2*handle2_row*(base_r+base_m)+tray_margin, (2*num_rows)*(base_r+base_m)-1, tray_height/2]) handle(handle_width, handle_height, handle_length);
                }
            }
        }
        // bases
        base_holes(num_cols, num_rows, base_r, base_h, base_m, magnet_h, magnet_r, tray_height);
    }
}

// bricks plate
include <BOSL/constants.scad>
use <BOSL/shapes.scad>
module bricks_surface(brick_x, brick_y, brick_h, brick_o, tray_width, tray_depth) {
    // note: the rotation is to have a clean brick line in the front line, but
    // it only works for a very specific set of parameters (offsets, brick size...)
    rotate([0, 0, 180]) intersection() {
        // brick_x, brick_y: size of the brick
        // brick_o: offset of each line of the brick
        // base_w: size of the base
        cube([tray_width, tray_depth, brick_h], center=true);
        first_x = tray_width / brick_x / 2 + 1;
        first_y = tray_depth / brick_y / 2 + 1;
        union() {
            for(i=[-first_x:first_x]) {
                for(j=[-first_y:first_y]) {
                    translate([i*1.05*brick_x + (j%2)*brick_o, j*1.05*brick_y, 0]) cuboid([brick_x,brick_y,brick_h], fillet=0.5);
                }
            }
        }
    }
}
// movement tray
module movement_tray_bricks(num_cols, num_rows, tray_height, tray_margin, handle_active) {
    tray_width = num_cols*2*(base_r+base_m)+2*tray_margin;
    tray_depth = num_rows*2*(base_r+base_m)+2*tray_margin;
    brick_h = 2; // we will sink the bricks half the brick_h
    difference() {
        translate([-(base_r+base_m+tray_margin), -(base_r+base_m+tray_margin), 0]) {
            union() {
                // main tray
                cube([tray_width, tray_depth, tray_height-brick_h/2]);
                // bricks
                translate([tray_width/2, tray_depth/2, tray_height-brick_h/2]) bricks_surface(6.5, 4.5, brick_h, 6.5/2, tray_width, tray_depth);
                // optional handles
                if(handle_active) {
                    translate([2*handle1_row*(base_r+base_m)+tray_margin, (2*num_rows)*(base_r+base_m), tray_height/2]) handle(handle_width, handle_height, handle_length);
                    translate([2*handle2_row*(base_r+base_m)+tray_margin, (2*num_rows)*(base_r+base_m)-1, tray_height/2]) handle(handle_width, handle_height, handle_length);
                }
            }
        }
        // bases
        base_holes(num_cols, num_rows, base_r, base_h, base_m, magnet_h, magnet_r, tray_height);
    }
}

module movement_tray(texture, num_cols, num_rows, tray_height=4.5, tray_margin=1.5, handle_active=true) {
    if(texture == "plain") {
        movement_tray_plain(num_cols, num_rows, tray_height, tray_margin, handle_active);
    } if(texture == "bricks") {
        movement_tray_bricks(num_cols, num_rows, tray_height, tray_margin, handle_active);
    }
}

movement_tray(texture,cols,rows,handle_active=handle_active);
