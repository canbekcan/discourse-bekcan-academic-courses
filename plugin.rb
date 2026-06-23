# name: discourse-bekcan-academic-courses
# about: Academic Course Management Plugin
# version: 0.1
# authors: Can Bekcan
# url: https://github.com/canbekcan/discourse-bekcan-academic-courses

after_initialize do
  # Replace invalid plugin_loaded? with registry check
  if Discourse.plugins.find { |p| p.name == "discourse-academic-profile" }
    add_to_serializer(:user, :academic_courses) do
      object.academic_courses
    end
  end
end