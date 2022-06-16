module Support
  module Feature
    module HelperMethods
      def sign_in_as(name: 'User Name')
        visit sign_in_path
        within("#session") do
          fill_in 'name', with: name
        end
        click_button 'Go!'
      end

      def as_user(name) 
        # this helper lets us do things as various users in the same test
        Capybara.using_session(name) do
          sign_in_as(name: name)
          yield
        end
      end
    end
  end
end

