
puts 'Creating user..'

user = User.create!( email: 'demo@demo.com', password: '123123')

puts 'Creating robots...'

robot_1 = Robot.create!(name: 'Robocopter', robot_type: 'hackerobot', serial_number: 'R000001', user: user)
robot_2 = Robot.create!(name: 'Robotronic', robot_type: 'protectobot', serial_number: 'R000002', user: user)
robot_3 = Robot.create!(name: 'Robostar', robot_type: 'tacticrobot', serial_number: 'R000003', user: user)

puts 'Creating weapons...'

weapon_1 = Weapon.create!(weapon_type: 'laser', serial_number: 'W000001', robot: robot_1)
weapon_2 = Weapon.create!(weapon_type: 'code', serial_number: 'W000002', robot: robot_2)
weapon_3 = Weapon.create!(weapon_type: 'acid', serial_number: 'W000003', robot: robot_3)

puts 'Creating armors...'

armor_1 = Armor.create!(armor_type: 'shield', serial_number: 'A000001', robot: robot_1)
armor_2 = Armor.create!(armor_type: 'magnetic field', serial_number: 'A000002', robot: robot_2)
armor_3 = Armor.create!(armor_type: 'invisible field', serial_number: 'A000003', robot: robot_3)

puts 'Finished!'
