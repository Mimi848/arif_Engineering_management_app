json.extract! project_material, :id, :name, :purchase_date, :per_unit_price, :quantity, :total_cost, :category, :project_id, :created_at, :updated_at
json.url project_material_url(project_material, format: :json)
