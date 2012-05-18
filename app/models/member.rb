class Member < ActiveRecord::Base
  has_and_belongs_to_many :projects
  
  def save_image(upload)
    if(upload.is_a?(Hash))
      dir = Rails.root.join("public","pics")
      if !File.exists? dir
        Dir.mkdir dir
      end
      if upload[:image_link].class.to_s != "String"
        fname = File.basename(upload[:image_link].original_filename)
        fname.gsub!(/^\w\.\_/,"_")
        path = File.join(dir, fname)
        File.open(path,"wb") {|f| f.write(upload[:image_link].read) }
        upload[:image_link] = fname
      end
    end
  end
end
