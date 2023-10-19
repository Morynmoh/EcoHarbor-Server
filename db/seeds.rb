# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Department.delete_all

departments_data = [
  { department_name: 'Information Technology', department_code: 'IT01'},
  { department_name: 'Finance', department_code: 'FI02'},
  { department_name: 'Human Resources', department_code: 'HR03'},
  { department_name: 'Operations', department_code: 'OP04'},
  { department_name: 'Facilities Management', department_code: 'FM05'},
  { department_name: 'Procurement', department_code: 'PR06'},
  { department_name: 'Marketing', department_code: 'MA07'},
  { department_name: 'Sales', department_code: 'SA08'},
  { department_name: 'Customer Service', department_code: 'CS09'},
  { department_name: 'Research and Development', department_code: 'RD10'},
  { department_name: 'Legal', department_code: 'LE11'},
  { department_name: 'Quality Assurance', department_code: 'QA12'},
  { department_name: 'Repair and Maintenance', department_code: 'RM7'}
]

Department.create(departments_data)
puts "Created #{Department.count} departments"
