import { withPluginApi } from "discourse/lib/plugin-api";

export default {
  name: "academic-courses-profile-tab",
  initialize() {
    withPluginApi("1.2.0", (api) => {
      // Registers the tab under /users/:username/courses
      // The second argument 'courses' is automatically prefixed by the router
      api.addProfileRoute("academic-courses", "courses", "academic_courses.tab_title");
    });
  }
};