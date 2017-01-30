local Pin
do
  local _class_0
  local _base_0 = {
    on = function(self)
      return gpio.write(self.pin, 0)
    end,
    off = function(self)
      return gpio.write(self.pin, 1)
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, pin)
      gpio.mode(pin, 1)
      self.pin = pin
    end,
    __base = _base_0,
    __name = "Pin"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Pin = _class_0
  return _class_0
end
