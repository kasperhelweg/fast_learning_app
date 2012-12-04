# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require File.expand_path('../seeds/application_pages', __FILE__)

# Organizations
require File.expand_path('../seeds/orgs', __FILE__)

# Users
require File.expand_path('../seeds/users', __FILE__)

# Courses
require File.expand_path('../seeds/courses', __FILE__)

# Learning Plans & Products
require File.expand_path('../seeds/learning_plans', __FILE__)
require File.expand_path('../seeds/products', __FILE__)

# Classrooms
require File.expand_path('../seeds/classrooms', __FILE__)

# Den svære samtale
require File.expand_path('../seeds/class_5_1', __FILE__)

# Invitations
#require File.expand_path('../seeds/invitations', __FILE__)
