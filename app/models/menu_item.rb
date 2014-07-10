class MenuItem < ActiveRecord::Base
  mount_uploader :picture, MenuItemPictureUploader

  def to_param
    "#{id}-#{name.parameterize}"
  end

end
