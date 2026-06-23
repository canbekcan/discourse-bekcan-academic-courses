module AcademicCourses
  class MetricsController < ::ApplicationController
    requires_plugin 'discourse-academic-courses'

    def index
      # Apply x06d rule: Deintroduce dynamic SQL from foreground actions; retrieve cached state
      total_courses = Discourse.redis.get('academic_metrics_total_courses') || 0
      active_academics = Discourse.redis.get('academic_metrics_active_academics') || 0

      render json: { 
        total_courses: total_courses.to_i, 
        active_academics: active_academics.to_i 
      }
    end
  end
end