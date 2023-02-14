json.extract! project, :id, :project_id, :identificator, :budget, :category, :classification, :group, :number, :name, :code, :description, :start, :end, :duration, :routine, :delivery, :scale, :sorting, :status, :percentage, :manager, :supervisor, :account_id, :created_at, :updated_at
json.url project_url(project, format: :json)
json.description project.description.to_s
