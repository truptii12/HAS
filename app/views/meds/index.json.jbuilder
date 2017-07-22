json.array!(@meds) do |med|
  json.extract! med, :id, :firstname, :lastname, :cost
  json.url med_url(med, format: :json)
end
