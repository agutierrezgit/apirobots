json.array! @robots do |robot|
  json.extract! robot, :id, :name, :robot_type, :serial_number
end