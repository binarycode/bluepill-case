include <_const.scad>;

pcb_x = 53;
pcb_y = 23;
pcb_z = 4;

usb_x = 6;
usb_y = 8;
usb_z = 2.5;

jumpers_x = 8;
jumpers_y = 5;
jumpers_z = 8;
jumpers_offset_x = 8;
jumpers_offset_y = 12;

reset_x = 6;
reset_y = 3;
reset_z = 5;
reset_offset_x = 9;
reset_offset_y = 6;

mcu_x = 7;
mcu_y = 7;
mcu_z = 2;
mcu_offset_x = 26;
mcu_offset_y = 7;

oscillator_x = 4;
oscillator_y = 11;
oscillator_z = 4;
oscillator_offset_x = 33;

psu_x = 3;
psu_y = 8;
psu_z = 3;
psu_offset_x = 38;

led_x = 1.5;
led_y = 2;
led_z = 1;
led_offset_x = 43.5;
custom_led_offset_y = 8;
power_led_offset_y = 14;

swd_x = 4;
swd_y = 10;
swd_z = 2.75;

pin_header_x = 51.5;
pin_header_y = 2.75;
pin_header_base_z = 2.5;
pin_header_pin_z = 5.5;
pin_header_offset_x = 0.75;
pin_header_offset_y = 2.5;

module bluepill() {
  color("blue") {
    cube([pcb_x, pcb_y, pcb_z]);
  }

  color("silver") {
    translate([0, (pcb_y - usb_y) / 2, pcb_z - E])
      cube([usb_x, usb_y, usb_z]);
  }

  color("gold") {
    translate([jumpers_offset_x, jumpers_offset_y, pcb_z - E])
      cube([jumpers_x, jumpers_y, jumpers_z]);
  }

  color("white") {
    translate([reset_offset_x, reset_offset_y, pcb_z - E])
      cube([reset_x, reset_y, reset_z]);
  }

  color("black") {
    translate([mcu_offset_x, mcu_offset_y, pcb_z - E])
      rotate(45)
        cube([mcu_x, mcu_y, mcu_z]);
  }

  color("silver") {
    translate([oscillator_offset_x, (pcb_y - oscillator_y) / 2, pcb_z - E])
      cube([oscillator_x, oscillator_y, oscillator_z]);
  }

  color("black") {
    translate([psu_offset_x, (pcb_y - psu_y) / 2, pcb_z - E])
      cube([psu_x, psu_y, psu_z]);
  }

  color("lime") {
    translate([led_offset_x, custom_led_offset_y, pcb_z - E])
      cube([led_x, led_y, led_z]);
  }
  color("red") {
    translate([led_offset_x, power_led_offset_y, pcb_z - E])
      cube([led_x, led_y, led_z]);
  }

  color("black") {
    translate([pcb_x - swd_x, (pcb_y - swd_y) / 2, pcb_z - E])
      cube([swd_x, swd_y, swd_z]);
  }

  color("yellow") {
    translate([pin_header_offset_x, pin_header_offset_y, pcb_z - E])
      cube([pin_header_x, pin_header_y, pin_header_base_z]);
    translate([pin_header_offset_x, pcb_y - pin_header_offset_y - pin_header_y, pcb_z - E])
      cube([pin_header_x, pin_header_y, pin_header_base_z]);
  }
  color("khaki") {
    translate([pin_header_offset_x, pin_header_offset_y, pcb_z + pin_header_base_z - E])
      cube([pin_header_x, pin_header_y, pin_header_pin_z]);
    translate([pin_header_offset_x, pcb_y - pin_header_offset_y - pin_header_y, pcb_z + pin_header_base_z - E])
      cube([pin_header_x, pin_header_y, pin_header_pin_z]);
  }
}
