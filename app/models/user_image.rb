class UserImage < ActiveRecord::Base
  belongs_to :user

  def self.uploadimage(file, user)

    name =  file['datafile'].original_filename
    directory = "public/images/" + user.uid

    # create directory if it doesn't exists
    Dir.mkdir(directory) unless File.exists?(directory)

    # create the file path
    path = File.join(directory, name)

    # write the filed
    File.open(path, "wb") { |f| f.write(file['datafile'].read) }

    name = File.basename(name)

    # create db entry
    user.user_images.create(image_url:name)
  end


end
