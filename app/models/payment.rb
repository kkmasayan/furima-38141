class Payment < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :prefecture
  belongs_to :buyer
end
