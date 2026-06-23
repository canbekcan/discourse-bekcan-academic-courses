# name: discourse-bekcan-academic-courses
# about: Academic Course Management Plugin
# version: 0.1
# authors: Can Bekcan
# url: https://github.com/canbekcan/discourse-bekcan-academic-courses

after_initialize do
  # Fix: Dependency check via registry lookup to prevent load order crashes
  if Discourse.plugins.find { |p| p.name == "discourse-bekcan-academic-profile" }
    add_to_serializer(:user, :academic_courses) do
      object.academic_courses
    end
    
    DiscoursePluginRegistry.serialized_current_user_fields << "academic_courses"
  end
end