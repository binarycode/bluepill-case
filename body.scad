include <_const.scad>;
include <bluepill.scad>;

/*translate([wall, wall, 0])*/
  /*bluepill();*/

wall = 1.5;

pcb_cutoff_d = 0.5;

pin_header_cutoff_d = 0.5;

jumpers_cutoff_x = 10;
jumpers_cutoff_y = 14;
jumpers_cutoff_offset_x = 7;

usb_cutoff_x = 8;
usb_cutoff_y = 9;
usb_cutoff_z = 3;

swd_cutoff_x = 4.5;
swd_cutoff_y = 13;
swd_cutoff_z = 3;

inner_cutoff_x = 33;
inner_cutoff_y = 13;

led_hole_x = 2;
led_hole_y = 4;
led_hole_offset_x = 43.5;

difference() {
  cube([wall + pcb_x + wall, wall + pcb_y + wall, pcb_z + oscillator_z + wall]);

  translate([wall - pcb_cutoff_d, wall - pcb_cutoff_d, -E])
    cube([pcb_cutoff_d + pcb_x + pcb_cutoff_d, pcb_cutoff_d + pcb_y + pcb_cutoff_d, pcb_z + E2]);

  translate([wall + pin_header_offset_x - pin_header_cutoff_d, wall + pin_header_offset_y - pin_header_cutoff_d, pcb_z])
    cube([pin_header_cutoff_d + pin_header_x + pin_header_cutoff_d, pin_header_cutoff_d + pin_header_y + pin_header_cutoff_d, pin_header_base_z + pin_header_pin_z + E]);
  translate([wall + pin_header_offset_x - pin_header_cutoff_d, wall + pcb_y - pin_header_offset_y - pin_header_y - pin_header_cutoff_d, pcb_z])
    cube([pin_header_cutoff_d + pin_header_x + pin_header_cutoff_d, pin_header_cutoff_d + pin_header_y + pin_header_cutoff_d, pin_header_base_z + pin_header_pin_z + E]);

  translate([wall + jumpers_cutoff_offset_x, wall + (pcb_y - jumpers_cutoff_y) / 2, pcb_z])
    cube([jumpers_cutoff_x, jumpers_cutoff_y, jumpers_z]);

  translate([-E, wall + (pcb_y - usb_cutoff_y) / 2, pcb_z])
    cube([wall + usb_cutoff_x + E, usb_cutoff_y, usb_cutoff_z]);

  translate([-E, wall + (pcb_y - usb_cutoff_y) / 2, pcb_z - INFINITY + E])
    cube([wall + E2, usb_cutoff_y, INFINITY]);

  translate([wall + pcb_x - swd_cutoff_x + E, wall + (pcb_y - swd_cutoff_y) / 2, pcb_z])
    cube([wall + swd_cutoff_x + E, swd_cutoff_y, swd_cutoff_z]);

  translate([wall + pcb_x + E, wall + (pcb_y - swd_cutoff_y) / 2, pcb_z - INFINITY + E])
    cube([wall + E2, swd_cutoff_y, INFINITY]);

  translate([wall + pcb_x + wall - inner_cutoff_x, wall + (pcb_y - inner_cutoff_y) / 2, pcb_z])
    cube([inner_cutoff_x, inner_cutoff_y, oscillator_z]);

  translate([wall + led_hole_offset_x, wall + (pcb_y - led_hole_y) / 2, 0])
    cube([led_hole_x, led_hole_y, INFINITY]);
}
