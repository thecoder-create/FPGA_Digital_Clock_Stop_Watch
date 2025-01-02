# FPGA_Digital_Clock_Stop_Watch

This README provides an overview of the `Top` module, which combines multiple submodules to implement a digital clock with seven-segment display functionality. The design integrates clock division, digit selection, and binary-coded decimal (BCD) to seven-segment display conversion.

## Overview

The `Top` module orchestrates the following components:
- **Clock Division**: Generates different clock signals for refreshing the display and timing the digital clock.
- **Digital Clock**: Tracks hours, minutes, and seconds.
- **Digit Display Control**: Selects which digit is active on the display.
- **BCD Control**: Maps the active digit's value to the corresponding seven-segment display.
- **BCD to 7-Segment Conversion**: Converts BCD values into cathode signals for the display.

## Inputs and Outputs

### Inputs:
- **`clk`**: The primary clock signal for the system.
- **`en`**: Enable signal for the digital clock.
- **`reset`**: Resets the digital clock to zero.
- **`HourP`**: Increment hours.
- **`minuteP`**: Increment minutes.

### Outputs:
- **`cathode [7:0]`**: Cathode signals for the seven-segment display.
- **`AN [7:0]`**: Anode signals for selecting active segments.

## Internal Wires

- **`s1, s2`**: BCD digits for seconds (tens and ones).
- **`m1, m2`**: BCD digits for minutes (tens and ones).
- **`h1, h2`**: BCD digits for hours (tens and ones).
- **`DP`**: Digit selection signals.
- **`display`**: Active BCD digit.
- **`New_clk`**: Clock signal for refreshing the display.
- **`Time_clk`**: Clock signal for timing the digital clock.

## Submodules

### 1. **Clock Division (`Clock_div`)**
- Generates clock signals for different purposes:
  - **`New_clk`**: For refreshing the display.
  - **`Time_clk`**: For updating the digital clock values.

### 2. **Digital Clock (`Digital_Clock`)**
- Manages the tracking of hours, minutes, and seconds.
- Outputs BCD values for each time unit.

### 3. **Digit Display (`Digit_Display`)**
- Cycles through active digits (seconds, minutes, hours) and determines which digit to display.

### 4. **BCD Control (`BCD_control`)**
- Routes the appropriate BCD value to the output based on the active digit.
- Controls anode signals to select the active segment.

### 5. **BCD to 7-Segment Conversion (`BCD_To_7seg`)**
- Converts BCD values to seven-segment cathode signals for display.

## Operation

1. The `Clock_div` module generates two clock signals:
   - **`New_clk`** for refreshing the display.
   - **`Time_clk`** for updating the digital clock.
2. The `Digital_Clock` module tracks the current time and outputs BCD values for hours, minutes, and seconds.
3. The `Digit_Display` module cycles through the digits and determines which digit is active.
4. The `BCD_control` module selects the active BCD value and determines the corresponding anode signals.
5. The `BCD_To_7seg` module converts the selected BCD value to cathode signals for display.

## Usage

- Connect the `clk` signal to the main clock source.
- Use `en` to start the clock.
- Use `reset` to reset the clock to zero.
- Use `HourP` and `minuteP` to manually increment hours and minutes.
- The outputs (`cathode` and `AN`) drive the seven-segment display.

## Notes

- The `Clock_div` parameters (e.g., `200` and `4000000`) can be adjusted to modify the refresh rate and clock timing.
- Ensure proper connections for all inputs and outputs to integrate the module into your system.

## Dependencies

- `Clock_div` module
- `Digital_Clock` module
- `Digit_Display` module
- `BCD_control` module
- `BCD_To_7seg` module

