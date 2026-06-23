after_initialize do
  # Apply x05d rule: Explicit load order guard to prevent cross-plugin dependency failures
  if plugin_loaded?('discourse-academic-profile')
    add_to_serializer(:user, :academic_courses) do
      object.academic_courses
    end
    
    DiscoursePluginRegistry.serialized_current_user_fields << "academic_courses"
  end
end