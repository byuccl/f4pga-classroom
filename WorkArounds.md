# Work-Arounds
Symbiflow is a tool still under development.  The purpose of this study is to identify problems and report them as bugs.

However, some basic issues will be encountered and, without, working around those no designs will work.

This page contains the current work arounds needed to get your esigns to go through.  Hopefully the list will stay VERY short.

## 1. Clocking Statement in .xdc Files
The clocking statement used to set the clock period to 100MHz is this:
```
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk}]
```

However, Symbiflow cannot parse that entire command.  The workaround is to replace it with this:
```
create_clock -period 10.0 [get_ports {clk}]
```

