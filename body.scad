include <_bluepill.scad>;
include <_body.scad>;

/*show_bluepill = true;*/
show_bluepill = false;
if (show_bluepill) {
  translate([
    body_wall,
    body_wall,
    0
  ])
    bluepill();
}

body();
