json.array!(@doctors) do |doctor|
  json.extract! doctor, :id, :dname, :email, :default_appoinment_duration
  json.url doctor_url(doctor, format: :json)
end
