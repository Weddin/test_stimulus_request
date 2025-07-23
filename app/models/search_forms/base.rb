class SearchForms::Base
  include ActiveModel::Model
  include ActiveModel::Attributes


  attribute :search, :string

  attribute :q, :string
end
