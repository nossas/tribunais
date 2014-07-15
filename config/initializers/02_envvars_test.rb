if Rails.env.test?
  ENV["TEST_EMAIL"] = "nicolas@test.com"
  ENV["CODECLIMATE_REPO_TOKEN"] = "230c18c8de99e52184928304c7773b3db571d0f9b4c50ffbb7d9975c671bd2b2"
end
