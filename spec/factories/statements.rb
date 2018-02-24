FactoryBot.define do
  factory :statement do
    evidence "Another thing"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/lawyer.jpg', 'image/jpg')
  end
end
