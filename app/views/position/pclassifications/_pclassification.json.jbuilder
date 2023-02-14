json.extract! pclassification, :id, :name, :description, :value, :position_id, :created_at, :updated_at
json.url position_pclassification_url(pclassification, format: :json)
