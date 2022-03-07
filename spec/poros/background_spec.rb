require 'rails_helper'

describe Background do
  it 'has attributes' do
    data = {
            :id=>"EiqW4dMAOx8",
            :created_at=>"2021-10-14T15:29:54-04:00",
            :updated_at=>"2022-03-06T00:25:48-05:00",
            :promoted_at=>nil,
            :width=>6000,
            :height=>2996,
            :color=>"#404040",
            :blur_hash=>"LqB4k6XUWAoflCozjYj]ksocWVWV",
            :description=>"This is the view near the top of McClure Pass at almost 9,000 feet.  This pass is north east of Montrose, CO and south of Glenwood Springs, CO.",
            :alt_description=>nil,
            :urls=>
            {:raw=>
            "https://images.unsplash.com/photo-1634239615990-6407c337f443?ixid=MnwzMDc2Mzl8MHwxfHNlYXJjaHwxfHxtb250cm9zZSUyQ2NvfGVufDB8fHx8MTY0NjYyOTU4OA&ixlib=rb-1.2.1",
            :full=>
            "https://images.unsplash.com/photo-1634239615990-6407c337f443?crop=entropy&cs=srgb&fm=jpg&ixid=MnwzMDc2Mzl8MHwxfHNlYXJjaHwxfHxtb250cm9zZSUyQ2NvfGVufDB8fHx8MTY0NjYyOTU4OA&ixlib=rb-1.2.1&q=85",
            :regular=>
            "https://images.unsplash.com/photo-1634239615990-6407c337f443?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMDc2Mzl8MHwxfHNlYXJjaHwxfHxtb250cm9zZSUyQ2NvfGVufDB8fHx8MTY0NjYyOTU4OA&ixlib=rb-1.2.1&q=80&w=1080",
            :small=>
            "https://images.unsplash.com/photo-1634239615990-6407c337f443?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMDc2Mzl8MHwxfHNlYXJjaHwxfHxtb250cm9zZSUyQ2NvfGVufDB8fHx8MTY0NjYyOTU4OA&ixlib=rb-1.2.1&q=80&w=400",
            :thumb=>
            "https://images.unsplash.com/photo-1634239615990-6407c337f443?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMDc2Mzl8MHwxfHNlYXJjaHwxfHxtb250cm9zZSUyQ2NvfGVufDB8fHx8MTY0NjYyOTU4OA&ixlib=rb-1.2.1&q=80&w=200",
            :small_s3=>"https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1634239615990-6407c337f443"},
            :links=>
            {:self=>"https://api.unsplash.com/photos/EiqW4dMAOx8",
            :html=>"https://unsplash.com/photos/EiqW4dMAOx8",
            :download=>"https://unsplash.com/photos/EiqW4dMAOx8/download?ixid=MnwzMDc2Mzl8MHwxfHNlYXJjaHwxfHxtb250cm9zZSUyQ2NvfGVufDB8fHx8MTY0NjYyOTU4OA",
            :download_location=>"https://api.unsplash.com/photos/EiqW4dMAOx8/download?ixid=MnwzMDc2Mzl8MHwxfHNlYXJjaHwxfHxtb250cm9zZSUyQ2NvfGVufDB8fHx8MTY0NjYyOTU4OA"},
            :categories=>[],
            :likes=>0,
            :liked_by_user=>false,
            :current_user_collections=>[],
            :sponsorship=>nil,
            :topic_submissions=>{},
            :user=>
            {:id=>"uD-EbrR33PE",
            :updated_at=>"2022-03-06T21:51:47-05:00",
            :username=>"stp_com",
            :name=>"Tim Peterson",
            :first_name=>"Tim",
            :last_name=>"Peterson",
            :twitter_username=>nil,
            :portfolio_url=>nil,
            :bio=>
            "I enjoy sharing the beauty from my part of the world, and viewing the photos other photographers have shared on Unsplash. Many of those astonishing places I will only visit thru those photos, in my lifetime. I am greatly appreciative. \r\n",
            :location=>"Ogden Utah",
            :links=>
            {:self=>"https://api.unsplash.com/users/stp_com",
             :html=>"https://unsplash.com/@stp_com",
             :photos=>"https://api.unsplash.com/users/stp_com/photos",
             :likes=>"https://api.unsplash.com/users/stp_com/likes",
             :portfolio=>"https://api.unsplash.com/users/stp_com/portfolio",
             :following=>"https://api.unsplash.com/users/stp_com/following",
             :followers=>"https://api.unsplash.com/users/stp_com/followers"},
            :profile_image=>
            {:small=>"https://images.unsplash.com/profile-1636225971898-0d7ce05b718dimage?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
             :medium=>"https://images.unsplash.com/profile-1636225971898-0d7ce05b718dimage?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
             :large=>"https://images.unsplash.com/profile-1636225971898-0d7ce05b718dimage?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"},
            :instagram_username=>nil,
            :total_collections=>17,
            :total_likes=>104,
            :total_photos=>480,
            :accepted_tos=>true,
            :for_hire=>false,
            :social=>{:instagram_username=>nil, :portfolio_url=>nil, :twitter_username=>nil, :paypal_email=>nil}},
            :tags=>[{:type=>"search", :title=>"montrose"}, {:type=>"search", :title=>"co"}, {:type=>"search", :title=>"usa"}]}

    photo= Background.new(data)
    expect(photo.description).to eq("This is the view near the top of McClure Pass at almost 9,000 feet.  This pass is north east of Montrose, CO and south of Glenwood Springs, CO.")
    expect(photo.image_url).to eq("https://images.unsplash.com/photo-1634239615990-6407c337f443?crop=entropy&cs=srgb&fm=jpg&ixid=MnwzMDc2Mzl8MHwxfHNlYXJjaHwxfHxtb250cm9zZSUyQ2NvfGVufDB8fHx8MTY0NjYyOTU4OA&ixlib=rb-1.2.1&q=85")
    expect(photo.site).to eq("www.unsplash.com")
    expect(photo.photographer).to eq("Tim Peterson")
    expect(photo.photographer_site).to eq("https://unsplash.com/@stp_com")
  end
end
