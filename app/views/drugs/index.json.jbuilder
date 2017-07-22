json.array!(@drugs) do |drug|
  json.extract! drug, :id, :firstname, :lastname, :firm, :cost, :description, :age
  json.url drug_url(drug, format: :json)
end
