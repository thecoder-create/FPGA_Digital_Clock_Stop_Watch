# FPGA_Digital_Clock_Stop_Watch

## Overview
This project implements a digital clock  in Verilog. The module is designed to keep track of hours, minutes, and seconds, with options to manually adjust the time and reset it. The clock outputs its time in Binary-Coded Decimal (BCD) format for display purposes.

## Features
- Keeps track of seconds, minutes, and hours.
- Supports a 24-hour format.
- Manual adjustment options for hours and minutes.
- Reset functionality to reset the time to 00:00:00.
- Outputs time in BCD format for integration with display systems.

## Module Ports
### Inputs:
- **clk**: Clock signal input.
- **en**: Enable signal to start/stop the clock.
- **reset**: Reset signal to initialize the time to 00:00:00.
- **HourP**: Signal to manually increment the hour.
- **minuteP**: Signal to manually increment the minute.

### Outputs:
- **s1**: BCD output for the first digit of seconds.
- **s2**: BCD output for the second digit of seconds.
- **m1**: BCD output for the first digit of minutes.
- **m2**: BCD output for the second digit of minutes.
- **h1**: BCD output for the first digit of hours.
- **h2**: BCD output for the second digit of hours.

## Functional Description
1. **Time Tracking**:
   - Uses three 6-bit registers to store hours, minutes, and seconds.
   - The clock counts seconds and increments minutes and hours as needed.

2. **Reset Functionality**:
   - When the `reset` signal is active, the time resets to 00:00:00.

3. **Manual Adjustments**:
   - The `HourP` signal increments the hour by 1, wrapping back to 0 after 23.
   - The `minuteP` signal increments the minute by 1, wrapping back to 0 after 59.

4. **BCD Conversion**:
   - Time values (seconds, minutes, hours) are converted to BCD format using instances of the `Binary_to_BCD` module for display purposes.

5. **Clock Enable**:
   - When `en` is active, the clock starts counting.
   - A slower internal clock is derived to control the counting frequency.

## Dependencies
- **Binary_to_BCD Module**:
  - Converts binary values to BCD format.
  - Instances:
    - `secs`: Converts seconds.
    - `mins`: Converts minutes.
    - `hours`: Converts hours.

## Limitations
- This module assumes a clock frequency and a division mechanism to create a 1-second tick. Ensure the input `clk` matches the required frequency.
- Manual adjustments (`HourP` and `minuteP`) do not check for simultaneous activations.

## Usage
1. Connect the clock signal to the `clk` input.
2. Use the `en` signal to start or stop the clock.
3. Reset the time using the `reset` input.
4. Use the `HourP` and `minuteP` inputs for manual adjustments.
5. Connect the BCD outputs (`s1`, `s2`, `m1`, `m2`, `h1`, `h2`) to a display system.

## Example
Here is an example of connecting the Digital_Clock module:
```verilog
Digital_Clock myClock (
    .clk(system_clk),
    .en(enable_signal),
    .reset(reset_signal),
    .HourP(increment_hour),
    .minuteP(increment_minute),
    .s1(seconds_first_digit),
    .s2(seconds_second_digit),
    .m1(minutes_first_digit),
    .m2(minutes_second_digit),
    .h1(hours_first_digit),
    .h2(hours_second_digit)
);
```


