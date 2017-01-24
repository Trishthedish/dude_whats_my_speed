# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'CSV'
#
# CSV.foreach('seed_csvs/users_cap.csv') do |csv_obj|
#   User.create(id: csv_obj[0].to_i, name: csv_obj[1], monthly_cost: csv_obj[2], paid_download: csv_obj[3], paid_upload: csv_obj[4], area_code: csv_obj[5], service_provider: csv_obj[6])
# end
#
# # need to add paid ping field to users model. Then add it to csv file and updaate the importing of it.
# CSV.foreach('seed_csvs/rasberrypi_cap.csv') do |csv_obj|
#   RasberryPi.create(id:csv_obj[0].to_i, ping: csv_obj[1], download: csv_obj[2], upload: csv_obj[3], user_id: csv_obj[4])
# end
