json.array! @robots do |robot|
  json.extract! robot, :id, :name, :type, :serial_number
end