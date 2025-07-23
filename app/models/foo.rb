class Foo < ApplicationRecord
  extend Enumerize
  paginates_per 10
  has_many :bars, inverse_of: :foo
  validates :name, presence: true
  enumerize :status, in: %i[new active closed]

  def self.ransackable_attributes(auth_object = nil)
    [ "checked", "name", "price", "status" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ :bars ]
  end
end
