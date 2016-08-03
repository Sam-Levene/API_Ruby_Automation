CAPTURE_INT = Transform (/^(-?\d+)$/) do |number|
  number.to_i
end