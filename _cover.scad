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
  body_wall
];
module _cover_base() {
  cube(cover_base);
}

// ****************************************************************************
// RIDGE
// ****************************************************************************
cover_ridge_d = 0.2;
module _cover_ridge() {
  cover_ridge_wall = 1;
  cover_ridge = [
    bluepill_pcb.x - 2 * cover_ridge_d,
    bluepill_pcb.y - 2 * cover_ridge_d,
    2
  ];
  translate([
    body_wall + cover_ridge_d,
    body_wall + cover_ridge_d,
    body_wall - E
  ])
    difference() {
      cube([
        cover_ridge.x,
        cover_ridge.y,
        cover_ridge.z + E
      ]);
      translate([
        cover_ridge_wall,
        cover_ridge_wall,
        E
      ])
        cube([
          cover_ridge.x - 2 * cover_ridge_wall,
          cover_ridge.y - 2 * cover_ridge_wall,
          cover_ridge.z + E
        ]);
    }
}

// ****************************************************************************
// USB
// ****************************************************************************
module _cover_usb() {
  cover_usb_d = 0.1;
  cover_usb = [
    body_wall + cover_ridge_d + E,
    body_usb_cutoff_d - cover_usb_d + bluepill_usb.y + body_usb_cutoff_d - cover_usb_d,
    3
  ];
  translate([
    0,
    (cover_base.y - cover_usb.y) / 2,
    cover_base.z - E
  ])
    cube([
      cover_usb.x + E,
      cover_usb.y,
      cover_usb.z + E
    ]);
}

// ****************************************************************************
// SWD
// ****************************************************************************
module _cover_swd() {
  cover_swd_d = 0.1;
  cover_swd = [
    body_wall + cover_ridge_d,
    body_swd_cutoff_d_y - cover_swd_d + bluepill_swd_pins.y + body_swd_cutoff_d_y - cover_swd_d,
    3
  ];
  translate([
    cover_base.x - cover_swd.x - E,
    (cover_base.y - cover_swd.y) / 2,
    cover_base.z - E
  ])
    cube([
      cover_swd.x + E,
      cover_swd.y,
      cover_swd.z + E
    ]);
}
