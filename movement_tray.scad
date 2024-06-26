// Movement tray for lined units
// 5x2 minis, 25mm base, magnets 5x1
// (c) Juan Vera, 2024

/* Parameters */
// Number of  rows
rows=2; // [1:5]
// Number of columns 
cols=5; // [1:10]
texture=0; // [0:Plain, 1:Bricks]

/* [Bases] */
// Base radius (mm). Add a tolerance of 0.25. Example: for a diameter of 25mm, real radius=12.5, adding tolerance base_r=12.75
base_r = 25/2+0.25; // [20:0.25:50]
// Base height  (mm)
base_h = 3; // [1:0.1:5]
// Margin around bases. Remember the tolerance in base_r
base_m = -0.25; // [-0.5:0.25:10]
// Magnet heigth. Add 0.05 for tolerance
magnet_h = 1.05; // [1:0.05:2.1]
// Magnet diameter. Add 0.5 for tolerance
magnet_d = 5.5; // [1:0.5:10.5]

/* [Bricks] */
// x size of the bricks (mm)
brick_x = 6.5; // [2:0.5:20]
// y size of the bricks (mm)
brick_y = 4.5; // [2:0.5:20]
// separation of the bricks, in x, relative to brick_x
brick_sep_x=1.01; // [1:0.01:1.5]
// separation of the bricks, in y, relative to brick_y
brick_sep_y=1.01; // [1:0.01:1.5]
// factor to sink the top of the brick
brick_f=0.99; // [0.95:0.01:1]
// brick offset for each line
brick_offset=3.25; // [0:0.25:10]

/* [Handlers] */
base_w=base_r*2;
handle_active=true;
handle_height = 16; // [10:20]
handle_width = 6;  // [1:10]
handle_length = 2; // [1:5]
handle1_row = 2; // [1:5]
handle2_row = 3; // [1:10]

/* [Hidden] */
// note: many dimensions are constant, because I want to match a base I modeled years ago in blender
// DO NOT CHANGE THESE VALUES. The final base will scale these values
// they are relative to a standard 25mm base
hole_r = 25/2-1; // dimensions of the hole. If hole_r==0, do not make a hole
hole_d = 2.1; // depth of the hole
base_total_height = 3.11; // The total height of the base
base_upper_r = 11.87; // The radius of the upper surface of a 25mm base
base_upper_h = 1; // The height of the upper surface of a 25mm base

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
module base_holes(num_cols, num_rows, base_r, base_h, base_m, magnet_h, magnet_d, tray_height) {
    union() {
        translate([0, 0, tray_height-base_h]) {
            for(i = [0:num_cols-1]) {
                for(j = [0:num_rows-1]) {
                    translate([i*2*(base_r+base_m), j*2*(base_r+base_m), 0]) {
                        union() {
                            // base
                            cylinder(tray_height, r=base_r);
                            // magnet
                            if(magnet_d > 0) {
                                translate([0, 0, -magnet_h]) {
                                    cylinder(2*magnet_h, d=magnet_d, $fn=100);
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
        base_holes(num_cols, num_rows, base_r, base_h, base_m, magnet_h, magnet_d, tray_height);
    }
}

// bricks


module brick(x, y, h, r=1, fn=16, f=0.99) {
    /* A brick using hull()
    hull() {
        translate([-x/2, -y/2, base_upper_h/2]) sphere(r=0.5, $fn=12);
        translate([x/2, -y/2, base_upper_h/2]) sphere(r=0.5, $fn=12);
        translate([x/2, y/2, base_upper_h/2]) sphere(r=0.5, $fn=12);
        translate([-x/2, y/2, base_upper_h/2]) sphere(r=0.5, $fn=12);
        
        translate([-x/2, -y/2, -base_upper_h/2]) sphere(r=0.5, $fn=12);
        translate([x/2, -y/2, -base_upper_h/2]) sphere(r=0.5, $fn=12);
        translate([x/2, y/2, -base_upper_h/2]) sphere(r=0.5, $fn=12);
        translate([-x/2, y/2, -base_upper_h/2]) sphere(r=0.5, $fn=12);
    }*/
    
    /* A brick using simple shapes. Faster? */
    translate([r, r, -r]) union() {
        translate([0, 0, r]) sphere(r=r, $fn=fn);
        translate([x-2*r, 0, r]) sphere(r=r, $fn=fn);
        translate([0, y-2*r, r]) sphere(r=r, $fn=fn);
        translate([x-2*r, y-2*r, r]) sphere(r=r, $fn=fn);
        
        translate([0, y-2*r, r]) rotate([90, 0, 0]) rotate([0, 0, 180/fn]) cylinder(r=r, h=y-2*r, $fn=fn);
        translate([x-2*r, y-2*r, r]) rotate([90, 0, 0]) rotate([0, 0, 180/fn]) cylinder(r=r, h=y-2*r, $fn=fn);
        
        translate([0, y-2*r, r]) rotate([0, 90, 0]) rotate([0, 0, 180/fn]) cylinder(r=r, h=x-2*r, $fn=fn);
        translate([0, 0, r]) rotate([0, 90, 0]) rotate([0, 0, 180/fn]) cylinder(r=r, h=x-2*r, $fn=fn);
        
        translate([0, 0, 0]) cube([x-2*r, y-2*r, r*2*f]);
    }
    
    /* A brick using a cuboid
    You also need:
    include <BOSL/constants.scad>
    use <BOSL/shapes.scad>
    cuboid([x,y,h], fillet=0.5);
    */
}

module bricks_surface(brick_x, brick_y, brick_o, tray_width, tray_depth, sep_x=1.2, sep_y=1.2, brick_r=1) {
    // note: the rotation is to have a clean brick line in the front line, but
    // it only works for a very specific set of parameters (offsets, brick size...)
    rotate([0, 0, 180]) intersection() {
        // brick_x, brick_y: size of the brick
        // brick_o: offset of each line of the brick
        // base_w: size of the base
        cube([tray_width, tray_depth, 10], center=true);
        first_x = tray_width / brick_x / 2 + 1;
        first_y = tray_depth / brick_y / 2 + 1;
        rotate([0, 0, 180]) union() {
            for(i=[-first_x:first_x]) {
                for(j=[-first_y:first_y]) {
                    translate([i*sep_x*brick_x + (j%2)*brick_o, j*sep_y*brick_y, 0]) brick(brick_x, brick_y, base_upper_h, r=brick_r);
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
                translate([tray_width/2, tray_depth/2, tray_height-brick_h/2]) bricks_surface(brick_x, brick_y, brick_offset, tray_width, tray_depth, brick_sep_x, brick_sep_y);
                // optional handles
                if(handle_active) {
                    translate([2*handle1_row*(base_r+base_m)+tray_margin, (2*num_rows)*(base_r+base_m), tray_height/2]) handle(handle_width, handle_height, handle_length);
                    translate([2*handle2_row*(base_r+base_m)+tray_margin, (2*num_rows)*(base_r+base_m)-1, tray_height/2]) handle(handle_width, handle_height, handle_length);
                }
            }
        }
        // bases
        base_holes(num_cols, num_rows, base_r, base_h, base_m, magnet_h, magnet_d, tray_height);
    }
}

module movement_tray(texture, num_cols, num_rows, tray_height=4.5, tray_margin=1.5, handle_active=true) {
    if(texture == 0) { // plain
        movement_tray_plain(num_cols, num_rows, tray_height, tray_margin, handle_active);
    } if(texture == 1) { // bricks
        movement_tray_bricks(num_cols, num_rows, tray_height, tray_margin, handle_active);
    }
}

movement_tray(texture,cols,rows,handle_active=handle_active);

