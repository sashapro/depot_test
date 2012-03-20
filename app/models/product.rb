# == Schema Information
#
# Table name: products
#
#  id          :integer(4)      not null, primary key
#  title       :string(255)
#  description :text
#  image_url   :string(255)
#  price       :decimal(8, 2)
#  author      :string(255)
#  publisher   :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Product < ActiveRecord::Base
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item


  validates :title,       presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :image_url,   presence: true
  validates :price,       presence: true
  validates :author,      presence: true, length: { maximum: 100 }
  PUBLISHER = %w(pub1 pub2 pub3 pub4 pub5)
  validates :publisher,   presence: true, inclusion: { in: PUBLISHER, message: "%{value} is not a valid, choose from #{PUBLISHER}" }

  private
# ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end

end
