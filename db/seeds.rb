# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

#créer docteurs et patients
10.times do 
  doctor = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, speciality: Faker::Job.title, zip_code: Faker::Address.zip_code)
  patient = Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  
end


#créer rdv
80.times do
  the_doctor = Doctor.find(Doctor.pluck(:id).shuffle.first)
  the_patient = Patient.find(Patient.pluck(:id).shuffle.first)
  appointment = Appointment.create!(doctor: the_doctor, patient: the_patient, date:Faker::Date.forward(29))

end

#créer villes
100.times do
  the_doctor = Doctor.find(Doctor.pluck(:id).shuffle.first)
  the_patient = Patient.find(Patient.pluck(:id).shuffle.first)
  the_appointment = Appointment.find(Appointment.pluck(:id).shuffle.first)
  city = City.create!(name: Faker::Address.city, doctor: the_doctor, patient: the_patient, appointment: the_appointment)
end
