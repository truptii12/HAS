json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :appointmentdate, :startTime, :comment, :patient_id, :doctor_id
  json.url appointment_url(appointment, format: :json)
end
