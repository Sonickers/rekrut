def difference(digit_sum)
  diff = 10 - (digit_sum % 10)
  diff == 10 ? 0 : diff
end

def prop_barcode(barcode, type)
  barcode_length =
      case type
      when 1
        8
      when 2
        13
      else
        raise ArgumentError.new("Only type 1 and 2 allowed.")
      end

  if barcode.size == (barcode_length - 1)
    barcode = "0" + barcode
  elsif barcode.size < (barcode_length - 1)
    raise ArgumentError.new("Barcode too short.")
  end

  barcode = barcode.slice(0...barcode_length)

  checksum = barcode[-1]
  barcode[-1] = ""
  digit_sum = 0

  barcode.each_char.with_index(1) do |digit, index|
    if index % 2 == 0
      digit_sum += digit.to_i
    else
      digit_sum += digit.to_i * 3
    end
  end

  diff = difference(digit_sum)
  unless diff == checksum.to_i
    raise ArgumentError.new("Invalid barcode.")
  end

  barcode + checksum
end