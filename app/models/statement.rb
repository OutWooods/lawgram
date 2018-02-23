class Statement < ApplicationRecord
  has_attached_file :image, styles: { :medium => '640'}


end
