onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib cm3_core_opt

do {wave.do}

view wave
view structure
view signals

do {cm3_core.udo}

run -all

quit -force
