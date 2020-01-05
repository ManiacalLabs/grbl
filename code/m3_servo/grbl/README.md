A basic config for a 2-axis machine with servo control that responds to M3 and M5 power commands.
Heavily based on https://github.com/cprezzi/grbl-servo with some improvements.

Note: Laser mode **must** be disabled ($32=0) and M4 power commands will not work. Set your gcode generator appropriately to ensure that it only uses M3.

The servo position will be proportional to the power setting used.
For example (assuming `$30=1000` in grbl config):
- `M3 S0` or `M5` is servo at "neutral" position
- `M3 S500` is half extended
- `M3 S1000` is full extension as defined by `RC_SERVO_LONG` in `spindle_control.c`