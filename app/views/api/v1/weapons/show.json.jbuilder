json.array! @weapons do |weapon|
  json.extract! weapon, :id, :name, :weapon_type, :serial_number
end