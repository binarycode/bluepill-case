include <_const.scad>;
include <bluepill_old.scad>;

/*translate([wall, wall, 0])*/
  /*bluepill();*/

wall = 2;

pcb_cutoff_d = 0.1;

pin_header_cutoff_y = 2;
pin_header_cutoff_d = 0.2;

/*jumpers_cutoff_x = 10;*/
/*jumpers_cutoff_y = 14;*/
/*jumpers_cutoff_offset_x = 7;*/

jumpers_cutoff_x = 8;
jumpers_cutoff_y = 5.5;
jumpers_cutoff_offset_x = 7.5;
jumpers_cutoff_offset_y = 10.5;

reset_cutoff_r = 1;
reset_cutoff_offset_x = 11.5;
reset_cutoff_offset_y = 7.5;

usb_cutoff_x = 8;
usb_cutoff_y = 9;
usb_cutoff_z = 2.5;

swd_cutoff_x = 45.5;
swd_cutoff_y = 11.2;
swd_cutoff_z = 3;

oscillator_d = 1;

led_hole_r = 1;
led_hole_offset_x = 44.5;

difference() {
  cube([wall + pcb_x + wall, wall + pcb_y + wall, pcb_z + oscillator_z + wall]);

  translate([wall - pcb_cutoff_d, wall - pcb_cutoff_d, -E])
    cube([pcb_cutoff_d + pcb_x + pcb_cutoff_d, pcb_cutoff_d + pcb_y + pcb_cutoff_d, pcb_z + E2]);

  translate([wall + pin_header_offset_x - pin_header_cutoff_d, wall + pin_header_offset_y - pin_header_cutoff_y - pin_header_cutoff_d, pcb_z])
    cube([pin_header_cutoff_d + pin_header_x + pin_header_cutoff_d, pin_header_cutoff_d + pin_header_y + pin_header_cutoff_y + pin_header_cutoff_d, pin_header_base_z + pin_header_pin_z + E]);
  translate([wall + pin_header_offset_x - pin_header_cutoff_d, wall + pcb_y - pin_header_offset_y - pin_header_y - pin_header_cutoff_d, pcb_z])
    cube([pin_header_cutoff_d + pin_header_x + pin_header_cutoff_d, pin_header_cutoff_d + pin_header_y + pin_header_cutoff_y + pin_header_cutoff_d, pin_header_base_z + pin_header_pin_z + E]);

  translate([wall + reset_cutoff_offset_x, wall + reset_cutoff_offset_y, 0])
   cylinder(h = INFINITY, r = reset_cutoff_r, center = true);

  translate([wall + jumpers_cutoff_offset_x, wall + jumpers_cutoff_offset_y, pcb_z])
    cube([jumpers_cutoff_offset_y, jumpers_cutoff_y, INFINITY]);

  translate([-E, wall + (pcb_y - usb_cutoff_y) / 2, pcb_z])
    cube([wall + usb_cutoff_x + E, usb_cutoff_y, usb_cutoff_z]);

  translate([-E, wall + (pcb_y - usb_cutoff_y) / 2, pcb_z - INFINITY + E])
    cube([wall + E2, usb_cutoff_y, INFINITY]);

  translate([wall + pcb_x - swd_cutoff_x + E, wall + (pcb_y - swd_cutoff_y) / 2, pcb_z])
    cube([wall + swd_cutoff_x + E, swd_cutoff_y, swd_cutoff_z]);

  translate([wall + pcb_x + E, wall + (pcb_y - swd_cutoff_y) / 2, pcb_z - INFINITY + E])
    cube([wall + E2, swd_cutoff_y, INFINITY]);

  translate([wall + oscillator_offset_x - oscillator_d, wall + (pcb_y - oscillator_d - oscillator_y - oscillator_d) / 2, pcb_z])
    cube([oscillator_d + oscillator_x + oscillator_d, oscillator_d + oscillator_y + oscillator_d, oscillator_z]);

  translate([led_hole_offset_x, wall + pin_header_offset_y + pin_header_y + pin_header_cutoff_d, 0])
    cylinder(h = INFINITY, r = led_hole_r, center = true);

  translate([led_hole_offset_x, wall + pcb_y - pin_header_offset_y - pin_header_y - pin_header_cutoff_d, 0])
    cylinder(h = INFINITY, r = led_hole_r, center = true);
}
