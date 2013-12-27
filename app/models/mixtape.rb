class Mixtape < ActiveRecord::Base
  belongs_to :user

  def self.upload(file, user)
    name =  file['datafile'].original_filename
    directory = "public/mixtapes/" + user.uid
    # create the file path
    path = File.join(directory, name)
    # write the filed
    File.open(path, "wb") { |f| f.write(file['datafile'].read) }

    user.mixtapes.create(title:name,src:name)
  end
end
