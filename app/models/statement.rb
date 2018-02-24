class Statement < ApplicationRecord
  has_attached_file :image, styles: { :medium => '640'}

 validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
end
