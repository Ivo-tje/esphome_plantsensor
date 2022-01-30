battery_box();

translate([28,0,0])
    electronic_layer();


translate([28,58,0])
    electronic_shield();

translate([56,29,0])
    rotate([0,0,270])
    slide_cover();
    
module battery_box(){
    union(){
        difference(){
            cube([27,55,13]);
            translate([2.9,2,2])
                cube([21.2,51,11]);
            translate([6.6,53,12.5])
                cube([3.2,2,0.5]);
            translate([17.2,53,12.5])
                cube([3.2,2,0.5]);
        }
        // Front bot
        translate([2.9,2,2])
            cube([21.2,0.8,1]);
        // Front top
        translate([2.9,2,12])
            cube([21.2,0.8,1]);
        // Back bot
        translate([2.9,52.2,2])
            cube([21.2,0.8,1]);
        // Back top
        difference(){
            translate([2.9,52.2,12])
                cube([21.2,0.8,1]);
            translate([6.6,52.2,12])
                cube([3.2,0.8,1]);
            translate([17.2,52.2,12])
                cube([3.2,0.8,1]);
        }
        // Top-bot
        translate([13,52.2,2])
            cube([1,0.8,10]);
        // Cap gap
        translate([0,55,0])
            cube([27,2,1]);
        translate([0,55,1])    
            cube([1,2,12]);
        translate([26,55,1])    
            cube([1,2,12]);
        // Electric layer notch
        difference(){
            translate([13.5,0,13])
                cylinder(d=4,h=1,$fn=6);
            translate([0,-8,13])
                cube([27,8,1]);

        }
    }
}

module electronic_layer(){
    union(){
        translate([0,0,0])
            difference(){
                cube([27,55,6]);
                // Soil
                translate([2,0,1])
                    cube([23,31.5,5]);
                // Cable
                translate([7.5,31.5,1])
                    cube([12,1.2,5]);
                // Cable top
                translate([2,31.5,5])
                    cube([23,1.2,1]);
                // ESP
                translate([1,32.2,1])
                    cube([25,17,5]);
                translate([11,48.2,5])
                    cube([5,7,1]);
                translate([13.5,0,0])
                    cylinder(d=4,h=1,$fn=6);

            }
        // Nokjes
        translate([2.25,10.5,1])
            rotate([0,0,180])
                cylinder(d=4,h=4,$fn=5);
        translate([24.75,10.5,1])
            cylinder(d=4,h=4,$fn=5);
        // Cap gap
        translate([0,55,5])
            cube([11,2,1]);
        translate([16,55,5])
            cube([11,2,1]);
        translate([0,55,0])    
            cube([1,2,5]);
        translate([26,55,0])    
            cube([1,2,5]);
    }
}

module electronic_shield(){
    //cover plate
    difference(){
        union(){
            translate([2.25,0,0])
                cube([22.3,31.5,0.8]);
            // Cable top
            translate([2.25,31.5,0])
                cube([22.3,1.2,0.8]);
            // ESP
            translate([1.65,32.2,0])
                cube([23.7,16,0.8]);
            translate([2.25,0,0])
                cube([22.3,6,3]);
        }
        translate([11.65,46.7,0])
            cube([3.7,2,0.8]);
    }
}

module slide_cover(){
    // Slide over cover
    difference(){
        rounded_cube(29,21,56,r=1.5);
        translate([0.8,0.8,0.8])
            cube([27.4,19.4,58.4]);
    }
}    
 
module rounded_cube(x,y,z,r=5,res=50){
    $fn=res;
    hull(){
        translate([r,r,r])
            sphere(r=r);
        translate([r,y-r,r])
            sphere(r=r);
        translate([x-r,y-r,r])
            sphere(r=r);
        translate([x-r,r,r])
            sphere(r=r);
        translate([r,r,z-r])
            sphere(r=r);
        translate([r,y-r,z-r])
            sphere(r=r);
        translate([x-r,y-r,z-r])
            sphere(r=r);
        translate([x-r,r,z-r])
            sphere(r=r);
    }
}