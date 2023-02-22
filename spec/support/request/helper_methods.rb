module Support
  module Request
    module HelperMethods
      def as_logged_in_user(name: Faker::Name.first_name)
        post session_path, params: {name: name}
        yield
      end
    end
  end
end
