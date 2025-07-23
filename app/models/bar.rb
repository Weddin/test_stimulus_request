class Bar < ApplicationRecord
  paginates_per 10
  belongs_to :foo, inverse_of: :bars
  validates :name, presence: true

  def self.ransackable_associations(auth_object = nil)
    [ :foo ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "name", "descriptions", "foo_id" ]
  end
end
