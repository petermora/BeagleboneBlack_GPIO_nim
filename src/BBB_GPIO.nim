import BBB_Pins, json, os

# BBB filesystem mapping
let
  sys_gpio_path = r"/sys/class/gpio/"
  exp_file = r"export"
  direction_file = r"direction"
  edge_file = r"edge"
  value_file = r"value"

proc pinMode(pin: string): bool =
  var file = open(sys_gpio_path & exp_file, fmWrite)

  file.close()
#end

proc initGPIO*(): bool =
  discard
#end

# Testing
when isMainModule:
  assert(BBB_Pins.getPinData("P8_3")["key"].str == "P8_3")
  try:
    discard BBB_Pins.getPinData("bla")["key"].str
  except ValueError:
    assert (true)
  #end

  assert ($BBB_Pins.getPinData("P9_42", "eeprom") == "4")

  repr (BBB_Pins.getPinData("P9_42", "eeprom"))
#end