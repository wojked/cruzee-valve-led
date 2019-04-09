DOWN_DIAMETER = 13.81;
MIDDLE_DIAMETER = 17.16;
UP_DIAMETER = 11.02;



$fn = 128;

holder_down();
translate([0,20,0])
holder_up();

module slot(height){
    difference(){
        cube([10,10,height], true);                
    }
}

module holder(height, outside_diameter, inside_diameter){;
    translate([0,0,height/2])
    difference(){
        union(){
            cylinder(height,outside_diameter/2, outside_diameter/2, true);  
            translate([outside_diameter/2, 0, 0])       
            slot(height);
        }
        cylinder(height*2,inside_diameter/2, inside_diameter/2, true);  
    }    
}

module holder_down(){
    holder(10, MIDDLE_DIAMETER, DOWN_DIAMETER);
}

module holder_up(){
    holder(10, MIDDLE_DIAMETER, UP_DIAMETER);   
}