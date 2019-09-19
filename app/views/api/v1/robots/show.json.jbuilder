json.extract! @robot, :id, :name, :robot_type, :serial_number

json.weapons @robot.weapons do |weapon|
    json.extract! weapon, :id, :weapon_type, :serial_number
end

json.weapons @robot.armors do |armor|
    json.extract! armor, :id, :armor_type, :serial_number
end