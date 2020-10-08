include <_const.scad>;
include <_bluepill.scad>;
include <_body.scad>;

module cover() {
  _cover_base();
  _cover_ridge();
  _cover_usb();
  _cover_swd();
}

// ****************************************************************************
// BASE
// ****************************************************************************
cover_base = [
  body_wall + bluepill_pcb.x + body_wall,
  body_wall + bluepill_pcb.y + body_wall,
  1
];
module _cover_base() {
  cube(cover_base);
}

// ****************************************************************************
// RIDGE
// ****************************************************************************
module _cover_ridge() {
  cover_ridge = [
    bluepill_pcb.x,
    1,
    1.5
  ];
  cover_ridge_d = 0.25;
  translate([
    (cover_base.x - cover_ridge.x) / 2,
    body_wall + cover_ridge_d,
    cover_base.z - E
  ])
    cube(cover_ridge);

  translate([
    (cover_base.x - cover_ridge.x) / 2,
    cover_base.y - body_wall - cover_ridge_d - cover_ridge.y,
    cover_base.z - E
  ])
    cube(cover_ridge);
}

// ****************************************************************************
// USB
// ****************************************************************************
module _cover_usb() {
  cover_usb_d = 0.3;
  cover_usb = [
    body_wall - cover_usb_d,
    body_usb_cutoff_d - cover_usb_d + bluepill_usb.y + body_usb_cutoff_d - cover_usb_d,
    3
  ];
  translate([
    0,
    (cover_base.y - cover_usb.y) / 2,
    cover_base.z - E
  ])
    cube(cover_usb);
}

// ****************************************************************************
// SWD
// ****************************************************************************
module _cover_swd() {
  cover_swd_d = 0.3;
  cover_swd = [
    body_wall - cover_swd_d,
    body_swd_cutoff_d_y - cover_swd_d + bluepill_swd_pins.y + body_swd_cutoff_d_y - cover_swd_d,
    3
  ];
  translate([
    cover_base.x - cover_swd.x,
    (cover_base.y - cover_swd.y) / 2,
    cover_base.z - E
  ])
    cube(cover_swd);
}
