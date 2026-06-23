module Jobs
  class AcademicMetricsCompiler < ::Jobs::Scheduled
    every 1.day

    def execute(args)
      # Background compilation of aggregate metrics
      total_courses = AcademicCourse.count
      active_academics = AcademicProfileField.where.not(orcid_id: nil).count
      
      Discourse.redis.set('academic_metrics_total_courses', total_courses)
      Discourse.redis.set('academic_metrics_active_academics', active_academics)
    end
  end
end