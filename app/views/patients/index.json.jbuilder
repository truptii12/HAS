json.array!(@patients) do |patient|
  json.extract! patient, :id, :name, :email, :BOB
  json.url patient_url(patient, format: :json)
end
