class Mixtape < ActiveRecord::Base
  belongs_to :user

  def self.upload(file, user)

    name =  file['datafile'].original_filename
    directory = "public/mixtapes/" + user.uid

    # create directory if it doesn't exists
    Dir.mkdir(directory) unless File.exists?(directory)

    # create the file path
    path = File.join(directory, name)

    # write the filed
    File.open(path, "wb") { |f| f.write(file['datafile'].read) }

    sanitize_name = File.basename(name, ".*").humanize

    # create db entry
    user.mixtapes.create(title:sanitize_name,src:name)
  end

end
