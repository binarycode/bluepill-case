include <_const.scad>;

module bluepill() {
  _bluepill_pcb();

  translate([
    0,
    0,
    bluepill_pcb.z - E
  ]) {
    _bluepill_usb();
    _bluepill_jumpers();
    _bluepill_reset();
    _bluepill_mcu();
    _bluepill_oscillator();
    _bluepill_psu();
    _bluepill_leds();
    _bluepill_swd_pins();
    _bluepill_gpio_pins();
  }
}

// ****************************************************************************
// PCB
// ****************************************************************************
bluepill_pcb = [
  53,
  23,
  4
];
module _bluepill_pcb() {
  color("blue")
    cube(bluepill_pcb);
}

// ****************************************************************************
// USB
// ****************************************************************************
bluepill_usb = [
  6,
  8,
  2.5
];
module _bluepill_usb() {
  bluepill_usb_offset = [
    0,
    (bluepill_pcb.y - bluepill_usb.y) / 2,
    0
  ];
  color("silver")
    translate(bluepill_usb_offset)
      cube(bluepill_usb);
}

// ****************************************************************************
// JUMPERS
// ****************************************************************************
bluepill_jumpers = [
  8,
  5,
  8
];
bluepill_jumpers_offset = [
  8,
  12,
  0
];
module _bluepill_jumpers() {
  color("gold")
    translate(bluepill_jumpers_offset)
      cube(bluepill_jumpers);
}

// ****************************************************************************
// RESET BUTTON
// ****************************************************************************
bluepill_reset = [
  6,
  3,
  5
];
bluepill_reset_offset = [
  9,
  6,
  0
];
module _bluepill_reset() {
  color("white")
    translate(bluepill_reset_offset)
      cube(bluepill_reset);
}

// ****************************************************************************
// MCU
// ****************************************************************************
module _bluepill_mcu() {
  bluepill_mcu = [
    7,
    7,
    2
  ];
  bluepill_mcu_offset = [
    26,
    7,
    0
  ];
  color("black")
    translate(bluepill_mcu_offset)
      rotate(45)
        cube(bluepill_mcu);
}

// ****************************************************************************
// OSCILLATOR
// ****************************************************************************
bluepill_oscillator = [
  4,
  11,
  4
];
bluepill_oscillator_offset = [
  33,
  (bluepill_pcb.y - bluepill_oscillator.y) / 2,
  0
];
module _bluepill_oscillator() {
  color("silver")
    translate(bluepill_oscillator_offset)
      cube(bluepill_oscillator);
}

// ****************************************************************************
// PSU
// ****************************************************************************
module _bluepill_psu() {
  bluepill_psu = [
    3,
    8,
    3
  ];
  bluepill_psu_offset = [
    38,
    (bluepill_pcb.y - bluepill_psu.y) / 2,
    0
  ];
  color("black") {
    translate(bluepill_psu_offset)
      cube(bluepill_psu);
  }
}

// ****************************************************************************
// LEDS
// ****************************************************************************
module _bluepill_leds() {
  bluepill_pc13_led_offset = [
    43.5,
    8,
    0
  ];
  bluepill_power_led_offset = [
    43.5,
    14,
    0
  ];
  bluepill_led = [
    1.5,
    2,
    1
  ];
  color("lime")
    translate(bluepill_pc13_led_offset)
      cube(bluepill_led);
  color("red")
    translate(bluepill_power_led_offset)
      cube(bluepill_led);
}

// ****************************************************************************
// SWD PINS
// ****************************************************************************
bluepill_swd_pins = [
  4,
  10,
  2.75
];
module _bluepill_swd_pins() {
  bluepill_swd_pins_offset = [
    bluepill_pcb.x - bluepill_swd_pins.x,
    (bluepill_pcb.y - bluepill_swd_pins.y) / 2,
    0
  ];
  color("black")
    translate(bluepill_swd_pins_offset)
      cube(bluepill_swd_pins);
}

// ****************************************************************************
// GPIO PINS
// ****************************************************************************
bluepill_gpio_pins_base = [
  51.5,
  2.75,
  2.5
];
bluepill_bottom_gpio_pins_base_offset = [
  0.75,
  2.5,
  0
];
bluepill_top_gpio_pins_base_offset = [
  0.75,
  18,
  0
];
module _bluepill_gpio_pins() {
  bluepill_gpio_pin = [
    0.6,
    0.6,
    8
  ];
  bluepill_gpio_pin_count = 20;
  color("yellow") {
    translate(bluepill_bottom_gpio_pins_base_offset)
      cube(bluepill_gpio_pins_base);
    translate(bluepill_top_gpio_pins_base_offset)
      cube(bluepill_gpio_pins_base);
  }
  color("silver")
    for(i = [0 : (bluepill_gpio_pin_count - 1)]) {
      translate([
        bluepill_bottom_gpio_pins_base_offset.x + bluepill_gpio_pins_base.x * (i + 0.5) / bluepill_gpio_pin_count - bluepill_gpio_pin.x / 2,
        bluepill_bottom_gpio_pins_base_offset.y + bluepill_gpio_pins_base.y / 2 - bluepill_gpio_pin.y / 2,
        0
      ])
        cube(bluepill_gpio_pin);
      translate([
        bluepill_top_gpio_pins_base_offset.x + bluepill_gpio_pins_base.x * (i + 0.5) / bluepill_gpio_pin_count - bluepill_gpio_pin.x / 2,
        bluepill_top_gpio_pins_base_offset.y + bluepill_gpio_pins_base.y / 2 - bluepill_gpio_pin.y / 2,
        0
      ])
        cube(bluepill_gpio_pin);
    }
}
