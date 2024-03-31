return {
  ["and"] = (function(a)
    return function(b)
      local result = 0
      local bitval = 1
      while a > 0 and b > 0 do
        if a % 2 == 1 and b % 2 == 1 then -- test the rightmost bits
          result = result + bitval -- set the current bit
        end
        bitval = bitval * 2 -- shift left
        a = math.floor(a / 2) -- shift right
        b = math.floor(b / 2)
      end
      return result
    end
  end),
  ["or"] = (function(a)
    return function(b)
      local result = 0
      local bitval = 1
      while a > 0 or b > 0 do
        if a % 2 == 1 or b % 2 == 1 then result = result + bitval end
        bitval = bitval * 2
        a = math.floor(a / 2)
        b = math.floor(b / 2)
      end
      return result
    end
  end),
  xor = (function(a)
    return function(b)
      local result = 0
      local bitval = 1
      while a > 0 or b > 0 do
        if a % 2 ~= b % 2 then result = result + bitval end
        bitval = bitval * 2
        a = math.floor(a / 2)
        b = math.floor(b / 2)
      end
      return result
    end
  end),
  shl = (function(a) return function(b) return a * math.pow(2, b) end end),
  shr = (function(a) return function(b) return math.floor(a / math.pow(2, b)) end end),
  zshr = (function(a) return function(b) return math.floor(a / math.pow(2, b)) end end),
  complement = (function(a) return math.floor(-a - 1) end)
}
