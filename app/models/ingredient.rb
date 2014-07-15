class Ingredient < ActiveRecord::Base
  belongs_to :menu_item
end
