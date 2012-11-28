# encoding: utf-8

# Admin
admin = User.new(name: "Kasper Helweg Jonassen", email: "kasper@gmail.dk", password: "123456", password_confirmation: "123456")
admin.organization = Organization.first
admin.build_profile
admin.role = "SuperUser"
admin.confirmed_at = Time.now
admin.save


# Org Admin
manager = User.new(name: "Henrik Helweg", email: "henrik@gmail.dk", password: "123456", password_confirmation: "123456")
manager.organization = Organization.first
manager.build_profile
manager.role = "Admin"
manager.confirmed_at = Time.now
manager.save

# Org employee
employee = User.new(name: "Stinne Tarp", email: "stinne@gmail.dk", password: "123456", password_confirmation: "123456")
employee.organization = Organization.first
employee.build_profile
employee.role = "User"
employee.confirmed_at = Time.now
employee.save


