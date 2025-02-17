# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.delete_all
#
Product.create!(title: 'Design and Build Great Web APIs',
            description:
            %{<p>
                <em>Robust, Reliable, and Resilient</em>
                APIs are transforming the business world at an increasing 
                pace. Gain the essential skills needed to quickly design, 
                build, and deploy quality web APIs that are robust, reliable,
                and resilient. Go from initial design through prototyping 
                and implementation to deployment of mission-critical APIs 
                for your organization. Test, secure, and deploy your API 
                with confidence and avoid the “release into production” 
                panic. Tackle just about any API challenge with more than
                a dozen open-source utilities and common programming 
                patterns you can apply right away.
            </p>},
            image_url: 'maapis (1).jpg',
            price: 29.99)
#
Product.create!(title: 'Seven Mobile Apps in Seven Weeks',
            description:
            %{<p>
                <em>Native Apps, Multiple Platforms</em>
                Answer the question “Can we build this for ALL the devices?”
                with a resounding YES. Learn how to build apps using seven
                different platforms: Mobile Web, iOS, Android, Windows, 
                RubyMotion, React Native, and Xamarin. Find out which 
                cross-platform solution makes the most sense for your 
                needs, whether you’re new to mobile or an experienced 
                developer expanding your options. Start covering all of 
                the mobile world today.
            </p>},
            image_url: 'lorem (1).jpg',
            price: 24.99)

           
            
