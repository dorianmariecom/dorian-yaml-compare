# frozen_string_literal: true

require "spec_helper"
require "tempfile"

RSpec.describe "yaml-compare" do
  it "works" do
    tempfile_en = Tempfile.create
    File.write(tempfile_en, <<~YAML)
      en:
        users: Users
        projects: Projects
    YAML

    tempfile_fr = Tempfile.create
    File.write(tempfile_fr, <<~YAML)
      fr:
        users: Utilisateurs
        tasks: Tâches
    YAML

    expect do
      system("bin/yaml-compare #{tempfile_en.path} #{tempfile_fr.path} en fr")
    end.to output(<<~OUTPUT).to_stderr_from_any_process
      missing key "projects" from #{tempfile_fr.path}
      missing key "tasks" from #{tempfile_en.path}
    OUTPUT
  ensure
    begin
      File.delete(tempfile_en)
    rescue StandardError
      nil
    end
    begin
      File.delete(tempfile_fr)
    rescue StandardError
      nil
    end
  end
end
