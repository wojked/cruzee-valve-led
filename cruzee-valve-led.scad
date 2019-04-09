DOWN_DIAMETER = 13.81;
MIDDLE_DIAMETER = 17.16;
UP_DIAMETER = 11.02;

STRAP_THICKNESS = 1.5;
STRAP_WIDTH = 2.6;

HEIGHT = 10;

$fn = 128;

//holder_down();
//translate([0,20,0])
holder_up();

module slot(height){
    cube_size = 6;
    distance = 2;
    difference(){
        cube([cube_size,cube_size+4,height], true);                
        
        translate([STRAP_THICKNESS/2,-STRAP_THICKNESS-distance/2,0])
        cube([STRAP_THICKNESS,STRAP_WIDTH,height*2], true);
        
        translate([STRAP_THICKNESS/2,STRAP_THICKNESS+distance/2,0])
        cube([STRAP_THICKNESS,STRAP_WIDTH,height*2], true);
    }
}

module hook(height){
    cube_size = 6 + 4;
    distance = 2;
    hook_width = 4.30;

    
    difference(){
        cube([cube_size,cube_size,height], true);                
        
        translate([1,2,0])
        cube([hook_width,cube_size,height*2], true);        
        
        translate([-STRAP_THICKNESS/2-2,-STRAP_THICKNESS-distance/2,0])
        cube([STRAP_THICKNESS,STRAP_WIDTH,height*2], true);
        
        translate([-STRAP_THICKNESS/2-2,STRAP_THICKNESS+distance/2,0])
        cube([STRAP_THICKNESS,STRAP_WIDTH,height*2], true);            
    }    


}

module holder(height, outside_diameter, inside_diameter){;
    translate([0,0,height/2])
    difference(){
        union(){
            cylinder(height,outside_diameter/2, outside_diameter/2, true);  
            translate([outside_diameter/2, 0, 0])       
            slot(height);
            
//            translate([-outside_diameter/2, 0, 0])       
//            rotate([0,180,0])
//            slot(height);

            translate([-outside_diameter/2 - 3, 0, 0])                   
            hook(height);
        }
        cylinder(height*2,inside_diameter/2, inside_diameter/2, true);  
    }    
}

module holder_down(){
    holder(HEIGHT, MIDDLE_DIAMETER, DOWN_DIAMETER);
}

module holder_up(){
    holder(HEIGHT, MIDDLE_DIAMETER, UP_DIAMETER);   
}
