class UploadersController < ApplicationController

  def upload_csv

  end

  def upload_data
    if params[:users_by_csv].nil?
      redirect_to upload_csv_path, notice: "Please upload a file to proceed."
    else
      require 'csv'

      csv_text = File.read(params[:users_by_csv][:uploaded_file].path)
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        User.create(name: row["name"], dob: row["date"], number: row["number"], description: row["description"])
      end
      redirect_to upload_csv_path, notice: "Users data imported to database successfully"
    end
  end
end
