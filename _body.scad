include <_const.scad>;
include <_bluepill.scad>;

body_wall = 1.75;

module body() {
  difference() {
    _body_outer();

    _body_pcb_cutoff();
    _body_gpio_pins_cutoff();
    _body_jumpers_cutoff();
    _body_reset_cutoff();
    _body_inner_cutoff();
    _body_usb_cutoff();
    _body_swd_cutoff();
  }
}

// ****************************************************************************
// OUTER CUBE
// ****************************************************************************
body_outer = [
  body_wall + bluepill_pcb.x + body_wall,
  body_wall + bluepill_pcb.y + body_wall,
  bluepill_pcb.z + bluepill_oscillator.z + body_wall
];
module _body_outer() {
  cube(body_outer);
}

// ****************************************************************************
// PCB CUTOFF
// ****************************************************************************
body_pcb_cutoff_d = 0.3;
module _body_pcb_cutoff() {
  translate([
    body_wall - body_pcb_cutoff_d,
    body_wall - body_pcb_cutoff_d,
    -E
  ])
    cube([
      body_pcb_cutoff_d + bluepill_pcb.x + body_pcb_cutoff_d,
      body_pcb_cutoff_d + bluepill_pcb.y + body_pcb_cutoff_d,
      bluepill_pcb.z + E
    ]);
}

// ****************************************************************************
// GPIO PINS CUTOFF (WITH LABELS)
// ****************************************************************************
body_gpio_pins_cutoff_label = 1.0;
module _body_gpio_pins_cutoff() {
  body_gpio_pins_cutoff_d = 0.2;
  translate([
    body_wall - body_pcb_cutoff_d,
    body_wall + bluepill_bottom_gpio_pins_base_offset.y - body_gpio_pins_cutoff_label,
    -E
  ])
    cube([
      body_pcb_cutoff_d + bluepill_pcb.x + body_pcb_cutoff_d,
      body_gpio_pins_cutoff_d + bluepill_gpio_pins_base.y + body_gpio_pins_cutoff_label,
      body_outer.z + E2
    ]);
  translate([
    body_wall - body_pcb_cutoff_d,
    body_wall + bluepill_top_gpio_pins_base_offset.y - body_gpio_pins_cutoff_d,
    -E
  ])
    cube([
      body_pcb_cutoff_d + bluepill_pcb.x + body_pcb_cutoff_d,
      body_gpio_pins_cutoff_d + bluepill_gpio_pins_base.y + body_gpio_pins_cutoff_label,
      body_outer.z + E2
    ]);
}

// ****************************************************************************
// JUMPERS CUTOFF
// ****************************************************************************
module _body_jumpers_cutoff() {
  d = 0.3;
  translate([
    body_wall + bluepill_jumpers_offset.x - d,
    body_wall + bluepill_jumpers_offset.y - d,
    -E
  ])
    cube([
      d + bluepill_jumpers.x + d,
      d + bluepill_jumpers.y + d,
      body_outer.z + E2
    ]);
}

// ****************************************************************************
// RESET BUTTON CUTOFF
// ****************************************************************************
module _body_reset_cutoff() {
  r = 1.5;
  translate([
    body_wall + bluepill_reset_offset.x + bluepill_reset.x / 2,
    body_wall + bluepill_reset_offset.y + bluepill_reset.y / 2,
    body_outer.z / 2
  ])
   cylinder(
     h = body_outer.z + E2,
     r = r,
     center = true
   );
}

// ****************************************************************************
// INNER SPACE CUTOFF
// ****************************************************************************
module _body_inner_cutoff() {
  translate([
    body_wall - body_pcb_cutoff_d,
    body_wall + bluepill_bottom_gpio_pins_base_offset.y - body_gpio_pins_cutoff_label,
    0
  ])
    cube([
      body_pcb_cutoff_d + bluepill_pcb.x + body_pcb_cutoff_d,
      bluepill_top_gpio_pins_base_offset.y + bluepill_gpio_pins_base.y + body_gpio_pins_cutoff_label - (bluepill_bottom_gpio_pins_base_offset.y - body_gpio_pins_cutoff_label),
      bluepill_pcb.z + bluepill_oscillator.z
    ]);
}

// ****************************************************************************
// USB CUTOFF
// ****************************************************************************
module _body_usb_cutoff() {
  d = 0.5;
  translate([
    -E,
    body_wall + (bluepill_pcb.y - d - bluepill_usb.y - d) / 2,
    -E
  ])
    cube([
      bluepill_usb.x + E,
      d + bluepill_usb.y + d,
      bluepill_pcb.z + bluepill_usb.z + d + E
    ]);
}

// ****************************************************************************
// SWD CUTOFF
// ****************************************************************************
module _body_swd_cutoff() {
  d = 0.5;
  translate([
    body_wall + bluepill_pcb.x + body_wall - bluepill_swd_pins.x + E,
    body_wall + (bluepill_pcb.y - d - bluepill_swd_pins.y - d) / 2,
    -E
  ])
    cube([
      bluepill_swd_pins.x + E,
      d + bluepill_swd_pins.y + d,
      bluepill_pcb.z + bluepill_swd_pins.z + d + E
    ]);
}
